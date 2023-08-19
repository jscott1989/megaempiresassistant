import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/main.dart';
import 'package:mega_empires_assistant/screens/trade_goods.dart';
import 'package:mega_empires_assistant/util/utils.dart';
import '../data/advance_colour.dart';

class Summary extends StatefulWidget {
  final GameState state;
  final Map<TradeGood, int> spendingGoods;

  Summary({Key? key, required this.state, required this.spendingGoods})
      : super(key: key);

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {

  Map<AdvanceColour, int> credits = {
    AdvanceColour.yellow: 0,
    AdvanceColour.green: 0,
    AdvanceColour.blue: 0,
    AdvanceColour.red: 0,
    AdvanceColour.orange: 0
  };

  @override
  void initState() {
    widget.state.advancesInCart.forEach((purchasedAdvance) {
      purchasedAdvance.credits().forEach((colour, value) {
        credits[colour] = credits[colour]! + value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text("Summary"),
            ),
            body: Container(
              child: Column(children: <Widget>[
                Expanded(
                  child: Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                    Text("Pick Up", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 2)),
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: widget.state.advancesInCart.map((e) => Text(e.advance.title)).toList()
                      ),
                    Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: credits.keys.where((e) => credits[e]! > 0).map((e) => Text(credits[e]!.toString() + " " + e.colourName + " Credits", style: TextStyle(color: e.colour),)).toList()
                    ),

                    Text("Discard", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 2)),

                    Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: widget.spendingGoods.keys.map((e) => Text(widget.spendingGoods[e].toString() + " " + e.title)).toList())
                  ]))
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ButtonBar(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new OutlinedButton(
                              child: new Text('Continue'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TradeGoods(
                                          state: widget.state.asNewRound())),
                                );
                              },
                            )
                          ],
                        )
                      ],
                    )),
              ]
            )));
  }
}