import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/data/advance_colour.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/data/settings.dart';
import 'package:mega_empires_assistant/game/game.dart';
import 'package:mega_empires_assistant/game/game_setup.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';
import 'package:mega_empires_assistant/screens/keys.dart';
import 'package:mega_empires_assistant/screens/short_game.dart';
import 'package:mega_empires_assistant/screens/summary.dart';
import 'package:mega_empires_assistant/screens/trade_goods.dart';
import 'package:mega_empires_assistant/screens/widgets/basic_settings.dart';

/// Screen for configuring new game settings
final class NewGameScreen extends StatefulWidget {
  const NewGameScreen({Key? key}) : super(key: key);

  @override
  NewGameScreenState createState() => NewGameScreenState();
}

final class NewGameScreenState extends State<NewGameScreen> {
  /// The games which are being played
  var enabledGames = <Game>{};

  /// The setup for the game
  var gameSetup = GameSetup.normal;

  /// The potential number of players if supported by the enabled games
  var potentialNumberOfPlayers = 0;

  int get numberOfPlayers {
    return min(maxPlayers, potentialNumberOfPlayers);
  }

  int get maxPlayers {
    return getMaxPlayers(enabledGames);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appName),
      ),
      body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: const Size.fromWidth(100).width),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: BasicGameSettingsWidget(
                  enabledGames: enabledGames,
                  onEnabledGamesChanged: (newValue) {
                    setState(() {
                      enabledGames = newValue;
                    });
                  },
                  gameSetup: gameSetup,
                  onGameSetupChanged: (newGameSetup) {
                    setState(() {
                      gameSetup = newGameSetup;
                    });
                  },
                  chosenNumberOfPlayers: potentialNumberOfPlayers,
                  onChosenNumberOfPlayersChanged: (newValue) {
                    setState(() {
                      potentialNumberOfPlayers = newValue;
                    });
                  },
                )),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ButtonBar(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            OutlinedButton(
                                key: startButton,
                                onPressed: (gameSettingsAreValid(
                                        enabledGames: enabledGames,
                                        numberOfPlayers: numberOfPlayers)
                                    ? () {
                                        final startingCredits =
                                            calculateStartingCredits(
                                                numberOfPlayers);

                                        final gameState = GameState(
                                            additionalCredits: startingCredits,
                                            purchasedAdvances: {},
                                            tradeGoods: {},
                                            advancesInCart: {},
                                            settings: Settings(
                                                numberOfPlayers:
                                                    numberOfPlayers,
                                                games: enabledGames,
                                                setup: gameSetup));

                                        if (gameSetup == GameSetup.short) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ShortGameScreen(
                                                          state: gameState)));
                                        } else {
                                          if (gameState.additionalCredits.values
                                                      .reduce((a, b) => a + b) >
                                                  0 ||
                                              gameState
                                                  .advancesInCart.isNotEmpty) {
                                            // We should show the summary so the player picks up the correct stuff
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SummaryScreen(
                                                          state: gameState,
                                                          additionalCredits:
                                                              gameState
                                                                  .additionalCredits,
                                                        )),
                                                (route) => false);
                                          } else {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SelectTradeGoodsScreen(
                                                            state: gameState)),
                                                (route) => false);
                                          }
                                        }
                                      }
                                    : null),
                                child: Text(S.of(context).start))
                          ],
                        )
                      ],
                    )),
              ])),
    );
  }

  /// Calculate the initial credits given to each player for the selected
  /// settings
  Map<AdvanceColour, int> calculateStartingCredits(int numberOfPlayers) {
    final startingCredits = {for (var e in AdvanceColour.values) e: 0};

    if (gameSetup != GameSetup.short) {
      if (numberOfPlayers == 12) {
        startingCredits.forEach((colour, count) {
          startingCredits[colour] = count + 5;
        });
      }
      if (numberOfPlayers == 6) {
        startingCredits.forEach((colour, count) {
          startingCredits[colour] = count + 5;
        });
      } else if (numberOfPlayers == 5) {
        startingCredits.forEach((colour, count) {
          startingCredits[colour] = count + 10;
        });
      }
    }

    // Even in the short game we get the bonus for 3 and 4
    if (numberOfPlayers == 4) {
      startingCredits.forEach((colour, count) {
        startingCredits[colour] = count + 5;
      });
    } else if (numberOfPlayers == 3) {
      startingCredits.forEach((colour, count) {
        startingCredits[colour] = count + 10;
      });
    }
    return startingCredits;
  }
}
