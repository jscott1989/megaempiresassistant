import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/data/advance.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';

/// Screen showing information about a particular [Advance]
final class ViewAdvanceScreen extends StatefulWidget {
  /// Overall [GameState]
  final GameState state;

  /// The [Advance] being viewed
  final Advance advance;

  const ViewAdvanceScreen(
      {Key? key, required this.state, required this.advance})
      : super(key: key);

  @override
  ViewAdvanceScreenState createState() => ViewAdvanceScreenState();
}

final class ViewAdvanceScreenState extends State<ViewAdvanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            widget.advance.title,
            style: const TextStyle(color: Colors.black),
          ),
          flexibleSpace: Container(
            decoration: widget.advance.boxDecoration(),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                  Row(
                    children: [
                      Text(S.of(context).price,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              height: 2)),
                      const Spacer(),
                      Text(S.of(context).points,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              height: 2)),
                    ],
                  ),
                  Row(
                    children: [
                      Text(widget.advance.price.toString()),
                      const Spacer(),
                      Text(widget.advance.points.toString()),
                    ],
                  ),
                  Text(S.of(context).description,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 2)),
                  Text(widget.advance.description),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: widget.advance.specialAbilities
                        .map((e) => Text(S.of(context).specialAbilityTitle(e)))
                        .toList(),
                  ),
                  const Text(""),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: widget.advance.positiveEffects
                        .map((e) => Text(
                            e.calamity().title(widget.state) +
                                ": " +
                                e.description,
                            style: const TextStyle(color: Colors.green)))
                        .toList(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: widget.advance.negativeEffects
                        .map((e) => Text(
                            e.calamity().title(widget.state) +
                                ": " +
                                e.description,
                            style: const TextStyle(color: Colors.red)))
                        .toList(),
                  ),
                  Text(widget.advance.notes.isEmpty ? "" : S.of(context).notes,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 2)),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: widget.advance.notes
                          .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(e)))
                          .toList()),
                  Text(S.of(context).discounts,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 2)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: widget.advance.discounts.keys
                        .map((e) => Text(
                            "${widget.advance.discounts[e]!} ${e.colourName}",
                            style: TextStyle(color: e.colour)))
                        .toList(),
                  ),
                  Text(widget.advance.specificDiscount == null
                      ? ""
                      : S.of(context).discountAmount(
                          widget.advance.specificDiscount!.amount,
                          widget.advance.specificDiscount!.advance().title))
                ]))));
  }
}
