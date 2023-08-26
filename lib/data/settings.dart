import 'package:mega_empires_assistant/game/game.dart';
import 'package:mega_empires_assistant/game/game_setup.dart';

final class Settings {
  final int numberOfPlayers;
  final Set<Game> games;
  final GameSetup setup;

  Settings(
      {required this.numberOfPlayers,
      required this.games,
      required this.setup});

  factory Settings.fromJson(Map<String, dynamic> data) => Settings(
      numberOfPlayers: data["numberOfPlayers"] as int,
      games: (data["games"] as String)
          .split(",")
          .map((e) => Game.values[int.parse(e)])
          .toSet(),
      setup: GameSetup.values[data["setup"]]);

  Map<String, dynamic> toJson() => {
        'numberOfPlayers': numberOfPlayers,
        'games': games.map((e) => Game.values.indexOf(e)).join(","),
        "setup": GameSetup.values.indexOf(setup)
      };
}
