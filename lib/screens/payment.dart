import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/data/trade_goods.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';
import 'package:mega_empires_assistant/screens/summary.dart';

/// The screen shown when we have selected our advances and know our trade goods.
/// It allows us to select the trade goods to make up the cost
final class MakePaymentScreen extends StatefulWidget {
  /// The [GameState] when beginning making payment
  final GameState state;

  const MakePaymentScreen({Key? key, required this.state}) : super(key: key);

  @override
  MakePaymentScreenState createState() => MakePaymentScreenState();
}

final class MakePaymentScreenState extends State<MakePaymentScreen> {
  /// The number of [TradeGood]s we have selected to spend
  final tradeGoodCounts = <TradeGood, int>{};

  /// All types of [TradeGood] which we are eligible to spend
  late List<TradeGood> activeTradeGoods;

  int totalCardsAvailable = 0;

  @override
  void initState() {
    activeTradeGoods = widget.state.tradeGoods.entries
        .where((e) => e.value > 0)
        .map((e) => e.key)
        .toList();

    totalCardsAvailable = widget.state.tradeGoods.entries
        .where((e) => e.key != TradeGood.treasuryToken)
        .map((e) => e.value)
        .reduce((v, e) => v + e);

    super.initState();
  }

  /// The amount of credits still to pay after accounting for currently selected [TradeGood]s
  int get stillToPay {
    return widget.state.totalCostOfAdvancesInCart -
        calculateTotalValue(tradeGoodCounts, widget.state);
  }

  /// The prefix to the amount of credits still to pay or wasted
  String get stillToPayText {
    if (stillToPay >= 0) {
      return S.of(context).creditsStillToPay;
    }
    return S.of(context).creditsWasted;
  }

  /// The number of cards remaining after we discard the ones we've chosen
  int get cardsRemaining {
    final totalUsed = tradeGoodCounts.entries
        .where((element) => element.key != TradeGood.treasuryToken)
        .fold(0, (a, b) => a + b.value);

    return totalCardsAvailable - totalUsed;
  }

  /// The number of cards to be discarded with the current state
  /// (taking into account the cards selected as part of the current payment)
  int get cardsToDiscard {
    final handLimit = (((widget.state.settings.numberOfPlayers > 11) ? 9 : 8) +
            widget.state.purchasedAdvances
                .map((e) => e.advance.handLimitModifier)
                .fold(0, (p, e) => p + e) +
            widget.state.advancesInCart
                .map((e) => e.advance.handLimitModifier)
                .fold(0, (p, e) => p + e))
        .toInt();

    return max(0, cardsRemaining - handLimit);
  }

  /// True if we're able to continue (not over our hand limit and paid for everything)
  bool get canContinue {
    return stillToPay <= 0 && cardsToDiscard <= 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).makePayment),
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: activeTradeGoods.length,
              itemBuilder: (context, index) {
                return TradeGoodListTile(
                    tradeGood: activeTradeGoods[index],
                    maxCount: widget.state.tradeGoods[activeTradeGoods[index]]!,
                    itemCount:
                        tradeGoodCounts.containsKey(activeTradeGoods[index])
                            ? tradeGoodCounts[activeTradeGoods[index]]!
                            : 0,
                    increment: () {
                      setState(() {
                        tradeGoodCounts.putIfAbsent(activeTradeGoods[index],
                            () {
                          return 0;
                        });
                        tradeGoodCounts[activeTradeGoods[index]] =
                            tradeGoodCounts[activeTradeGoods[index]]! + 1;
                      });
                    },
                    decrement: () {
                      setState(() {
                        tradeGoodCounts.putIfAbsent(activeTradeGoods[index],
                            () {
                          return 0;
                        });
                        tradeGoodCounts[activeTradeGoods[index]] =
                            tradeGoodCounts[activeTradeGoods[index]]! - 1;
                      });
                    });
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                              padding: const EdgeInsets.only(right: 40),
                              child: Row(children: [
                                Text(
                                  "$stillToPayText: ${stillToPay.abs()}",
                                  style: TextStyle(
                                      color: (stillToPay > 0)
                                          ? Colors.red
                                          : Colors.black),
                                ),
                                const Text("     "),
                                (stillToPay > 0 || cardsToDiscard <= 0)
                                    ? const Text("")
                                    : Text(
                                        S.of(context).paymentDiscardTradeGoods(
                                            cardsToDiscard),
                                        style:
                                            const TextStyle(color: Colors.red),
                                      )
                              ])))),
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OutlinedButton(
                        onPressed: !canContinue
                            ? null
                            : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SummaryScreen(
                                          state: widget.state,
                                          spendingGoods: tradeGoodCounts)),
                                );
                              },
                        child: Text(S.of(context).cont),
                      )
                    ],
                  )
                ],
              )),
        ]));
  }
}

final class TradeGoodListTile extends StatelessWidget {
  /// The number of this trade good which we currently have selected
  final int itemCount;

  /// The maximum number of these trade goods we can select
  final int maxCount;

  /// The trade good
  final TradeGood tradeGood;

  /// Callback when the user wants to increment the count
  final VoidCallback increment;

  /// Callback when the user wants to decrement the count
  final VoidCallback decrement;

  TradeGoodListTile(
      {required this.tradeGood,
      required this.maxCount,
      required this.itemCount,
      required this.increment,
      required this.decrement})
      : super(key: Key(tradeGood.title));

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(tradeGood.title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            itemCount != 0
                ? IconButton(
                    icon: const Icon(Icons.remove), onPressed: decrement)
                : Container(),
            Text(itemCount.toString()),
            itemCount < maxCount
                ? IconButton(icon: const Icon(Icons.add), onPressed: increment)
                : const SizedBox(height: 10, width: 48)
          ],
        ));
  }
}
