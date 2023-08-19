import 'package:flutter/material.dart';

import '../data/advance.dart';
import '../data/advance_colour.dart';
import '../main.dart';
import '../util/utils.dart';

class ViewAdvance extends StatefulWidget {
  final GameState state;
  final Advance advance;

  ViewAdvance({Key? key, required this.state, required this.advance})
      : super(key: key);

  @override
  _ViewAdvanceState createState() => _ViewAdvanceState();
}

class _ViewAdvanceState extends State<ViewAdvance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(widget.advance.title, style: new TextStyle(color: Colors.black),),
          // backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: boxDecorationForAdvance(widget.advance),
          ),
        ),
        body: Container(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(children: [
                  Text("Price", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 2)),
                  Spacer(),
                  Text("Points", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 2)),
                ],),
                Row(children: [
                  Text(widget.advance.price.toString()),
                  Spacer(),
                  Text(widget.advance.points.toString()),
                ],),
                Text("Description", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 2)),
                Text(widget.advance.description),
                Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: widget.advance.specialAbilities.map((e) => Text("SPECIAL ABILITY: " + e)).toList(),),
                Text(""),
                Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: widget.advance.positiveEffects.map((e) => Text(e.calamityName + ": " + e.effect, style: TextStyle(color: Colors.green))).toList(),),
                Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: widget.advance.negativeEffects.map((e) => Text(e.calamityName + ": " + e.effect, style: TextStyle(color: Colors.red))).toList(),),
                Text(widget.advance.notes.isEmpty ? "" : "Notes", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 2)),
                Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: widget.advance.notes.map((e) => Padding(padding: EdgeInsets.symmetric(vertical: 5), child: Text(e))).toList()),
                Text("Discounts", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 2)),
                Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: widget.advance.discounts.keys.map((e) => Text(widget.advance.discounts[e]!.toString() + " " + e.colourName, style: TextStyle(color: e.colour))).toList(),),
                Text(widget.advance.specificDiscount == null ? "" : widget.advance.specificDiscount!.amount.toString() + " to " + widget.advance.specificDiscount!.cardTitle)
              ]))),
        )
    );
  }
}