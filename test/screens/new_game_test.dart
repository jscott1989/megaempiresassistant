import 'package:flutter_test/flutter_test.dart';
import 'package:mega_empires_assistant/data/advance_colour.dart';
import 'package:mega_empires_assistant/game/game.dart';
import 'package:mega_empires_assistant/game/game_setup.dart';
import 'package:mega_empires_assistant/screens/new_game.dart';
import 'package:mega_empires_assistant/screens/short_game.dart';
import 'package:mega_empires_assistant/screens/summary.dart';
import 'package:mega_empires_assistant/screens/trade_goods.dart';
import 'package:mega_empires_assistant/screens/widgets/keys.dart';

import '../utils/test_utils.dart';

void main() {
  initTests();

  testWidgets('Start UI', (tester) async {
    await tester.pumpWidget(prepareWidget(const NewGameScreen()));

    await expectLater(find.byType(NewGameScreen),
        matchesGoldenFile('golden/new_game_screen_default.png'));
  });

  testWidgets('UI with state', (tester) async {
    await tester.pumpWidget(prepareWidget(const NewGameScreen()));
    final state = tester.state<NewGameScreenState>(find.byType(NewGameScreen));
    state.setState(() {
      state.enabledGames = {Game.eastern};
      state.potentialNumberOfPlayers = 7;
      state.gameSetup = GameSetup.short;
    });
    await tester.pumpAndSettle();

    await expectLater(find.byType(NewGameScreen),
        matchesGoldenFile('golden/new_game_screen_with_state.png'));
  });

  testWidgets('Start with no games selected', (tester) async {
    await tester.pumpWidget(prepareWidget(const NewGameScreen()));
    final state = tester.state<NewGameScreenState>(find.byType(NewGameScreen));

    expect(state.enabledGames, isEmpty);
  });

  testWidgets('Start with game setup normal', (tester) async {
    await tester.pumpWidget(prepareWidget(const NewGameScreen()));
    final state = tester.state<NewGameScreenState>(find.byType(NewGameScreen));

    expect(state.gameSetup, equals(GameSetup.normal));
  });

  testWidgets('Start with 0 players', (tester) async {
    await tester.pumpWidget(prepareWidget(const NewGameScreen()));
    final state = tester.state<NewGameScreenState>(find.byType(NewGameScreen));

    expect(state.numberOfPlayers, equals(0));
    expect(state.potentialNumberOfPlayers, equals(0));
  });

  testWidgets('Cannot start with no game selected', (tester) async {
    await tester.pumpWidget(prepareWidget(const NewGameScreen()));
    final state = tester.state<NewGameScreenState>(find.byType(NewGameScreen));
    state.setState(() {
      state.potentialNumberOfPlayers = 7;
    });
    await tester.pumpAndSettle();
    testNavigator.reset();

    await tester.tap(find.byKey(startButton));
    await tester.pumpAndSettle();

    // We haven't moved screen
    expect(testNavigator.latestPushed, isNull);
  });

  testWidgets("Passes normal game setup to next screen", (tester) async {
    await tester.pumpWidget(prepareWidget(const NewGameScreen()));
    final state = tester.state<NewGameScreenState>(find.byType(NewGameScreen));
    state.setState(() {
      state.enabledGames = {Game.eastern};
      state.gameSetup = GameSetup.normal;
      state.potentialNumberOfPlayers = 8;
    });
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(startButton));
    await tester.pumpAndSettle();

    // We have moved screen
    expect(find.byType(NewGameScreen), findsNothing);
    final gameState = findGameState(tester, find);
    expect(gameState.settings.setup, equals(GameSetup.normal));
  });

  testWidgets("Passes expert game setup to next screen", (tester) async {
    await tester.pumpWidget(prepareWidget(const NewGameScreen()));
    final state = tester.state<NewGameScreenState>(find.byType(NewGameScreen));
    state.setState(() {
      state.enabledGames = {Game.eastern};
      state.gameSetup = GameSetup.expert;
      state.potentialNumberOfPlayers = 8;
    });
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(startButton));
    await tester.pumpAndSettle();

    // We have moved screen
    expect(find.byType(NewGameScreen), findsNothing);
    final gameState = findGameState(tester, find);
    expect(gameState.settings.setup, equals(GameSetup.expert));
  });

  group('Single-game selected', () {
    for (var game in [Game.eastern, Game.western]) {
      group('$game', () {
        group('Cannot start with less than 3 players selected', () {
          for (int i = 0; i < 3; i++) {
            testWidgets('Cannot start with $i players selected',
                (tester) async {
              await tester.pumpWidget(prepareWidget(const NewGameScreen()));
              final state =
                  tester.state<NewGameScreenState>(find.byType(NewGameScreen));
              state.setState(() {
                state.enabledGames = {game};
                state.potentialNumberOfPlayers = i;
              });
              await tester.pumpAndSettle();
              testNavigator.reset();

              await tester.tap(find.byKey(startButton));
              await tester.pumpAndSettle();

              // We haven't moved screen
              expect(testNavigator.latestPushed, isNull);
            });
          }
        });

        testWidgets(
            'Pressing start button with valid setup moves to next screen',
            (tester) async {
          await tester.pumpWidget(prepareWidget(const NewGameScreen()));
          final state =
              tester.state<NewGameScreenState>(find.byType(NewGameScreen));
          state.setState(() {
            state.enabledGames = {game};
            state.potentialNumberOfPlayers = 3;
          });
          await tester.pumpAndSettle();

          await tester.tap(find.byKey(startButton));
          await tester.pumpAndSettle();

          // We have moved screen
          expect(find.byType(NewGameScreen), findsNothing);
        });

        /// Play of players to expected number of starting credits (in non-short-game)
        final expectedCredits = {3: 10, 4: 5, 5: 10, 6: 5};

        group('Starting credits', () {
          for (var entry in expectedCredits.entries) {
            testWidgets(
                "Pressing start button with ${entry.key} players asks the player to pick up ${entry.value} credits in each colour",
                (tester) async {
              final expectedCredits = {
                AdvanceColour.green: entry.value,
                AdvanceColour.blue: entry.value,
                AdvanceColour.red: entry.value,
                AdvanceColour.orange: entry.value,
                AdvanceColour.yellow: entry.value
              };
              await tester.pumpWidget(prepareWidget(const NewGameScreen()));
              final state =
                  tester.state<NewGameScreenState>(find.byType(NewGameScreen));
              state.setState(() {
                state.enabledGames = {game};
                state.potentialNumberOfPlayers = entry.key;
              });
              await tester.pumpAndSettle();

              await tester.tap(find.byKey(startButton));
              await tester.pumpAndSettle();

              // We have moved screen
              expect(find.byType(SummaryScreen), findsOneWidget);
              final summaryState =
                  tester.state<SummaryScreenState>(find.byType(SummaryScreen));
              expect(summaryState.credits, equals(expectedCredits));
            });
          }
        });

        group('No starting credits', () {
          for (var numberOfPlayers = 7;
              numberOfPlayers < 10;
              numberOfPlayers++) {
            testWidgets(
                "Pressing start button with $numberOfPlayers players does not give bonus credits",
                (tester) async {
              await tester.pumpWidget(prepareWidget(const NewGameScreen()));
              final state =
                  tester.state<NewGameScreenState>(find.byType(NewGameScreen));
              state.setState(() {
                state.enabledGames = {game};
                state.potentialNumberOfPlayers = numberOfPlayers;
              });
              await tester.pumpAndSettle();

              await tester.tap(find.byKey(startButton));
              await tester.pumpAndSettle();

              // We have moved screen
              expect(find.byType(SelectTradeGoodsScreen), findsOneWidget);
              final totalCredits = findGameState(tester, find)
                  .totalCredits
                  .values
                  .fold(0, (a, b) => a + b);
              expect(totalCredits, equals(0));
            });
          }
        });

        for (var numberOfPlayers = 10;
            numberOfPlayers < 19;
            numberOfPlayers++) {
          testWidgets(
              "Passes 9 players to next screen (selected $numberOfPlayers)",
              (tester) async {
            await tester.pumpWidget(prepareWidget(const NewGameScreen()));
            final state =
                tester.state<NewGameScreenState>(find.byType(NewGameScreen));
            state.setState(() {
              state.enabledGames = {game};
              state.potentialNumberOfPlayers = numberOfPlayers;
            });
            await tester.pumpAndSettle();

            await tester.tap(find.byKey(startButton));
            await tester.pumpAndSettle();

            // We have moved screen
            expect(find.byType(NewGameScreen), findsNothing);
            final gameState = findGameState(tester, find);
            expect(gameState.settings.numberOfPlayers, equals(9));
          });
        }
      });
    }
  });

  group("Short Game", () {
    group('Both games selected', () {
      for (var numberOfPlayers = 10; numberOfPlayers < 19; numberOfPlayers++) {
        testWidgets("Passes $numberOfPlayers players to next screen",
            (tester) async {
          await tester.pumpWidget(prepareWidget(const NewGameScreen()));
          final state =
              tester.state<NewGameScreenState>(find.byType(NewGameScreen));
          state.setState(() {
            state.gameSetup = GameSetup.short;
            state.enabledGames = {Game.eastern, Game.western};
            state.potentialNumberOfPlayers = numberOfPlayers;
          });
          await tester.pumpAndSettle();

          await tester.tap(find.byKey(startButton));
          await tester.pumpAndSettle();

          // We have moved screen
          expect(find.byType(NewGameScreen), findsNothing);
          expect(find.byType(ShortGameScreen), findsOneWidget);
          final gameState = findGameState(tester, find);
          expect(gameState.settings.numberOfPlayers, equals(numberOfPlayers));
        });
      }
    });

    group('Single-game selected', () {
      for (var game in [Game.eastern, Game.western]) {
        group('$game', () {
          group('Cannot start with less than 3 players selected', () {
            for (int i = 0; i < 3; i++) {
              testWidgets('Cannot start with $i players selected',
                  (tester) async {
                await tester.pumpWidget(prepareWidget(const NewGameScreen()));
                final state = tester
                    .state<NewGameScreenState>(find.byType(NewGameScreen));
                state.setState(() {
                  state.gameSetup = GameSetup.short;
                  state.enabledGames = {game};
                  state.potentialNumberOfPlayers = i;
                });
                await tester.pumpAndSettle();
                testNavigator.reset();

                await tester.tap(find.byKey(startButton));
                await tester.pumpAndSettle();

                // We haven't moved screen
                expect(testNavigator.latestPushed, isNull);
              });
            }
          });

          for (int numberOfPlayers = 4;
              numberOfPlayers < 10;
              numberOfPlayers++) {
            testWidgets(
                'Pressing start button with $numberOfPlayers players moves to next screen',
                (tester) async {
              await tester.pumpWidget(prepareWidget(const NewGameScreen()));
              final state =
                  tester.state<NewGameScreenState>(find.byType(NewGameScreen));
              state.setState(() {
                state.gameSetup = GameSetup.short;
                state.enabledGames = {game};
                state.potentialNumberOfPlayers = numberOfPlayers;
              });
              await tester.pumpAndSettle();

              await tester.tap(find.byKey(startButton));
              await tester.pumpAndSettle();

              // We have moved screen
              expect(find.byType(NewGameScreen), findsNothing);
              expect(find.byType(ShortGameScreen), findsOneWidget);
              final gameState = findGameState(tester, find);
              expect(
                  gameState.settings.numberOfPlayers, equals(numberOfPlayers));
            });
          }

          /// Play of players to expected number of starting credits (in short-game)
          final expectedCredits = {3: 10, 4: 5, 5: 0, 6: 0, 7: 0, 8: 0, 9: 0};

          group('Starting credits', () {
            for (var entry in expectedCredits.entries) {
              testWidgets(
                  "Pressing start button with ${entry.key} players asks the player to pick up ${entry.value} credits in each colour",
                  (tester) async {
                final expectedCredits = {
                  AdvanceColour.green: entry.value,
                  AdvanceColour.blue: entry.value,
                  AdvanceColour.red: entry.value,
                  AdvanceColour.orange: entry.value,
                  AdvanceColour.yellow: entry.value
                };
                await tester.pumpWidget(prepareWidget(const NewGameScreen()));
                final state = tester
                    .state<NewGameScreenState>(find.byType(NewGameScreen));
                state.setState(() {
                  state.gameSetup = GameSetup.short;
                  state.enabledGames = {game};
                  state.potentialNumberOfPlayers = entry.key;
                });
                await tester.pumpAndSettle();

                await tester.tap(find.byKey(startButton));
                await tester.pumpAndSettle();

                // We have moved screen
                expect(find.byType(ShortGameScreen), findsOneWidget);
                final gameState = findGameState(tester, find);
                expect(gameState.additionalCredits, equals(expectedCredits));
              });
            }
          });
        });
      }
    });
  });

  group("Both games selected", () {
    group("passes correct player count", () {
      for (var numberOfPlayers = 10; numberOfPlayers < 19; numberOfPlayers++) {
        testWidgets("Passes $numberOfPlayers players to next screen",
            (tester) async {
          await tester.pumpWidget(prepareWidget(const NewGameScreen()));
          final state =
              tester.state<NewGameScreenState>(find.byType(NewGameScreen));
          state.setState(() {
            state.enabledGames = {Game.eastern, Game.western};
            state.potentialNumberOfPlayers = numberOfPlayers;
          });
          await tester.pumpAndSettle();

          await tester.tap(find.byKey(startButton));
          await tester.pumpAndSettle();

          // We have moved screen
          expect(find.byType(NewGameScreen), findsNothing);
          final gameState = findGameState(tester, find);
          expect(gameState.settings.numberOfPlayers, equals(numberOfPlayers));
        });
      }
    });

    testWidgets(
        'Cannot start with both games selected and less than 10 players',
        (tester) async {
      await tester.pumpWidget(prepareWidget(const NewGameScreen()));
      final state =
          tester.state<NewGameScreenState>(find.byType(NewGameScreen));
      state.setState(() {
        state.enabledGames = {Game.western, Game.eastern};
        state.potentialNumberOfPlayers = 9;
      });
      await tester.pumpAndSettle();
      testNavigator.reset();

      await tester.tap(find.byKey(startButton));
      await tester.pumpAndSettle();

      // We haven't moved screen
      expect(testNavigator.latestPushed, isNull);
    });
  });
}
