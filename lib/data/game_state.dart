import 'dart:convert';
import 'dart:math';

import 'package:mega_empires_assistant/data/advance.dart';
import 'package:mega_empires_assistant/data/advance_colour.dart';
import 'package:mega_empires_assistant/data/purchased_advance.dart';
import 'package:mega_empires_assistant/data/settings.dart';
import 'package:mega_empires_assistant/game/advances.dart';
import 'package:mega_empires_assistant/game/trade_goods.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'trade_goods.dart';

/// Representation of the overall game state
final class GameState {
  /// Additional credits given for reasons other than purchased advances
  final Map<AdvanceColour, int> additionalCredits;

  /// All already purchased advances
  final Set<PurchasedAdvance> purchasedAdvances;

  /// Trade goods held in hand
  final Map<TradeGood, int> tradeGoods;

  /// Advances which are in cart ready to be purchased
  final Set<PurchasedAdvance> advancesInCart;

  /// Game settings
  final Settings settings;

  /// All credits including purchased advances and other reasons
  late final Map<AdvanceColour, int> totalCredits;

  GameState(
      {required this.additionalCredits,
      required this.purchasedAdvances,
      required this.tradeGoods,
      required this.advancesInCart,
      required this.settings}) {
    totalCredits = {for (var e in AdvanceColour.values) e: 0};
    additionalCredits.forEach((key, value) {
      totalCredits[key] = totalCredits[key]! + value;
    });

    for (PurchasedAdvance purchasedAdvance in purchasedAdvances) {
      purchasedAdvance.credits().forEach((colour, count) {
        totalCredits[colour] = totalCredits[colour]! + count;
      });
    }

    // Whenever we create a new game state we can save it for restoring later
    SharedPreferences.getInstance()
        .then((value) => {value.setString("gameState", jsonEncode(this))});
  }

  GameState withAdvances(Set<PurchasedAdvance> purchasedAdvances) {
    return GameState(
        additionalCredits: additionalCredits,
        purchasedAdvances: purchasedAdvances,
        tradeGoods: tradeGoods,
        advancesInCart: advancesInCart,
        settings: settings);
  }

  GameState withAdditionalCredits(Map<AdvanceColour, int> additionalCredits) {
    return GameState(
        additionalCredits: additionalCredits,
        purchasedAdvances: purchasedAdvances,
        tradeGoods: tradeGoods,
        advancesInCart: advancesInCart,
        settings: settings);
  }

  GameState withTradeGoods(Map<TradeGood, int> tradeGoods) {
    return GameState(
        additionalCredits: additionalCredits,
        purchasedAdvances: purchasedAdvances,
        tradeGoods: tradeGoods,
        advancesInCart: advancesInCart,
        settings: settings);
  }

  GameState withSettings(Settings settings) {
    return GameState(
        additionalCredits: additionalCredits,
        purchasedAdvances: purchasedAdvances,
        tradeGoods: tradeGoods,
        advancesInCart: advancesInCart,
        settings: settings);
  }

  GameState withAdvancesInCart(Set<PurchasedAdvance> advancesInCart) {
    return GameState(
        additionalCredits: additionalCredits,
        purchasedAdvances: purchasedAdvances,
        tradeGoods: tradeGoods,
        advancesInCart: advancesInCart,
        settings: settings);
  }

  /// Create a new [GameState] moving the advances in cart into the purchases
  GameState asNewRound() {
    return GameState(
        additionalCredits: additionalCredits,
        purchasedAdvances: purchasedAdvances.union(advancesInCart),
        tradeGoods: <TradeGood, int>{},
        advancesInCart: <PurchasedAdvance>{},
        settings: settings);
  }

  /// Get the total cost of advances in cart, considering discounts and credits
  int get totalCostOfAdvancesInCart {
    return advancesInCart.fold(
        0, (a, b) => a + b.advance.calculateModifiedCost(this));
  }

