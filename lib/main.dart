import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mega_empires_assistant/data/purchased_advance.dart';

import 'data/advance_colour.dart';
import 'generated/l10n.dart';
import 'screens/main_menu.dart';
import 'screens/trade_goods.dart';


// TODO: Implement short game rules
// TODO: Implement first game rules
// TODO: Refactor - tidy up the code - enabling dart linting - remove (significant) duplication
// TODO: Implement calamities screen
// TODO: Add tests - the logic in some places has a lot of special cases and it'd be good to double check it all
void main() => runApp(WesternEmpiresAssistant());

const START_CREDITS = {
  AdvanceColour.yellow: 0,
  AdvanceColour.green: 0,
  AdvanceColour.blue: 0,
  AdvanceColour.red: 0,
  AdvanceColour.orange: 0
};

class Settings {
  final int numberOfPlayers;
  final Set<Game> games;
  final GameSetup setup;

  Settings({required this.numberOfPlayers, required this.games, required this.setup}) {}

  factory Settings.fromJson(Map<String,dynamic> data) => Settings(
      numberOfPlayers: data["numberOfPlayers"] as int,
      games: (data["games"] as String).split(",").map((e) => Game.values[int.parse(e)]).toSet(),
      setup: GameSetup.values[data["setup"]]
  );

  Map<String,dynamic> toJson() => {
    'numberOfPlayers': numberOfPlayers,
    'games': games.map((e) => Game.values.indexOf(e)).join(","),
    "setup": GameSetup.values.indexOf(setup)
  };
}

class GameState {
  final Map<AdvanceColour, int> additionalCredits;
  final Set<PurchasedAdvance> purchasedAdvances;

  final Map<TradeGood, int> tradeGoods;
  final Set<PurchasedAdvance> advancesInCart;

  final Settings settings;

  late final Map<AdvanceColour, int> totalCredits;

  GameState({required this.additionalCredits, required this.purchasedAdvances, required this.tradeGoods, required this.advancesInCart, required this.settings}) {
    totalCredits = Map.of(additionalCredits);

    if (settings.setup != GameSetup.SHORT) {
      if (settings.numberOfPlayers == 12) {
        totalCredits.forEach((colour, count) {
          totalCredits[colour] = count + 5;
        });
      }
      if (settings.numberOfPlayers == 6) {
        totalCredits.forEach((colour, count) {
          totalCredits[colour] = count + 5;
        });
      } else if (settings.numberOfPlayers == 5) {
        totalCredits.forEach((colour, count) {
          totalCredits[colour] = count + 10;
        });
      }
    }

    // Even in the short game we get the bonus for 3 and 4
    if (settings.numberOfPlayers == 4) {
      totalCredits.forEach((colour, count) {
        totalCredits[colour] = count + 5;
      });
    } else if (settings.numberOfPlayers == 3) {
      totalCredits.forEach((colour, count) {
        totalCredits[colour] = count + 10;
      });
    }

    for (PurchasedAdvance purchasedAdvance in purchasedAdvances) {
      purchasedAdvance.credits().forEach((colour, count) {
        totalCredits[colour] = totalCredits[colour]! + count;
      });
    }

    // Whenever we create a new gamestate we can save it for restoring later
    SharedPreferences.getInstance().then(
            (value) => {
              value.setString("gameState", jsonEncode(this))
            });
  }

  GameState withAdvances(Set<PurchasedAdvance> purchasedAdvances) {
    return GameState(additionalCredits: additionalCredits, purchasedAdvances: purchasedAdvances, tradeGoods: tradeGoods, advancesInCart: advancesInCart, settings: settings);
  }

  GameState withAdditionalCredits(Map<AdvanceColour, int> additionalCredits) {
    return GameState(additionalCredits: additionalCredits, purchasedAdvances: purchasedAdvances, tradeGoods: tradeGoods, advancesInCart: advancesInCart, settings: settings);
  }

  GameState withTradeGoods(Map<TradeGood, int> tradeGoods) {
    return GameState(additionalCredits: additionalCredits, purchasedAdvances: purchasedAdvances, tradeGoods: tradeGoods, advancesInCart: advancesInCart, settings: settings);
  }

  GameState withSettings(Settings settings) {
    return GameState(additionalCredits: additionalCredits, purchasedAdvances: purchasedAdvances, tradeGoods: tradeGoods, advancesInCart: advancesInCart, settings: settings);
  }

  GameState withAdvancesInCart(Set<PurchasedAdvance> advancesInCart) {
    return GameState(additionalCredits: additionalCredits, purchasedAdvances: purchasedAdvances, tradeGoods: tradeGoods, advancesInCart: advancesInCart, settings: settings);
  }

  GameState asNewRound() {
    return GameState(additionalCredits: additionalCredits, purchasedAdvances: purchasedAdvances.union(advancesInCart), tradeGoods: Map(), advancesInCart: Set(), settings: settings);
  }

  factory GameState.fromJson(Map<String,dynamic> data) => GameState(
      additionalCredits: data["additionalCredits"].map<AdvanceColour, int>((String key, dynamic value) => MapEntry(advanceColourFromEnColourName(key), value as int)) as Map<AdvanceColour, int>,
      purchasedAdvances: Set.of(data["purchasedAdvances"].map<PurchasedAdvance>((dynamic s) => PurchasedAdvance.fromJson(s)).toList() as List<PurchasedAdvance>),
      tradeGoods: data["tradeGoods"].map<TradeGood, int>((String key, dynamic value) => MapEntry(INDEXED_TRADEGOODS[key]!, value as int)) as Map<TradeGood, int>,
      settings: Settings.fromJson(data["settings"]),
      advancesInCart: {}); // We don't restore advancesInCart because we'll reload on the first screen

  Map<String,dynamic> toJson() => {
    'additionalCredits': additionalCredits.map((key, value) => MapEntry(key.enColourName, value)),
    'purchasedAdvances': purchasedAdvances.toList(),
    'tradeGoods': tradeGoods.map((key, value) => MapEntry(key.title, value)),
    'settings': settings.toJson(),
    'advancesInCart': advancesInCart.toList()
  };
}

class WesternEmpiresAssistant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mega Empires Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMenu(),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales
    );
  }
}

enum Game {
  EASTERN,
  WESTERN,
  ANY
}

enum GameSetup {
  NORMAL,
  SHORT
}