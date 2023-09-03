import 'package:flutter_test/flutter_test.dart';
import 'package:mega_empires_assistant/data/advance_colour.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/data/settings.dart';
import 'package:mega_empires_assistant/data/trade_goods.dart';
import 'package:mega_empires_assistant/game/advances.dart';
import 'package:mega_empires_assistant/game/game.dart';
import 'package:mega_empires_assistant/game/game_setup.dart';
import 'package:mega_empires_assistant/game/trade_goods.dart';
import 'package:mega_empires_assistant/screens/additional_credits.dart';
import 'package:mega_empires_assistant/screens/advances.dart';
import 'package:mega_empires_assistant/screens/calamities.dart';
import 'package:mega_empires_assistant/screens/edit_advances.dart';
import 'package:mega_empires_assistant/screens/edit_credits.dart';
import 'package:mega_empires_assistant/screens/payment.dart';
import 'package:mega_empires_assistant/screens/settings.dart';
import 'package:mega_empires_assistant/screens/summary.dart';
import 'package:mega_empires_assistant/screens/view_advance.dart';
import 'package:mega_empires_assistant/screens/widgets/keys.dart';
import 'package:mega_empires_assistant/screens/widgets/popup_menu.dart';
import 'package:mega_empires_assistant/screens/widgets/search_controller.dart';

import '../utils/test_utils.dart';

