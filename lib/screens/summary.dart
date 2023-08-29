import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/data/trade_goods.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';
import 'package:mega_empires_assistant/screens/keys.dart';
import 'package:mega_empires_assistant/screens/trade_goods.dart';

import '../data/advance_colour.dart';

/// Summary screen to inform about clean up at the end of the round
/// (things to pick up, discard, etc.)
final class SummaryScreen extends StatefulWidget {
  /// The game state at the end of the round
  final GameState state;

  /// The trade goods to be discarded
  final Map<TradeGood, int> spendingGoods;

  /// Additional credits to be picked up
  final Map<AdvanceColour, int> additionalCredits;

  SummaryScreen(
      {Key? key,
      required this.state,
      Map<TradeGood, int>? spendingGoods,
      Map<AdvanceColour, int>? additionalCredits})
      : spendingGoods = spendingGoods ?? {},
        additionalCredits = additionalCredits ?? {},
        super(key: key);

  @override
  SummaryScreenState createState() => SummaryScreenState();
}

final class SummaryScreenState extends State<SummaryScreen> {
  /// Credits to be picked up
  final Map<AdvanceColour, int> credits = {
    for (var e in AdvanceColour.values) e: 0
  };

  @override
  void initState() {
    for (var purchasedAdvance in widget.state.advancesInCart) {
      purchasedAdvance.credits().forEach((colour, value) {
        credits[colour] = credits[colour]! + value;
      });
    }
    widget.additionalCredits.forEach((colour, value) {
      credits[colour] = credits[colour]! + value;
    });

    super.initState();
  }

  /// True if there is anything to pick up
  bool hasThingsToPickup() {
    return widget.state.advancesInCart.isNotEmpty ||
        credits.values.fold(0, (a, b) => a + b) > 0;
  }

  /// True if there is anything to discard
  bool hasThingsToDiscard() {
    return widget.spendingGoods.values.fold(0, (a, b) => a + b) > 0;
  }

  void nextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              SelectTradeGoodsScreen(state: widget.state.asNewRound())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).summary),
        ),
        body: Column(children: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: (hasThingsToDiscard() || hasThingsToPickup())
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                              hasThingsToPickup()
                                  ? Text(S.of(context).pickUp,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          height: 2))
                                  : const Text(""),
                              Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: widget.state.advancesInCart
                                      .map((e) => Text(e.advance.title))
                                      .toList()),
                              Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: credits.keys
                                      .where((e) => credits[e]! > 0)
                                      .map((e) => Text(
                                            "${credits[e]!} ${e.colourName} ${S.of(context).credits}",
                                            style: TextStyle(color: e.colour),
                                          ))
                                      .toList()),
                              hasThingsToDiscard()
                                  ? Text(S.of(context).discard,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          height: 2))
                                  : const Text(""),
                              Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: widget.spendingGoods.entries
                                      .where((element) => element.value > 0)
                                      .map((e) =>
                                          Text("${e.value} ${e.key.title}"))
                                      .toList())
                            ])
                      : Text(S.of(context).summaryNothingToDo))),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OutlinedButton(
                        key: startButton,
                        child: Text(S.of(context).cont),
                        onPressed: () {
                          nextScreen();
                        },
                      )
                    ],
                  )
                ],
              )),
        ]));
  }
}
