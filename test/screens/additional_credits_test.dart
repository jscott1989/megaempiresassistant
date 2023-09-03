import 'package:flutter_test/flutter_test.dart';
import 'package:mega_empires_assistant/data/advance_colour.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/data/settings.dart';
import 'package:mega_empires_assistant/game/advances.dart';
import 'package:mega_empires_assistant/game/game.dart';
import 'package:mega_empires_assistant/game/game_setup.dart';
import 'package:mega_empires_assistant/screens/additional_credits.dart';
import 'package:mega_empires_assistant/screens/widgets/credit_list_tile.dart';
import 'package:mega_empires_assistant/screens/widgets/keys.dart';

import '../utils/test_utils.dart';

void main() {
  initTests();

  testWidgets('Start UI', (tester) async {
    await tester.pumpWidget(prepareWidget(ChooseAdditionalCreditsScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.eastern},
                setup: GameSetup.normal)),
        mandatoryCredits: {},
        numberOfCredits: 10,
        update: (selectedCredits) {})));

    await expectLater(
        find.byType(ChooseAdditionalCreditsScreen),
        matchesGoldenFile(
            'golden/choose_additional_credits_screen_default.png'));
  });

  testWidgets("Can't continue if we haven't given the correct amount",
      (tester) async {
    var hasCalled = false;
    await tester.pumpWidget(prepareWidget(ChooseAdditionalCreditsScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.eastern},
                setup: GameSetup.normal)),
        mandatoryCredits: {},
        numberOfCredits: 10,
        update: (selectedCredits) {
          hasCalled = true;
        })));

    await tester.tap(find.byKey(startButton));
    await tester.pumpAndSettle();

    expect(hasCalled, equals(false));
  });

  testWidgets("Pressing the decrease button allocates credits", (tester) async {
    await tester.pumpWidget(prepareWidget(ChooseAdditionalCreditsScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.eastern},
                setup: GameSetup.normal)),
        mandatoryCredits: {},
        numberOfCredits: 10,
        update: (selectedCredits) {})));
    final state = tester.state<ChooseAdditionalCreditsScreenState>(
        find.byType(ChooseAdditionalCreditsScreen));
    state.setState(() {
      state.additionalCredits[AdvanceColour.red] = 10;
    });
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(decreaseButtonKey(AdvanceColour.red)));
    await tester.pumpAndSettle();

    expect(state.additionalCredits[AdvanceColour.red], equals(5));
  });

  testWidgets("Can't reduce below the existing amount of any credit",
      (tester) async {
    await tester.pumpWidget(prepareWidget(ChooseAdditionalCreditsScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.eastern},
                setup: GameSetup.normal)),
        mandatoryCredits: const {AdvanceColour.red: 5},
        numberOfCredits: 10,
        update: (selectedCredits) {})));
    final state = tester.state<ChooseAdditionalCreditsScreenState>(
        find.byType(ChooseAdditionalCreditsScreen));
    state.setState(() {
      state.additionalCredits[AdvanceColour.red] = 0;
    });
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(decreaseButtonKey(AdvanceColour.red)));
    await tester.pumpAndSettle();

    expect(state.additionalCredits[AdvanceColour.red], equals(0));
  });

  testWidgets("Pressing the increase button allocates credits", (tester) async {
    await tester.pumpWidget(prepareWidget(ChooseAdditionalCreditsScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.eastern},
                setup: GameSetup.normal)),
        mandatoryCredits: {},
        numberOfCredits: 10,
        update: (selectedCredits) {})));
    final state = tester.state<ChooseAdditionalCreditsScreenState>(
        find.byType(ChooseAdditionalCreditsScreen));
    state.setState(() {
      state.additionalCredits[AdvanceColour.red] = 5;
    });
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(increaseButtonKey(AdvanceColour.red)));
    await tester.pumpAndSettle();

    expect(state.additionalCredits[AdvanceColour.red], equals(10));
  });

  testWidgets("Can't exceed the allowed amount", (tester) async {
    await tester.pumpWidget(prepareWidget(ChooseAdditionalCreditsScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.eastern},
                setup: GameSetup.normal)),
        mandatoryCredits: {},
        numberOfCredits: 10,
        update: (selectedCredits) {})));
    final state = tester.state<ChooseAdditionalCreditsScreenState>(
        find.byType(ChooseAdditionalCreditsScreen));
    state.setState(() {
      state.additionalCredits[AdvanceColour.red] = 10;
    });
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(increaseButtonKey(AdvanceColour.red)));
    await tester.pumpAndSettle();

    expect(state.additionalCredits[AdvanceColour.red], equals(10));
  });

  testWidgets("Pressing continue calls back correctly", (tester) async {
    var setCredits = {};
    final expectedCredits = {
      AdvanceColour.yellow: 0,
      AdvanceColour.green: 0,
      AdvanceColour.blue: 0,
      AdvanceColour.red: 10,
      AdvanceColour.orange: 10
    };

    await tester.pumpWidget(prepareWidget(ChooseAdditionalCreditsScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {
              indexedAdvances[AdvanceKey.advancedMilitary]!.purchase()
            },
            tradeGoods: {},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.eastern},
                setup: GameSetup.normal)),
        mandatoryCredits: const {AdvanceColour.red: 5},
        numberOfCredits: 20,
        update: (selectedCredits) {
          setCredits = selectedCredits;
        })));

    final state = tester.state<ChooseAdditionalCreditsScreenState>(
        find.byType(ChooseAdditionalCreditsScreen));
    state.setState(() {
      state.additionalCredits[AdvanceColour.red] = 10;
      state.additionalCredits[AdvanceColour.orange] = 10;
    });
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(startButton));
    await tester.pumpAndSettle();

    expect(setCredits, equals(expectedCredits));
  });
}