void main() {
  initTests();

  testWidgets('Screenshot test (with some in cart)', (tester) async {
    await tester.pumpWidget(prepareWidget(PurchaseAdvancesScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.eastern},
                setup: GameSetup.normal)))));
    final state = tester.state<PurchaseAdvancesScreenState>(
        find.byType(PurchaseAdvancesScreen));
    state.setState(() {
      state.purchasedAdvancesInCart[indexedAdvances[AdvanceKey.calendar]!] =
          indexedAdvances[AdvanceKey.calendar]!.purchase();
      state.purchasedAdvancesInCart[indexedAdvances[AdvanceKey.anatomy]!] =
          indexedAdvances[AdvanceKey.anatomy]!.purchase();
    });
    await tester.pumpAndSettle();

    await expectLater(find.byType(PurchaseAdvancesScreen),
        matchesGoldenFile('golden/purchase_advances_screen.png'));
  });

  testWidgets('Pressing buy on something affordable puts it in cart',
          (tester) async {
        await tester.pumpWidget(prepareWidget(PurchaseAdvancesScreen(
            state: GameState(
                additionalCredits: {
                  AdvanceColour.red: 100,
                  AdvanceColour.yellow: 100,
                  AdvanceColour.green: 100,
                  AdvanceColour.blue: 100,
                  AdvanceColour.orange: 100
                },
                purchasedAdvances: {},
                tradeGoods: {},
                advancesInCart: {},
                settings: Settings(
                    numberOfPlayers: 5,
                    games: {Game.eastern},
                    setup: GameSetup.normal)))));
        final state = tester.state<PurchaseAdvancesScreenState>(
            find.byType(PurchaseAdvancesScreen));

        await tester
            .tap(find.byKey(addRemoveAdvanceButtonKey(AdvanceKey.mythology)));
        await tester.pumpAndSettle();

        expect(state.purchasedAdvancesInCart,
            contains(indexedAdvances[AdvanceKey.mythology]!));
      });

  testWidgets('Pressing buy on something in cart takes it out of cart',
          (tester) async {
        await tester.pumpWidget(prepareWidget(PurchaseAdvancesScreen(
            state: GameState(
                additionalCredits: {
                  AdvanceColour.red: 100,
                  AdvanceColour.yellow: 100,
                  AdvanceColour.green: 100,
                  AdvanceColour.blue: 100,
                  AdvanceColour.orange: 100
                },
                purchasedAdvances: {},
                tradeGoods: {},
                advancesInCart: {},
                settings: Settings(
                    numberOfPlayers: 5,
                    games: {Game.eastern},
                    setup: GameSetup.normal)))));
        final state = tester.state<PurchaseAdvancesScreenState>(
            find.byType(PurchaseAdvancesScreen));
        state.setState(() {
          state.purchasedAdvancesInCart[indexedAdvances[AdvanceKey
              .mythology]!] =
              indexedAdvances[AdvanceKey.mythology]!.purchase();
        });
        await tester.pumpAndSettle();

        await tester
            .tap(find.byKey(addRemoveAdvanceButtonKey(AdvanceKey.mythology)));
        await tester.pumpAndSettle();

        expect(state.purchasedAdvancesInCart,
            isNot(contains(indexedAdvances[AdvanceKey.mythology]!)));
      });

  testWidgets('Pressing buy on something unaffordable does nothing',
          (tester) async {
        await tester.pumpWidget(prepareWidget(PurchaseAdvancesScreen(
            state: GameState(
                additionalCredits: {},
                purchasedAdvances: {},
                tradeGoods: {},
                advancesInCart: {},
                settings: Settings(
                    numberOfPlayers: 5,
                    games: {Game.eastern},
                    setup: GameSetup.normal)))));
        final state = tester.state<PurchaseAdvancesScreenState>(
            find.byType(PurchaseAdvancesScreen));

        await tester
            .tap(find.byKey(addRemoveAdvanceButtonKey(AdvanceKey.mythology)));
        await tester.pumpAndSettle();

        expect(state.purchasedAdvancesInCart,
            isNot(contains(indexedAdvances[AdvanceKey.mythology]!)));
      });

  testWidgets('Pressing info shows the advance info', (tester) async {
    await tester.pumpWidget(prepareWidget(PurchaseAdvancesScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.eastern},
                setup: GameSetup.normal)))));

    await tester.tap(find.byKey(advanceInfoButton(AdvanceKey.mythology)));
    await tester.pumpAndSettle();

    expect(find.byType(ViewAdvanceScreen), findsOneWidget);
    final state =
    tester.state<ViewAdvanceScreenState>(find.byType(ViewAdvanceScreen));
    expect(
        state.widget.advance, equals(indexedAdvances[AdvanceKey.mythology]!));
  });

  testWidgets('Remaining is accurate with nothing in cart', (tester) async {
    await tester.pumpWidget(prepareWidget(PurchaseAdvancesScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {indexedTradeGoods[TradeGoodKey.bone]!: 9},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.eastern},
                setup: GameSetup.normal)))));

    final state = tester.state<PurchaseAdvancesScreenState>(
        find.byType(PurchaseAdvancesScreen));
    expect(state.remainingCredits, equals(81));
  });

  testWidgets('Remaining is accurate with goods in cart', (tester) async {
    await tester.pumpWidget(prepareWidget(PurchaseAdvancesScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {indexedTradeGoods[TradeGoodKey.bone]!: 9},
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.eastern},
                setup: GameSetup.normal)))));
    final state = tester.state<PurchaseAdvancesScreenState>(
        find.byType(PurchaseAdvancesScreen));
    state.setState(() {
      state.purchasedAdvancesInCart[indexedAdvances[AdvanceKey.mythology]!] =
          indexedAdvances[AdvanceKey.mythology]!.purchase();
    });
    await tester.pumpAndSettle();

    expect(state.remainingCredits, equals(21));
  });

  testWidgets('Pressing continue moves to trade goods correctly',
          (tester) async {
        await tester.pumpWidget(prepareWidget(PurchaseAdvancesScreen(
            state: GameState(
                additionalCredits: {},
                purchasedAdvances: {},
                tradeGoods: {indexedTradeGoods[TradeGoodKey.bone]!: 9},
                advancesInCart: {},
                settings: Settings(
                    numberOfPlayers: 5,
                    games: {Game.eastern},
                    setup: GameSetup.normal)))));
        final state = tester.state<PurchaseAdvancesScreenState>(
            find.byType(PurchaseAdvancesScreen));
        state.setState(() {
          state.purchasedAdvancesInCart[indexedAdvances[AdvanceKey
              .mythology]!] =
              indexedAdvances[AdvanceKey.mythology]!.purchase();
        });
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(startButton));
        await tester.pumpAndSettle();

        expect(find.byType(MakePaymentScreen), findsOneWidget);
        final paymentState =
        tester.state<MakePaymentScreenState>(find.byType(MakePaymentScreen));
        expect(paymentState.widget.state.advancesInCart,
            equals({indexedAdvances[AdvanceKey.mythology]!.purchase()}));
      });

  testWidgets('Pressing Continue without any advances goes straight to summary',
          (tester) async {
        await tester.pumpWidget(prepareWidget(PurchaseAdvancesScreen(
            state: GameState(
                additionalCredits: {},
                purchasedAdvances: {},
                tradeGoods: {indexedTradeGoods[TradeGoodKey.bone]!: 3},
                advancesInCart: {},
                settings: Settings(
                    numberOfPlayers: 5,
                    games: {Game.eastern},
                    setup: GameSetup.normal)))));

        await tester.tap(find.byKey(startButton));
        await tester.pumpAndSettle();

        expect(find.byType(SummaryScreen), findsOneWidget);
      });

  testWidgets(
      'Pressing Continue without advances but with a need to discard goes to payment screen',
          (tester) async {
        await tester.pumpWidget(prepareWidget(PurchaseAdvancesScreen(
            state: GameState(
                additionalCredits: {},
                purchasedAdvances: {},
                tradeGoods: {
                  indexedTradeGoods[TradeGoodKey.bone]!: 3,
                  indexedTradeGoods[TradeGoodKey.water]!: 10
                },
                advancesInCart: {},
                settings: Settings(
                    numberOfPlayers: 5,
                    games: {Game.eastern},
                    setup: GameSetup.normal)))));

        await tester.tap(find.byKey(startButton));
        await tester.pumpAndSettle();

        expect(find.byType(MakePaymentScreen), findsOneWidget);
      });

  testWidgets('Search works', (tester) async {
    await tester.pumpWidget(prepareWidget(PurchaseAdvancesScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {
              indexedTradeGoods[TradeGoodKey.bone]!: 3,
              indexedTradeGoods[TradeGoodKey.water]!: 10
            },
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.eastern},
                setup: GameSetup.normal)))));

    await tester.enterText(find.byKey(searchInput), "ana");
    await tester.pumpAndSettle();

    await expectLater(find.byType(PurchaseAdvancesScreen),
        matchesGoldenFile('golden/purchase_advances_search_results.png'));
  });

  testWidgets('"Edit Advances" works', (tester) async {
    await tester.pumpWidget(prepareWidget(PurchaseAdvancesScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {
              indexedTradeGoods[TradeGoodKey.bone]!: 3,
              indexedTradeGoods[TradeGoodKey.water]!: 10
            },
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.eastern},
                setup: GameSetup.normal)))));

    await tester.tap(find.byKey(quickMenu));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(editAdvances));
    await tester.pumpAndSettle();

    expect(find.byType(EditAdvancesScreen), findsOneWidget);
  });

  testWidgets('"Edit Credits" works', (tester) async {
    await tester.pumpWidget(prepareWidget(PurchaseAdvancesScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {
              indexedTradeGoods[TradeGoodKey.bone]!: 3,
              indexedTradeGoods[TradeGoodKey.water]!: 10
            },
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.eastern},
                setup: GameSetup.normal)))));

    await tester.tap(find.byKey(quickMenu));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(editCredits));
    await tester.pumpAndSettle();

    expect(find.byType(EditCreditsScreen), findsOneWidget);
  });

  testWidgets('"View Calamities" works', (tester) async {
    await tester.pumpWidget(prepareWidget(PurchaseAdvancesScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {
              indexedTradeGoods[TradeGoodKey.bone]!: 3,
              indexedTradeGoods[TradeGoodKey.water]!: 10
            },
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.eastern},
                setup: GameSetup.normal)))));

    await tester.tap(find.byKey(quickMenu));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(viewCalamities));
    await tester.pumpAndSettle();

    expect(find.byType(ViewCalamitiesScreen), findsOneWidget);
  });

  testWidgets('"Setting" works', (tester) async {
    await tester.pumpWidget(prepareWidget(PurchaseAdvancesScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {
              indexedTradeGoods[TradeGoodKey.bone]!: 3,
              indexedTradeGoods[TradeGoodKey.water]!: 10
            },
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.eastern},
                setup: GameSetup.normal)))));

    await tester.tap(find.byKey(quickMenu));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(settings));
    await tester.pumpAndSettle();

    expect(find.byType(EditSettingsScreen), findsOneWidget);
  });

  testWidgets('Advances that have additional credits work correctly',
          (tester) async {
        await tester.pumpWidget(prepareWidget(PurchaseAdvancesScreen(
            state: GameState(
                additionalCredits: {},
                purchasedAdvances: {},
                tradeGoods: {indexedTradeGoods[TradeGoodKey.amber]!: 5},
                advancesInCart: {},
                settings: Settings(
                    numberOfPlayers: 5,
                    games: {Game.eastern},
                    setup: GameSetup.normal)))));
        final state = tester.state<PurchaseAdvancesScreenState>(
            find.byType(PurchaseAdvancesScreen));

        await tester.enterText(find.byKey(searchInput), "writ");
        await tester.pumpAndSettle();

        await tester
            .tap(
            find.byKey(addRemoveAdvanceButtonKey(AdvanceKey.writtenRecord)));
        await tester.pumpAndSettle();

        expect(find.byType(ChooseAdditionalCreditsScreen), findsOneWidget);
        final additionalCreditsState =
        tester.state<ChooseAdditionalCreditsScreenState>(
            find.byType(ChooseAdditionalCreditsScreen));
        additionalCreditsState.setState(() {
          additionalCreditsState.additionalCredits[AdvanceColour.red] = 10;
        });
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(startButton));
        await tester.pumpAndSettle();

        await expectLater(
            find.byType(PurchaseAdvancesScreen),
            matchesGoldenFile(
                'golden/purchase_advances_screen_with_additional_credits.png'));
        expect(
            state
                .purchasedAdvancesInCart[
            indexedAdvances[AdvanceKey.writtenRecord]!]!
                .additionalCredits,
            equals({
              AdvanceColour.yellow: 0,
              AdvanceColour.green: 0,
              AdvanceColour.blue: 0,
              AdvanceColour.orange: 0,
              AdvanceColour.red: 10
            }));
      });

  testWidgets('Price is correct accounting for library', (tester) async {
    await tester.pumpWidget(prepareWidget(PurchaseAdvancesScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {
              indexedTradeGoods[TradeGoodKey.amber]!: 6,
            },
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.eastern},
                setup: GameSetup.normal)))));
    final state = tester.state<PurchaseAdvancesScreenState>(
        find.byType(PurchaseAdvancesScreen));
    expect(state.remainingCredits, equals(324));
    state.setState(() {
      state.purchasedAdvancesInCart[indexedAdvances[AdvanceKey.library]!] =
          indexedAdvances[AdvanceKey.library]!.purchase();
    });
    await tester.pumpAndSettle();
    expect(state.remainingCredits, equals(104));
    state.setState(() {
      state.purchasedAdvancesInCart[indexedAdvances[AdvanceKey.mythology]!] =
          indexedAdvances[AdvanceKey.mythology]!.purchase();
    });
    await tester.pumpAndSettle();
    expect(state.remainingCredits, equals(84));
    await tester.enterText(find.byKey(searchInput), "m");
    await tester.pumpAndSettle();
    await expectLater(find.byType(PurchaseAdvancesScreen),
        matchesGoldenFile('golden/purchase_advances_screen_with_library.png'));
  });

  testWidgets('Price is correct accounting for anatomy', (tester) async {
    await tester.pumpWidget(prepareWidget(PurchaseAdvancesScreen(
        state: GameState(
            additionalCredits: {},
            purchasedAdvances: {},
            tradeGoods: {
              indexedTradeGoods[TradeGoodKey.amber]!: 6,
            },
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.eastern},
                setup: GameSetup.normal)))));
    final state = tester.state<PurchaseAdvancesScreenState>(
        find.byType(PurchaseAdvancesScreen));
    expect(state.remainingCredits, equals(324));
    state.setState(() {
      state.purchasedAdvancesInCart[indexedAdvances[AdvanceKey.anatomy]!] =
          indexedAdvances[AdvanceKey.anatomy]!.purchase();
    });
    await tester.pumpAndSettle();
    expect(state.remainingCredits, equals(54));

    await tester.enterText(find.byKey(searchInput), "as");
    await tester.pumpAndSettle();
    await expectLater(find.byType(PurchaseAdvancesScreen),
        matchesGoldenFile('golden/purchase_advances_prices_with_anatomy.png'));

    state.setState(() {
      state.purchasedAdvancesInCart[
      indexedAdvances[AdvanceKey.astronavigation]!] =
          indexedAdvances[AdvanceKey.astronavigation]!.purchase();
    });
    await tester.pumpAndSettle();
    expect(state.remainingCredits, equals(54));

    await expectLater(
        find.byType(PurchaseAdvancesScreen),
        matchesGoldenFile(
            'golden/purchase_advances_prices_with_anatomy_and_astronavigation.png'));
  });

  testWidgets('Price is correct accounting for credits', (tester) async {
    await tester.pumpWidget(prepareWidget(PurchaseAdvancesScreen(
        state: GameState(
            additionalCredits: {
              AdvanceColour.red: 20,
              AdvanceColour.green: 20,
              AdvanceColour.blue: 20,
              AdvanceColour.orange: 20,
              AdvanceColour.yellow: 20
            },
            purchasedAdvances: {},
            tradeGoods: {
              indexedTradeGoods[TradeGoodKey.amber]!: 6,
            },
            advancesInCart: {},
            settings: Settings(
                numberOfPlayers: 5,
                games: {Game.eastern},
                setup: GameSetup.normal)))));

    await expectLater(find.byType(PurchaseAdvancesScreen),
        matchesGoldenFile('golden/purchase_advances_prices_with_credits.png'));
  });
}
