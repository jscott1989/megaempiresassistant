import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/main.dart';
import 'package:mega_empires_assistant/screens/summary.dart';
import 'package:mega_empires_assistant/screens/trade_goods.dart';
import '../util/utils.dart';

// TODO: Add a warning that we will need to discard if we have > the hand limit
// 10-11 players: 8
// 12-18: 9
class Payment extends StatefulWidget {
  GameState state;

  Payment({Key? key, required this.state}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  var tradeGoodCounts = Map<TradeGood, int>();
  var tradeGoodMax = Map<TradeGood, int>();
  List<TradeGood> activeTradeGoods = [];
  late int toRemove;

  @override
  void initState() {
    tradeGoodMax = Map.of(widget.state.tradeGoods);
    toRemove = calculateTotalCost(widget.state);

    allTradeGoods.forEach((tradeGood) {
      if (tradeGoodMax.containsKey(tradeGood) && tradeGoodMax[tradeGood]! > 0) {
        activeTradeGoods.add(tradeGood);
      }
    });

    super.initState();
  }

  int stillToPay() {
    return toRemove - calculateTotalValue(tradeGoodCounts, widget.state);
  }

  String stillToPayText() {
    if (stillToPay() >= 0) {
      return "Still to pay";
    }
    return "Wasted";
  }

  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text("Make Payment"),
            ),
            body: Container(
              child: Column(children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: activeTradeGoods.length,
                    itemBuilder: (context, index) {
                      return TradeGoodListTile(
                          tradeGood: activeTradeGoods[index],
                          maxCount: tradeGoodMax[activeTradeGoods[index]]!,
                          itemCount: tradeGoodCounts
                              .containsKey(activeTradeGoods[index])
                              ? tradeGoodCounts[activeTradeGoods[index]]!
                              : 0,
                          increment: () {
                            setState(() {
                              tradeGoodCounts
                                  .putIfAbsent(activeTradeGoods[index], () {
                                return 0;
                              });
                              tradeGoodCounts[activeTradeGoods[index]] = tradeGoodCounts[activeTradeGoods[index]]! + 1;
                            });
                          },
                          decrement: () {
                            setState(() {
                              tradeGoodCounts
                                  .putIfAbsent(activeTradeGoods[index], () {
                                return 0;
                              });
                              tradeGoodCounts[activeTradeGoods[index]] = tradeGoodCounts[activeTradeGoods[index]]! - 1;
                            });
                          });
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                            child: Text(stillToPayText() + ": " +
                                (stillToPay().abs())
                                    .toString()),
                            padding: const EdgeInsets.only(right: 40)),
                        ButtonBar(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new OutlinedButton(
                              child: new Text('Continue'),
                              onPressed: stillToPay() > 0 ? null : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Summary(
                                          state: widget.state, spendingGoods: tradeGoodCounts)),
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

class TradeGoodListTile extends StatelessWidget {
  final int itemCount;
  final int maxCount;
  TradeGood tradeGood;

  VoidCallback increment;
  VoidCallback decrement;

  TradeGoodListTile(
      {required this.tradeGood, required this.maxCount, required this.itemCount, required this.increment, required this.decrement})
      : super(key: Key(tradeGood.title));

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        title: new Text(tradeGood.title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            itemCount != 0
                ? new IconButton(
                icon: new Icon(Icons.remove), onPressed: decrement)
                : new Container(),
            Text(itemCount.toString()),
            itemCount < maxCount
                ? new IconButton(
                icon: new Icon(Icons.add), onPressed: increment)
                : new Container(height: 10, width: 48)
          ],
        ));
  }
}
