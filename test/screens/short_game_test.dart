import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mega_empires_assistant/data/advance_colour.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/data/settings.dart';
import 'package:mega_empires_assistant/data/short_game.dart';
import 'package:mega_empires_assistant/game/advances.dart';
import 'package:mega_empires_assistant/game/game.dart';
import 'package:mega_empires_assistant/game/game_setup.dart';
import 'package:mega_empires_assistant/screens/keys.dart';
import 'package:mega_empires_assistant/screens/short_game.dart';
import 'package:mega_empires_assistant/screens/summary.dart';
import 'package:mega_empires_assistant/screens/widgets/credit_list_tile.dart';

import '../utils/test_utils.dart';

void main() {
  initTests();

  for (var game in [Game.eastern, Game.western]) {
    for (var numberOfPlayers = 3; numberOfPlayers < 10; numberOfPlayers++) {
      testWidgets('$numberOfPlayers player options for $game', (tester) async {
        await tester.pumpWidget(prepareWidget(ShortGameScreen(
            state: GameState(
                additionalCredits: {},
                purchasedAdvances: {},
                tradeGoods: {},
                advancesInCart: {},
                settings: Settings(
                    numberOfPlayers: numberOfPlayers,
                    games: {game},
                    setup: GameSetup.short)))));

        await expectLater(
            find.byType(ShortGameScreen),
            matchesGoldenFile(
                'golden/short_game_screen_${numberOfPlayers}_player_${game.name}.png'));
      });
    }
  }

  for (var numberOfPlayers = 10; numberOfPlayers < 19; numberOfPlayers++) {
    testWidgets('$numberOfPlayers player options', (tester) async {
      await tester.pumpWidget(prepareWidget(ShortGameScreen(
          state: GameState(
              additionalCredits: {},
              purchasedAdvances: {},
              tradeGoods: {},
              advancesInCart: {},
              settings: Settings(
                  numberOfPlayers: numberOfPlayers,
                  games: {Game.eastern, Game.western},
                  setup: GameSetup.short)))));

      await expectLater(
          find.byType(ShortGameScreen),
          matchesGoldenFile(
              'golden/short_game_screen_${numberOfPlayers}_player.png'));
    });
  }

  testWidgets('defaults to nothing selected', (tester) async {
    await tester.pumpWidget(prepareWidget(ShortGameScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 7,
                games: {Game.western},
                setup: GameSetup.short)))));

    final state =
        tester.state<ShortGameScreenState>(find.byType(ShortGameScreen));
    expect(state.selectedScenario, isNull);
  });

  testWidgets('Cannot continue with no scenario selected', (tester) async {
    await tester.pumpWidget(prepareWidget(ShortGameScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.western},
                setup: GameSetup.short)))));
    testNavigator.reset();

    await tester.tap(find.byKey(startButton));
    await tester.pumpAndSettle();

    // We haven't moved screen
    expect(testNavigator.latestPushed, isNull);
  });

  var scenarioPlayerCount = {
    ScenarioKey.coinAndCommerce: 9,
    ScenarioKey.exploringTheDeserts: 9,
    ScenarioKey.mysticalPlaces: 3,
    // Last one so can fall off the end of the list
    ScenarioKey.sacredConstructors: 9,
    ScenarioKey.earlyMerchants: 9,
    ScenarioKey.culturalHeights: 9,
    ScenarioKey.spreadingKnowledge: 9,
    // ScenarioKey.conqueringTheSeas, // Not included because we need to set additional credits
    ScenarioKey.emergingEmpire: 9
  };

  for (var i in scenarioPlayerCount.entries) {
    final scenario = indexedScenarios[i.key]!;
    testWidgets('Continue with ${scenario.name} - sets correct advances',
        (tester) async {
      await tester.pumpWidget(prepareWidget(ShortGameScreen(
          state: GameState(
              additionalCredits: {},
              purchasedAdvances: {},
              tradeGoods: {},
              advancesInCart: {},
              settings: Settings(
                  numberOfPlayers: i.value,
                  games: {Game.western},
                  setup: GameSetup.short)))));

      await tester.tap(find.byKey(Key("scenario_${i.key.name}")));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(startButton));
      await tester.pumpAndSettle();

      final expectedCredits = calculateExpectedCredits(scenario);
      expect(find.byType(SummaryScreen), findsOneWidget);
      final summaryState =
          tester.state<SummaryScreenState>(find.byType(SummaryScreen));
      expect(summaryState.credits, equals(expectedCredits));
      expect(
          summaryState.widget.state.advancesInCart
              .map((e) => e.advance.key)
              .toSet(),
          equals(scenario.advances));
    });
  }

  testWidgets('Continue with Conquering the seas - sets correct advances',
      (tester) async {
    final scenario = indexedScenarios[ScenarioKey.conqueringTheSeas]!;

    await tester.pumpWidget(prepareWidget(ShortGameScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.western},
                setup: GameSetup.short)))));

    await tester.tap(find.byKey(Key("scenario_${scenario.key.name}")));
    await tester.pumpAndSettle();

    // Add 10 red credits
    await tester.tap(find.byKey(increaseButtonKey(AdvanceColour.red)));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(increaseButtonKey(AdvanceColour.red)));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(startButton));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(startButton));
    await tester.pumpAndSettle();

    final expectedCredits = calculateExpectedCredits(scenario);
    expectedCredits[AdvanceColour.red] =
        expectedCredits[AdvanceColour.red]! + 10;
    expect(find.byType(SummaryScreen), findsOneWidget);
    final summaryState =
        tester.state<SummaryScreenState>(find.byType(SummaryScreen));
    expect(summaryState.credits, equals(expectedCredits));
    expect(
        summaryState.widget.state.advancesInCart
            .map((e) => e.advance.key)
            .toSet(),
        equals(scenario.advances));
  });

  testWidgets('Continue - also passes credits coming from new game screen',
      (tester) async {
    final scenario = indexedScenarios[ScenarioKey.earlyMerchants]!;

    await tester.pumpWidget(prepareWidget(ShortGameScreen(
        state: GameState(
            additionalCredits: {AdvanceColour.red: 10},
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 6,
                games: {Game.western},
                setup: GameSetup.short)))));

    await tester.tap(find.byKey(Key("scenario_${scenario.key.name}")));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(startButton));
    await tester.pumpAndSettle();

    final expectedCredits = calculateExpectedCredits(scenario);
    expectedCredits[AdvanceColour.red] =
        expectedCredits[AdvanceColour.red]! + 10;
    expect(find.byType(SummaryScreen), findsOneWidget);
    final summaryState =
        tester.state<SummaryScreenState>(find.byType(SummaryScreen));
    expect(summaryState.credits, equals(expectedCredits));
    expect(
        summaryState.widget.state.advancesInCart
            .map((e) => e.advance.key)
            .toSet(),
        equals(scenario.advances));
  });
}

Map<AdvanceColour, int> calculateExpectedCredits(Scenario scenario) {
  Map<AdvanceColour, int> credits = {for (var e in AdvanceColour.values) e: 0};

  for (var advanceKey in scenario.advances) {
    indexedAdvances[advanceKey]!.discounts.forEach((key, value) {
      credits[key] = credits[key]! + value;
    });
  }

  return credits;
}
