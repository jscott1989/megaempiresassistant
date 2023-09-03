import 'package:flutter_test/flutter_test.dart';
import 'package:mega_empires_assistant/data/advance_colour.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/data/settings.dart';
import 'package:mega_empires_assistant/data/trade_goods.dart';
import 'package:mega_empires_assistant/game/advances.dart';
import 'package:mega_empires_assistant/game/game.dart';
import 'package:mega_empires_assistant/game/game_setup.dart';
import 'package:mega_empires_assistant/game/trade_goods.dart';
import 'package:mega_empires_assistant/screens/main_menu.dart';
import 'package:mega_empires_assistant/screens/new_game.dart';
import 'package:mega_empires_assistant/screens/summary.dart';
import 'package:mega_empires_assistant/screens/widgets/keys.dart';

import '../utils/test_utils.dart';

void main() {
  initTests();

  testWidgets('Start UI', (tester) async {
    await tester.pumpWidget(prepareWidget(const MainMenuScreen()));

    await expectLater(find.byType(MainMenuScreen),
        matchesGoldenFile('golden/main_menu_screen_default.png'));
  });

  testWidgets('Pressing continue with no saved state does nothing',
      (tester) async {
    await tester.pumpWidget(prepareWidget(const MainMenuScreen()));

    testNavigator.reset();

    await tester.tap(find.byKey(continueButton));
    await tester.pumpAndSettle();

    // We haven't moved screen
    expect(testNavigator.latestPushed, isNull);
  });

  testWidgets('Pressing "New game" goes to new game screen', (tester) async {
    await tester.pumpWidget(prepareWidget(const MainMenuScreen()));

    testNavigator.reset();

    await tester.tap(find.byKey(startButton));
    await tester.pumpAndSettle();

    expect(find.byType(NewGameScreen), findsOneWidget);
  });

  testWidgets(
      'Pressing "Continue" with saved state goes to summary screen (to get back into the correct state)',
      (tester) async {
    final expectedCredits = {
      AdvanceColour.yellow: 5,
      AdvanceColour.green: 30,
      AdvanceColour.blue: 20,
      AdvanceColour.red: 15,
      AdvanceColour.orange: 0
    };

    final expectedAdvancesInCart = {
      indexedAdvances[AdvanceKey.culturalAscendancy]!.purchase(),
      indexedAdvances[AdvanceKey.calendar]!.purchase(),
    };

    // GameState is automatically saved when we create a new one
    GameState(
        advancesInCart: {
          // Advances in cart are not restored
          indexedAdvances[AdvanceKey.mythology]!.purchase(),
          indexedAdvances[AdvanceKey.agriculture]!.purchase(),
        },
        purchasedAdvances: {
          indexedAdvances[AdvanceKey.culturalAscendancy]!.purchase(),
          indexedAdvances[AdvanceKey.calendar]!.purchase(),
        },
        additionalCredits: {
          AdvanceColour.red: 10,
          AdvanceColour.green: 20
        },
        tradeGoods: {
          // Trade goods are not restored
          indexedTradeGoods[TradeGoodKey.glass]!: 1
        },
        settings: Settings(
            games: {Game.eastern}, numberOfPlayers: 5, setup: GameSetup.short));
    await tester.pumpWidget(prepareWidget(const MainMenuScreen()));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(continueButton));
    await tester.pumpAndSettle();

    expect(find.byType(SummaryScreen), findsOneWidget);
    final state = tester.state<SummaryScreenState>(find.byType(SummaryScreen));
    expect(state.credits, equals(expectedCredits));
    expect(state.widget.state.advancesInCart, equals(expectedAdvancesInCart));

    await expectLater(find.byType(SummaryScreen),
        matchesGoldenFile('golden/summary_screen_after_restore.png'));
  });
}
