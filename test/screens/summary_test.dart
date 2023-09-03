import 'package:flutter_test/flutter_test.dart';
import 'package:mega_empires_assistant/data/advance_colour.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/data/settings.dart';
import 'package:mega_empires_assistant/data/trade_goods.dart';
import 'package:mega_empires_assistant/game/advances.dart';
import 'package:mega_empires_assistant/game/game.dart';
import 'package:mega_empires_assistant/game/game_setup.dart';
import 'package:mega_empires_assistant/game/trade_goods.dart';
import 'package:mega_empires_assistant/screens/summary.dart';
import 'package:mega_empires_assistant/screens/trade_goods.dart';
import 'package:mega_empires_assistant/screens/widgets/keys.dart';

import '../utils/test_utils.dart';

void main() {
  initTests();

  testWidgets('nothing to discard or pick up', (tester) async {
    await tester.pumpWidget(prepareWidget(SummaryScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 6,
                games: {Game.western},
                setup: GameSetup.normal)))));

    await expectLater(
        find.byType(SummaryScreen),
        matchesGoldenFile(
            'golden/summary_screen_nothing_to_discard_or_pick_up.png'));
  });

  testWidgets('lists trade goods to be discarded', (tester) async {
    await tester.pumpWidget(prepareWidget(SummaryScreen(
        spendingGoods: {
          indexedTradeGoods[TradeGoodKey.ochre]!: 5,
          indexedTradeGoods[TradeGoodKey.gold]!: 3
        },
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 6,
                games: {Game.western},
                setup: GameSetup.normal)))));

    await expectLater(find.byType(SummaryScreen),
        matchesGoldenFile('golden/summary_screen_trade_goods.png'));
  });

  testWidgets('lists additional credits to pick up', (tester) async {
    await tester.pumpWidget(prepareWidget(SummaryScreen(
        additionalCredits: const {
          AdvanceColour.red: 10,
          AdvanceColour.green: 2
        },
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 6,
                games: {Game.western},
                setup: GameSetup.normal)))));

    await expectLater(find.byType(SummaryScreen),
        matchesGoldenFile('golden/summary_screen_additional_credits.png'));
  });

  testWidgets('lists advances in cart pick up', (tester) async {
    await tester.pumpWidget(prepareWidget(SummaryScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: {
          indexedAdvances[AdvanceKey.anatomy]!.purchase(),
          indexedAdvances[AdvanceKey.agriculture]!.purchase(),
          indexedAdvances[AdvanceKey.mythology]!.purchase(),
        },
            settings: Settings(
                numberOfPlayers: 6,
                games: {Game.western},
                setup: GameSetup.normal)))));

    await expectLater(find.byType(SummaryScreen),
        matchesGoldenFile('golden/summary_screen_advances_in_cart.png'));
  });

  testWidgets('lists all', (tester) async {
    await tester.pumpWidget(prepareWidget(SummaryScreen(
        spendingGoods: {
          indexedTradeGoods[TradeGoodKey.ochre]!: 5,
          indexedTradeGoods[TradeGoodKey.gold]!: 3
        },
        additionalCredits: const {
          AdvanceColour.red: 10,
          AdvanceColour.green: 2
        },
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: {
              indexedAdvances[AdvanceKey.anatomy]!.purchase(),
              indexedAdvances[AdvanceKey.agriculture]!.purchase(),
              indexedAdvances[AdvanceKey.mythology]!.purchase(),
            },
            settings: Settings(
                numberOfPlayers: 6,
                games: {Game.western},
                setup: GameSetup.normal)))));

    await expectLater(find.byType(SummaryScreen),
        matchesGoldenFile('golden/summary_screen_lists_all.png'));
  });

  testWidgets('continue - trade goods are cleared', (tester) async {
    await tester.pumpWidget(prepareWidget(SummaryScreen(
        spendingGoods: {
          indexedTradeGoods[TradeGoodKey.ochre]!: 5,
          indexedTradeGoods[TradeGoodKey.gold]!: 3
        },
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {
              indexedTradeGoods[TradeGoodKey.ochre]!: 6,
              indexedTradeGoods[TradeGoodKey.gold]!: 4,
              indexedTradeGoods[TradeGoodKey.glass]!: 3
            },
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 6,
                games: {Game.western},
                setup: GameSetup.normal)))));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(startButton));
    await tester.pumpAndSettle();

    final state = findGameState(tester, find);
    expect(state.tradeGoods, isEmpty);
  });

  testWidgets('continue - additional credits do nothing', (tester) async {
    const expectedCredits = {
      AdvanceColour.red: 10,
      AdvanceColour.green: 2,
      AdvanceColour.blue: 3
    };
    await tester.pumpWidget(prepareWidget(SummaryScreen(
        additionalCredits: const {
          AdvanceColour.red: 10,
          AdvanceColour.green: 2
        },
        state: GameState(
            additionalCredits: expectedCredits,
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 6,
                games: {Game.western},
                setup: GameSetup.normal)))));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(startButton));
    await tester.pumpAndSettle();

    final state = findGameState(tester, find);
    expect(state.additionalCredits, expectedCredits);
  });

  testWidgets('continue - advances in cart are marked as purchased',
      (tester) async {
    final expectedPurchasedAdvances = {
      indexedAdvances[AdvanceKey.anatomy]!.purchase(),
      indexedAdvances[AdvanceKey.agriculture]!.purchase(),
      indexedAdvances[AdvanceKey.mythology]!.purchase(),
    };
    await tester.pumpWidget(prepareWidget(SummaryScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {
          indexedAdvances[AdvanceKey.agriculture]!.purchase(),
          indexedAdvances[AdvanceKey.mythology]!.purchase()
        },
            tradeGoods: {},
            advancesInCart: {
          indexedAdvances[AdvanceKey.anatomy]!.purchase()
        },
            settings: Settings(
                numberOfPlayers: 6,
                games: {Game.western},
                setup: GameSetup.normal)))));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(startButton));
    await tester.pumpAndSettle();

    final state = findGameState(tester, find);
    expect(state.purchasedAdvances, expectedPurchasedAdvances);
  });

  testWidgets('continue - moves to trade goods screen', (tester) async {
    await tester.pumpWidget(prepareWidget(SummaryScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 6,
                games: {Game.western},
                setup: GameSetup.normal)))));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(startButton));
    await tester.pumpAndSettle();

    // We have moved screen
    expect(find.byType(SelectTradeGoodsScreen), findsOneWidget);
  });

  testWidgets('scrolls correctly when too many to show on screen',
      (tester) async {
    await tester.pumpWidget(prepareWidget(SummaryScreen(
        additionalCredits: const {
          AdvanceColour.red: 10,
          AdvanceColour.yellow: 10,
          AdvanceColour.green: 10,
          AdvanceColour.orange: 10,
          AdvanceColour.blue: 10
        },
        state: GameState(
            additionalCredits: const {
              AdvanceColour.red: 10,
              AdvanceColour.yellow: 10,
              AdvanceColour.green: 10,
              AdvanceColour.orange: 10,
              AdvanceColour.blue: 10
            },
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: allAdvances.map((e) => e.purchase()).toSet(),
            settings: Settings(
                numberOfPlayers: 6,
                games: {Game.western},
                setup: GameSetup.normal)))));

    await expectLater(find.byType(SummaryScreen),
        matchesGoldenFile('golden/summary_screen_maximum_size.png'));
  });
}
