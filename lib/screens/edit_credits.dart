import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/main.dart';
import 'package:mega_empires_assistant/screens/widgets/credit_list_tile.dart';

import '../data/advance_colour.dart';

class EditCredits extends StatefulWidget {
  GameState state;
  Function update;

  EditCredits({Key? key, required this.state, required this.update})
      : super(key: key);

  @override
  EditCreditsState createState() => EditCreditsState();
}

class EditCreditsState extends State<EditCredits> {
  final List<AdvanceColour> colours = [
    AdvanceColour.yellow,
    AdvanceColour.green,
    AdvanceColour.blue,
    AdvanceColour.red,
    AdvanceColour.orange
  ];

  final Map<AdvanceColour, int> additionalCredits = {
    AdvanceColour.yellow: 0,
    AdvanceColour.green: 0,
    AdvanceColour.blue: 0,
    AdvanceColour.red: 0,
    AdvanceColour.orange: 0
  };

  final Map<AdvanceColour, int> baseCredits = {
    AdvanceColour.yellow: 0,
    AdvanceColour.green: 0,
    AdvanceColour.blue: 0,
    AdvanceColour.red: 0,
    AdvanceColour.orange: 0
  };

  @override
  void initState() {
    widget.state.additionalCredits.forEach((k, v) {
      additionalCredits[k] = (additionalCredits[k] ?? 0) + v;
    });

    if (widget.state.settings.setup != GameSetup.SHORT) {
      if (widget.state.settings.numberOfPlayers == 12) {
        baseCredits.forEach((colour, count) {
          baseCredits[colour] = count + 5;
        });
      }
      if (widget.state.settings.numberOfPlayers == 6) {
        baseCredits.forEach((colour, count) {
          baseCredits[colour] = count + 5;
        });
      } else if (widget.state.settings.numberOfPlayers == 5) {
        baseCredits.forEach((colour, count) {
          baseCredits[colour] = count + 10;
        });
      }
    }

    // Even in the short game we get the bonus for 3 and 4
    if (widget.state.settings.numberOfPlayers == 4) {
      baseCredits.forEach((colour, count) {
        baseCredits[colour] = count + 5;
      });
    } else if (widget.state.settings.numberOfPlayers == 3) {
      baseCredits.forEach((colour, count) {
        baseCredits[colour] = count + 10;
      });
    }

    for (var f in widget.state.purchasedAdvances) {
      f.credits().forEach((advanceColour, count) {
        baseCredits[advanceColour] = baseCredits[advanceColour]! + count;
      });
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Credits"),
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: additionalCredits.length,
              itemBuilder: (context, index) {
                return CreditListTile(
                  creditType: colours[index],
                  itemCount: additionalCredits[colours[index]]! +
                      baseCredits[colours[index]]!,
                  min: baseCredits[colours[index]]!,
                  increment: () {
                    setState(() {
                      additionalCredits[colours[index]] =
                          additionalCredits[colours[index]]! + 5;
                    });
                  },
                  decrement: () {
                    setState(() {
                      additionalCredits[colours[index]] =
                          additionalCredits[colours[index]]! - 5;
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
                children: <Widget>[
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new OutlinedButton(
                        child: new Text('Continue'),
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
