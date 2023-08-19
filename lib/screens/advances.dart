import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/data/advance.dart';
import 'package:mega_empires_assistant/data/purchased_advance.dart';
import 'package:mega_empires_assistant/game/advances.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';
import 'package:mega_empires_assistant/main.dart';
import 'package:mega_empires_assistant/screens/additional_credits.dart';
import 'package:mega_empires_assistant/screens/calamities.dart';
import 'package:mega_empires_assistant/screens/payment.dart';
import 'package:mega_empires_assistant/screens/settings.dart';
import 'package:mega_empires_assistant/screens/view_advance.dart';
import 'package:mega_empires_assistant/util/utils.dart';

import 'edit_advances.dart';
import 'edit_credits.dart';

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
  final searchController = SearchController<Advance>(
    allItems: allAdvances,
    queryFunction: (advance, query) {
      return advance.title.toLowerCase().contains(query);
    },
    resultsFunction: (results) {
      // TODO...
    },
  );

  final advancesInCart = <PurchasedAdvance>{};
  final purchasedAdvancesInCart = <Advance, PurchasedAdvance>{};
  List<Advance> activeAdvances = [];

  @override
  void initState() {
    super.initState();
    advancesInCart.addAll(widget.state
        .advancesInCart); // TODO: revalidate these - or people can edit and leave in invalid situation
    for (PurchasedAdvance advanceInCart in widget.state.advancesInCart) {
      purchasedAdvancesInCart[advanceInCart.advance] = advanceInCart;
    }
  }

  int get remaining {
    final int value =
        calculateTotalValue(widget.state.tradeGoods, widget.state);
    return value -
        calculateTotalCost(widget.state.withAdvancesInCart(advancesInCart));
  }

  AdvanceState calculateAdvanceState(Advance advance) {
    for (PurchasedAdvance purchasedAdvance in widget.state.purchasedAdvances) {
      if (purchasedAdvance.advance == advance) {
        return AdvanceState.purchased;
      }
    }

    for (PurchasedAdvance purchasedAdvance in advancesInCart) {
      if (purchasedAdvance.advance == advance) {
        return AdvanceState.inCart;
      }
    }

    if (calculateModifiedCost(
            advance, widget.state.withAdvancesInCart(advancesInCart)) <=
        remaining) {
      return AdvanceState.affordable;
    }

    return AdvanceState.unaffordable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).purchaseAdvances),
          actions: <Widget>[
            createPopupMenu(advancementsPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditAdvances(
                        state: widget.state.withAdvancesInCart(advancesInCart),
                        update: (state) {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PurchaseAdvancesScreen(state: state)));
                        }),
                  ));
            }, creditsPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditCredits(
                        state: widget.state.withAdvancesInCart(advancesInCart),
                        update: (state) {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PurchaseAdvancesScreen(state: state)));
                        }),
                  ));
            }, calamitiesPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Calamities(state: widget.state)));
            }, settingsPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditSettings(
                        state: widget.state.withAdvancesInCart(advancesInCart),
                        update: (state) {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PurchaseAdvancesScreen(state: state)));
                        }),
                  ));
            })
          ],
        ),
        body: Container(
          child: Column(children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0), child: searchController),
            Expanded(
              child: ListView.builder(
                itemCount: max(1, activeAdvances.length),
                itemBuilder: (context, index) {
                  if (activeAdvances.isEmpty) {
                    return Text(S.of(context).noAdvancesMatchYourQuery);
                  }
                  Advance advance = activeAdvances[index];
                  return PurchaseAdvanceListTile(
                      state: widget.state,
                      advanceState: calculateAdvanceState(advance),
                      advance: advance,
                      price: calculateModifiedCost(advance,
                          widget.state.withAdvancesInCart(advancesInCart)),
                      onPress: () {
                        if (purchasedAdvancesInCart.containsKey(advance)) {
                          setState(() {
                            advancesInCart
                                .remove(purchasedAdvancesInCart[advance]);
                            purchasedAdvancesInCart.remove(advance);
                          });
                        } else {
                          if (advance.title == "Written Record" ||
                              advance.title == "Monument") {
                            // Advances which allow additional credits
                            int credits = 20;
                            if (advance.title == "Written Record") {
                              credits = 10;
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChooseAdditionalCreditsScreen(
                                            state: widget.state
                                                .withAdvancesInCart(
                                                    advancesInCart),
                                            mandatoryCredits: advance.discounts,
                                            numberOfCredits: credits,
                                            update: (credits) {
                                              setState(() {
                                                purchasedAdvancesInCart[
                                                        advance] =
                                                    PurchasedAdvance
                                                        .withAdditional(
                                                            advance, credits);
                                                advancesInCart.add(
                                                    purchasedAdvancesInCart[
                                                        advance]!);
                                              });
                                            })));
                          } else {
                            setState(() {
                              purchasedAdvancesInCart[advance] =
                                  PurchasedAdvance.of(advance);
                              advancesInCart
                                  .add(purchasedAdvancesInCart[advance]!);
                            });
                          }
                        }
                      });
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(S.current.remainingCredits(remaining)),
                    ButtonBar(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        OutlinedButton(
                          child: Text(S.current.cont),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Payment(
                                      state: widget.state
                                          .withAdvancesInCart(advancesInCart))),
                            );
                          },
                        )
                      ],
                    )
                  ],
                )),
          ]),
        ));
  }
}

