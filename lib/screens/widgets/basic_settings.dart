import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/game/game.dart';
import 'package:mega_empires_assistant/game/game_setup.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';

/// Widget allowing customisation of basic settings such as the number of players and game setup
final class BasicGameSettingsWidget extends StatelessWidget {
  /// Enabled Games
  final Set<Game> enabledGames;

  /// Callback when the enabled games changes
  final Function(Set<Game>) onEnabledGamesChanged;

  /// Basic game setup
  final GameSetup gameSetup;

  /// Callback when the game setup changes
  final Function(GameSetup) onGameSetupChanged;

  /// Number of players chosen by the player. Note that this can exceed the valid number of players
  /// for the selected games - and only the maximum value for the selected games will be shown.
  final int chosenNumberOfPlayers;

  /// Callback when number of players changes
  final Function(int) onChosenNumberOfPlayersChanged;

  const BasicGameSettingsWidget(
      {super.key,
      required this.enabledGames,
      required this.onEnabledGamesChanged,
      required this.gameSetup,
      required this.onGameSetupChanged,
      required this.chosenNumberOfPlayers,
      required this.onChosenNumberOfPlayersChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(S.of(context).games,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          SegmentedButton<Game>(
            segments: <ButtonSegment<Game>>[
              ButtonSegment<Game>(
                  value: Game.western,
                  label: Text(S.of(context).westernEmpires)),
              ButtonSegment<Game>(
                  value: Game.eastern,
                  label: Text(S.of(context).easternEmpires)),
            ],
            selected: enabledGames,
            onSelectionChanged: (Set<Game> newSelection) {
              onEnabledGamesChanged(newSelection);
            },
            multiSelectionEnabled: true,
            emptySelectionAllowed: true,
          ),
          Text(S.of(context).setup,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          SegmentedButton<GameSetup>(
            segments: <ButtonSegment<GameSetup>>[
              ButtonSegment<GameSetup>(
                  value: GameSetup.short, label: Text(S.of(context).shortGame)),
              ButtonSegment<GameSetup>(
                  value: GameSetup.expert,
                  label: Text(S.of(context).expertGame)),
            ],
            selected: {gameSetup},
            onSelectionChanged: (Set<GameSetup> newSelection) {
              if (newSelection.isEmpty) {
                onGameSetupChanged(GameSetup.normal);
              } else {
                onGameSetupChanged(newSelection.first);
              }
            },
            multiSelectionEnabled: false,
            emptySelectionAllowed: true,
          ),
          Text(
              S.of(context).settingsPlayers(
                  min(getMaxPlayers(enabledGames), chosenNumberOfPlayers)),
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Slider(
            value: min(getMaxPlayers(enabledGames).toDouble(),
                chosenNumberOfPlayers.toDouble()),
            max: getMaxPlayers(enabledGames).toDouble(),
            label: chosenNumberOfPlayers.toString(),
            onChanged: (double value) {
              onChosenNumberOfPlayersChanged(value.toInt());
            },
          ),
        ]);
  }
}

/// The maximum players valid for the combination of games
int getMaxPlayers(Set<Game> enabledGames) {
  return enabledGames.length * 9;
}

/// True if the game settings are valid
bool gameSettingsAreValid(
    {required Set<Game> enabledGames, required int numberOfPlayers}) {
  final maxPlayers = getMaxPlayers(enabledGames);

  if (maxPlayers == 0) {
    return false;
  }

  if (numberOfPlayers < 3 || numberOfPlayers > maxPlayers) {
    return false;
  }

  return true;
}
