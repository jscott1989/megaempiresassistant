import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/data/advance_colour.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';
import 'package:mega_empires_assistant/screens/widgets/credit_list_tile.dart';

/// Screen used when a purchased advance requires selecting some number of
/// "additional" credits on top of the ones it gives by default.
final class ChooseAdditionalCreditsScreen extends StatefulWidget {
  /// The overall game state.
  final GameState state;

  /// A callback to be called when the additional credits have been selected.
  final Function(Map<AdvanceColour, int>) update;

  /// The number of credits which can be selected.
  final int numberOfCredits;

  /// The number of credits that the selected advance provides by default.
  final Map<AdvanceColour, int> mandatoryCredits;

  const ChooseAdditionalCreditsScreen(
      {Key? key,
      required this.state,
      required this.mandatoryCredits,
      required this.numberOfCredits,
      required this.update})
      : super(key: key);

  @override
  ChooseAdditionalCreditsScreenState createState() =>
      ChooseAdditionalCreditsScreenState();
}

final class ChooseAdditionalCreditsScreenState
    extends State<ChooseAdditionalCreditsScreen> {
  /// The additional credits selected
  final Map<AdvanceColour, int> additionalCredits = {
    AdvanceColour.yellow: 0,
    AdvanceColour.green: 0,
    AdvanceColour.blue: 0,
    AdvanceColour.red: 0,
    AdvanceColour.orange: 0
  };

  /// The credits which we have already collected
  late final Map<AdvanceColour, int> baseCredits;

  /// The number of credits to be assigned in total
  late final int numberOfCredits;

  /// The number of credits still to be spent
  int remainingCredits() {
    return numberOfCredits -
        additionalCredits.values.reduce((value, element) => value + element);
  }

  @override
  void initState() {
    numberOfCredits = widget.numberOfCredits;
    baseCredits = calculateBaseCredits();
    super.initState();
  }

  /// Calculate the minimum possible credits that can be committed
  ///
  /// This includes all credits collected as part of the game so far, plus
  /// mandatory credits for the advance we are purchasing
  Map<AdvanceColour, int> calculateBaseCredits() {
    final Map<AdvanceColour, int> credits = {};

    // The credits already committed in this game
    widget.state.totalCredits.forEach((k, v) {
      credits[k] = v;
    });

    // Plus the mandatory credits for the advance we are purchasing
    widget.mandatoryCredits.forEach((advanceColour, count) {
      credits[advanceColour] = (credits[advanceColour] ?? 0) + count;
    });

    return credits;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).additionalCredits),
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: additionalCredits.length,
              itemBuilder: (context, index) {
                final advanceColour = additionalCredits.keys.elementAt(index);
                return CreditListTile(
                  creditType: advanceColour,
                  itemCount: (additionalCredits[advanceColour] ?? 0) +
                      (baseCredits[advanceColour] ?? 0),
                  min: (baseCredits[advanceColour] ?? 0),
                  max: (additionalCredits[advanceColour] ?? 0) +
                      (baseCredits[advanceColour] ?? 0) +
                      remainingCredits(),
                  increment: () {
                    setState(() {
                      additionalCredits[advanceColour] =
                          (additionalCredits[advanceColour] ?? 0) + 5;
                    });
                  },
                  decrement: () {
                    setState(() {
                      additionalCredits[advanceColour] =
                          (additionalCredits[advanceColour] ?? 0) - 5;
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
                  Text(S.of(context).remainingCredits(remainingCredits())),
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: remainingCredits() == 0
                            ? () {
                                Navigator.pop(context);
                                widget.update(additionalCredits);
                              }
                            : null,
                        child: Text(S.of(context).cont),
                      )
                    ],
                  )
                ],
              )),
        ]));
  }
}