  /// True if the advance is purchased
  bool advanceIsPurchased(AdvanceKey advance) {
    return purchasedAdvances
        .any((purchasedAdvance) => purchasedAdvance.advance.key == advance);
  }

  /// True if the advance is currently in the cart.
  bool advanceIsInCart(AdvanceKey advance) {
    return advancesInCart
        .any((advanceInCart) => advanceInCart.advance.key == advance);
  }

  Advance? mostExpensiveAdvanceInCartExceptLibrary() {
    if (advancesInCart.isEmpty ||
        (advancesInCart.length == 1 &&
            advancesInCart.any((e) => e.advance.key == AdvanceKey.library))) {
      return null;
    }

    return advancesInCart.reduce((a1, a2) {
      if (a1.advance.key == AdvanceKey.library) {
        return a2;
      }
      if (a2.advance.key == AdvanceKey.library) {
        return a1;
      }

      if (a1.advance.calculateModifiedCostAccountingForAnatomy(this) >
          a2.advance.calculateModifiedCostAccountingForAnatomy(this)) {
        return a1;
      }
      return a2;
    }).advance;
  }

  Advance? mostExpensiveUnmodifiedGreenAdvanceInCartUnder100() {
    if (advancesInCart.isEmpty) {
      return null;
    }

    PurchasedAdvance advance = advancesInCart.reduce((a1, a2) {
      if ((a1.advance.colour1 != AdvanceColour.green &&
              a1.advance.colour2 != AdvanceColour.green) ||
          (a1.advance.price >= 100)) {
        return a2;
      }
      if ((a2.advance.colour1 != AdvanceColour.green &&
              a2.advance.colour2 != AdvanceColour.green) ||
          (a2.advance.price >= 100)) {
        return a1;
      }

      if (a1.advance.price > a2.advance.price) {
        return a1;
      }
      return a2;
    });

    if ((advance.advance.colour1 != AdvanceColour.green &&
            advance.advance.colour2 != AdvanceColour.green) ||
        (advance.advance.price >= 100)) {
      return null;
    }

    return advance.advance;
  }

  /// The number of cards to be discarded with the current state
  int get cardsToDiscard {
    final handLimit = (((settings.numberOfPlayers > 11) ? 9 : 8) +
            purchasedAdvances
                .map((e) => e.advance.handLimitModifier)
                .fold(0, (p, e) => p + e) +
            advancesInCart
                .map((e) => e.advance.handLimitModifier)
                .fold(0, (p, e) => p + e))
        .toInt();

    return max(
        0,
        tradeGoods.entries
                .where((element) => element.key != TradeGood.treasuryToken)
                .fold(0, (a, b) => a + b.value) -
            handLimit);
  }

  factory GameState.fromJson(Map<String, dynamic> data) => GameState(
      additionalCredits: data["additionalCredits"].map<AdvanceColour, int>(
              (String key, dynamic value) =>
                  MapEntry(advanceColourFromEnColourName(key), value as int))
          as Map<AdvanceColour, int>,
      purchasedAdvances: Set.of(data["purchasedAdvances"]
          .map<PurchasedAdvance>((dynamic s) => PurchasedAdvance.fromJson(s))
          .toList() as List<PurchasedAdvance>),
      tradeGoods: data["tradeGoods"].map<TradeGood, int>((String key, dynamic value) => MapEntry(indexedTradeGoods[TradeGoodKey.values.byName(key)]!, value as int))
          as Map<TradeGood, int>,
      settings: Settings.fromJson(data["settings"]),
      advancesInCart: {}); // We don't restore advancesInCart because we'll reload on the first screen

  Map<String, dynamic> toJson() => {
        'additionalCredits': additionalCredits
            .map((key, value) => MapEntry(key.enColourName, value)),
        'purchasedAdvances': purchasedAdvances.toList(),
        'tradeGoods':
            tradeGoods.map((key, value) => MapEntry(key.key.name, value)),
        'settings': settings.toJson(),
        'advancesInCart': advancesInCart.toList()
      };
}