final class PurchaseAdvanceListTile extends StatelessWidget {
  final GameState state;
  final Advance advance;
  final VoidCallback onPress;
  final AdvanceState advanceState;
  final int price;

  PurchaseAdvanceListTile(
      {required this.state,
      required this.advanceState,
      required this.advance,
      required this.onPress,
      required this.price})
      : super(key: Key(advance.title));

  @override
  Widget build(BuildContext context) {
    if (advanceState == AdvanceState.affordable) {
      return Container(
          decoration: boxDecorationForAdvance(advance),
          child: ListTile(
              title: Row(children: [
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, minimumSize: Size(0, 30)),
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
              ]),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(advance.price == price ? "" : advance.price.toString(),
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough)),
                  Text(''.padRight(7 - price.toString().length, ' ')),
                  Text(price.toString()),
                  const Text("    "),
                  TextButton(
                    onPressed: onPress,
                    child: const Icon(
                      Icons.add_circle,
                      color: Colors.black,
                    ),
                  )
                ],
              )));
    } else if (advanceState == AdvanceState.unaffordable) {
      return Container(
          decoration: const BoxDecoration(color: Colors.grey),
          child: ListTile(
              title: Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 30)),
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
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(advance.price == price ? "" : advance.price.toString(),
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough)),
                  Text(''.padRight(7 - price.toString().length, ' ')),
                  Text(price.toString()),
                  const Text("    "),
                  const TextButton(
                    onPressed: null,
                    child: Icon(Icons.add_circle),
                  )
                ],
              )));
    } else if (advanceState == AdvanceState.inCart) {
      return Container(
          decoration: boxDecorationForAdvance(advance),
          child: ListTile(
              title: Row(children: [
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
              ]),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(advance.price == price ? "" : advance.price.toString(),
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough)),
                  Text(''.padRight(7 - price.toString().length, ' ')),
                  Text(price.toString()),
                  const Text("    "),
                  TextButton(
                    onPressed: onPress,
                    child: const Icon(
                      Icons.remove_circle,
                      color: Colors.black,
                    ),
                  )
                ],
              )));
    } else if (advanceState == AdvanceState.purchased) {
      return Container(
          decoration: const BoxDecoration(color: Colors.blueGrey),
          child: ListTile(
              title: Row(children: [
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, minimumSize: Size(0, 30)),
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
              ]),
              trailing: const Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Text("PURCHASED")],
              )));
    }
    throw Exception("Invalid type of advance state: $advanceState");
  }
}

enum AdvanceState { affordable, unaffordable, inCart, purchased }

final class SearchController<ResultType> extends StatefulWidget {
  final Function(List<ResultType>) resultsFunction;
  final bool Function(ResultType, String) queryFunction;
  final Iterable<ResultType> allItems;

  const SearchController(
      {super.key,
      required this.allItems,
      required this.queryFunction,
      required this.resultsFunction});

  @override
  SearchControllerState createState() => SearchControllerState();
}

final class SearchControllerState<ResultType> extends State<SearchController> {
  final TextEditingController searchController = TextEditingController();
  var query = "";

  void refresh() {
    List<ResultType> searchResults = [];
    for (var item in widget.allItems) {
      if (widget.queryFunction(item, query.toLowerCase())) {
        searchResults.add(item);
      }
    }

    widget.resultsFunction(searchResults);
    setState(() {});
  }

  void filterSearchResults(String query) {
    this.query = query;
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        filterSearchResults(value);
      },
      controller: searchController,
      decoration: const InputDecoration(
          labelText: "Search",
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)))),
    );
  }
}
