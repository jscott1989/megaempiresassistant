import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/data/short_game.dart';
import 'package:mega_empires_assistant/game/advances.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';
import 'package:mega_empires_assistant/screens/summary.dart';

/// Screen for selecting short game scenarios
final class ShortGameScreen extends StatefulWidget {
  final GameState state;

  const ShortGameScreen({Key? key, required this.state}) : super(key: key);

  @override
  ShortGameScreenState createState() => ShortGameScreenState();
}

final class ShortGameScreenState extends State<ShortGameScreen> {
  Scenario? selectedScenario;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).appName),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: const Size.fromWidth(100).width),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(""), // Spacer
                      Text(
                        S.of(context).selectScenario,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Column(
                          children: scenariosForState(widget.state)
                              .expand((e) => {
                                    ListTile(
                                      title: Text(e.name),
                                      leading: Radio<Scenario>(
                                        value: e,
                                        groupValue: selectedScenario,
                                        onChanged: (Scenario? value) {
                                          setState(() {
                                            selectedScenario = value;
                                          });
                                        },
                                      ),
                                    )
                                  })
                              .toList())
                    ],
                  )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ButtonBar(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  OutlinedButton(
                                      onPressed: (selectedScenario != null)
                                          ? () {
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => SummaryScreen(
                                                          state: widget.state.withAdvancesInCart(
                                                              selectedScenario!
                                                                  .advances
                                                                  .map((e) =>
                                                                      indexedAdvances[
                                                                              e]!
                                                                          .purchase())
                                                                  .toSet()))),
                                                  (route) => false);
                                            }
                                          : null,
                                      child: Text(S.of(context).start))
                                ])
                          ]))
                ])));
  }
}
