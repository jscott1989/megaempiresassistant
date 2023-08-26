import 'package:flutter/material.dart' hide SearchController;
import 'package:mega_empires_assistant/data/advance.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/data/purchased_advance.dart';
import 'package:mega_empires_assistant/data/trade_goods.dart';
import 'package:mega_empires_assistant/game/advances.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';
import 'package:mega_empires_assistant/screens/additional_credits.dart';
import 'package:mega_empires_assistant/screens/payment.dart';
import 'package:mega_empires_assistant/screens/summary.dart';
import 'package:mega_empires_assistant/screens/view_advance.dart';
import 'package:mega_empires_assistant/screens/widgets/popup_menu.dart';
import 'package:mega_empires_assistant/screens/widgets/search_controller.dart';

/// Screen used when we know how much we have to spend and want to pick the
/// advances to buy
final class PurchaseAdvancesScreen extends StatefulWidget {
  final GameState state;

  const PurchaseAdvancesScreen({Key? key, required this.state})
      : super(key: key);

  @override
  PurchaseAdvancesScreenState createState() => PurchaseAdvancesScreenState();
}

final class PurchaseAdvancesScreenState extends State<PurchaseAdvancesScreen> {
  /// The advances we are currently planning to buy
  final purchasedAdvancesInCart = <Advance, PurchasedAdvance>{};

  @override
  void initState() {
    super.initState();
    for (PurchasedAdvance advanceInCart in widget.state.advancesInCart) {
      purchasedAdvancesInCart[advanceInCart.advance] = advanceInCart;
    }
  }

  /// The credits remaining to spend (account for things already in the cart)
  int get remainingCredits {
    final int value =
        calculateTotalValue(widget.state.tradeGoods, widget.state);
    return value -
        widget.state
            .withAdvancesInCart(purchasedAdvancesInCart.values.toSet())
            .totalCostOfAdvancesInCart;
  }

  /// Get the [AdvanceState] for a given [Advance].
  AdvanceState calculateAdvanceState(Advance advance) {
    for (PurchasedAdvance purchasedAdvance in widget.state.purchasedAdvances) {
      if (purchasedAdvance.advance == advance) {
        return AdvanceState.purchased;
      }
    }

    if (purchasedAdvancesInCart.containsKey(advance)) {
      return AdvanceState.inCart;
    }

    if (advance.calculateModifiedCost(widget.state
            .withAdvancesInCart(purchasedAdvancesInCart.values.toSet())) <=
        remainingCredits) {
      return AdvanceState.affordable;
    }

    return AdvanceState.unaffordable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).purchaseAdvances),
          actions: [
            createPopupMenu(
              context: context,
              state: widget.state
                  .withAdvancesInCart(purchasedAdvancesInCart.values.toSet()),
              onReturn: (state) => PurchaseAdvancesScreen(state: state),
            )
          ],
        ),
        body: Column(children: [
          SearchController<Advance>(
              allItems: allAdvances,
              queryFunction: (advance, query) {
                return advance.title.toLowerCase().contains(query);
              },
              itemBuilder: (advance) {
                return PurchaseAdvanceListTile(
                    state: widget.state,
                    advanceState: calculateAdvanceState(advance),
                    advance: advance,
                    modifiedPrice: advance.calculateModifiedCost(widget.state
                        .withAdvancesInCart(
                            purchasedAdvancesInCart.values.toSet())),
                    onPress: () {
                      if (purchasedAdvancesInCart.containsKey(advance)) {
                        setState(() {
                          purchasedAdvancesInCart.remove(advance);
                        });
                      } else {
                        if (advance.optionalCredits > 0) {
                          // We need to allocate the optional credits
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ChooseAdditionalCreditsScreen(
                                          state: widget.state
                                              .withAdvancesInCart(
                                                  purchasedAdvancesInCart.values
                                                      .toSet()),
                                          mandatoryCredits: advance.discounts,
                                          numberOfCredits:
                                              advance.optionalCredits,
                                          update: (credits) {
                                            setState(() {
                                              purchasedAdvancesInCart[advance] =
                                                  PurchasedAdvance
                                                      .withAdditional(
                                                          advance, credits);
                                            });
                                          })));
                        } else {
                          setState(() {
                            purchasedAdvancesInCart[advance] =
                                PurchasedAdvance.of(advance);
                          });
                        }
                      }
                    });
              }),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(S.current.remainingCredits(remainingCredits)),
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OutlinedButton(
                        child: Text(S.current.cont),
                        onPressed: () {
                          // We only need to go to the payment screen if either we are purchasing something or we need to discard
                          if (purchasedAdvancesInCart.isNotEmpty ||
                              widget.state.cardsToDiscard > 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MakePaymentScreen(
                                      state: widget.state.withAdvancesInCart(
                                          purchasedAdvancesInCart.values
                                              .toSet()))),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SummaryScreen(
                                      state:
                                          widget.state.withAdvancesInCart({}))),
                            );
                          }
                        },
                      )
                    ],
                  )
                ],
              ))
        ]));
  }
}

/// A single advance shown in the list which can be purchased
final class PurchaseAdvanceListTile extends StatelessWidget {
  /// The overall game state
  final GameState state;

  /// The advance represented by this tile
  final Advance advance;

  /// A callback used when this advance is selected
  final VoidCallback onPress;

  /// The current [AdvanceState] of the [Advance].
  final AdvanceState advanceState;

  /// The price taking into account all relevant discounts
  final int modifiedPrice;

  PurchaseAdvanceListTile(
      {required this.state,
      required this.advanceState,
      required this.advance,
      required this.onPress,
      required this.modifiedPrice})
      : super(key: Key(advance.key.name));

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: (advanceState == AdvanceState.unaffordable)
            ? const BoxDecoration(color: Colors.grey)
            : (advanceState == AdvanceState.purchased)
                ? const BoxDecoration(color: Colors.blueGrey)
                : advance.boxDecoration(),
        child: ListTile(
            title: advanceTitle(state, context, advance),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: (advanceState == AdvanceState.purchased)
                  ? [Text(S.of(context).purchased)]
                  : [
                      Text(
                          advance.price == modifiedPrice
                              ? ""
                              : advance.price.toString(),
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough)),
                      Text(''
                          .padRight(7 - modifiedPrice.toString().length, ' ')),
                      Text(modifiedPrice.toString()),
                      const Text("    "),
                      (advanceState == AdvanceState.purchased)
                          ? const Text("")
                          : TextButton(
                              onPressed:
                                  (advanceState != AdvanceState.unaffordable)
                                      ? onPress
                                      : null,
                              child: Icon(
                                (advanceState == AdvanceState.inCart)
                                    ? Icons.remove_circle
                                    : Icons.add_circle,
                                color: Colors.black,
                              ),
                            )
                    ],
            )));
  }
}

/// The title of the advance, including the link to get more information
Widget advanceTitle(GameState state, BuildContext context, Advance advance) {
  return Row(children: [
    TextButton(
      style: TextButton.styleFrom(
          padding: EdgeInsets.zero, minimumSize: const Size(0, 30)),
      child: const Icon(Icons.info_outline, color: Colors.black),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ViewAdvance(state: state, advance: advance)));
      },
    ),
    Text(" ${advance.title}")
  ]);
}

/// The state of an Advance specifically for the [PurchaseAdvancesScreen]
enum AdvanceState { affordable, unaffordable, inCart, purchased }
