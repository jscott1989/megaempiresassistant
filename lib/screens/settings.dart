import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/data/settings.dart';
import 'package:mega_empires_assistant/game/game.dart';
import 'package:mega_empires_assistant/game/game_setup.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';
import 'package:mega_empires_assistant/screens/widgets/basic_settings.dart';

/// The screen to change overall settings after starting the game
final class EditSettingsScreen extends StatefulWidget {
  final GameState state;
  final Function(GameState) update;

  const EditSettingsScreen(
      {Key? key, required this.state, required this.update})
      : super(key: key);

  @override
  EditSettingsScreenState createState() => EditSettingsScreenState();
}

class EditSettingsScreenState extends State<EditSettingsScreen> {
  /// The games which are being played
  var enabledGames = <Game>{};

  /// The setup for the game
  var gameSetup = GameSetup.normal;

  /// The potential number of players if supported by the enabled games
  var potentialNumberOfPlayers = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    enabledGames = widget.state.settings.games;
    potentialNumberOfPlayers = widget.state.settings.numberOfPlayers;
    gameSetup = widget.state.settings.setup;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).editSettings),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: const Size.fromWidth(100).width),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(""), // Spacer
                  Text(
                    S.of(context).settingsWarningAdvancesCredits,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(""), // Spacer
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
                                      onPressed: (gameSettingsAreValid(
                                              enabledGames: enabledGames,
                                              numberOfPlayers:
                                                  potentialNumberOfPlayers)
                                          ? () {
                                              Navigator.pop(context);
                                              widget.update(widget.state
                                                  .withSettings(Settings(
                                                      numberOfPlayers:
                                                          potentialNumberOfPlayers,
                                                      games: enabledGames,
                                                      setup: gameSetup)));
                                            }
                                          : null),
                                      child: Text(S.of(context).cont))
                                ])
                          ]))
                ])));
  }
}
