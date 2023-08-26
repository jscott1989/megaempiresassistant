import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/data/advance_colour.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';
import 'package:mega_empires_assistant/screens/widgets/credit_list_tile.dart';

/// Screen to allow modifying credits without making a purchase
final class EditCreditsScreen extends StatefulWidget {
  /// The starting [GameState]
  final GameState state;

  /// Callback to be called with the modified [GameState]
  final Function(GameState) update;

  const EditCreditsScreen({Key? key, required this.state, required this.update})
      : super(key: key);

  @override
  EditCreditsScreenState createState() => EditCreditsScreenState();
}

final class EditCreditsScreenState extends State<EditCreditsScreen> {
  /// The credits which have been added by editing
  final Map<AdvanceColour, int> additionalCredits = {
    for (var e in AdvanceColour.values) e: 0
  };

  /// The credits which are required due to purchased advances, game settings, etc
  final Map<AdvanceColour, int> baseCredits = {
    for (var e in AdvanceColour.values) e: 0
  };

  @override
  void initState() {
    widget.state.additionalCredits.forEach((k, v) {
      additionalCredits[k] = (additionalCredits[k] ?? 0) + v;
    });

    for (var f in widget.state.purchasedAdvances) {
      f.credits().forEach((advanceColour, count) {
        baseCredits[advanceColour] = baseCredits[advanceColour]! + count;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).editCredits),
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: additionalCredits.length,
              itemBuilder: (context, index) {
                final colour = additionalCredits.keys.elementAt(index);
                return CreditListTile(
                  creditType: colour,
                  itemCount: (additionalCredits[colour] ?? 0) +
                      (baseCredits[colour] ?? 0),
                  min: (baseCredits[colour] ?? 0),
                  increment: () {
                    setState(() {
                      additionalCredits[colour] =
                          (additionalCredits[colour] ?? 0) + 5;
                    });
                  },
                  decrement: () {
                    setState(() {
                      additionalCredits[colour] =
                          (additionalCredits[colour] ?? 0) - 5;
                    });
                  },
                );
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      OutlinedButton(
                        child: Text(S.of(context).cont),
                        onPressed: () {
                          Navigator.pop(context);
                          widget.update(widget.state
                              .withAdditionalCredits(additionalCredits));
                        },
                      )
                    ],
                  )
                ],
              )),
        ]));
  }
}
