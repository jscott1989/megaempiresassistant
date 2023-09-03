import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/data/advance_colour.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/data/purchased_advance.dart';
import 'package:mega_empires_assistant/data/short_game.dart';
import 'package:mega_empires_assistant/game/advances.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';
import 'package:mega_empires_assistant/screens/additional_credits.dart';
import 'package:mega_empires_assistant/screens/summary.dart';
import 'package:mega_empires_assistant/screens/widgets/keys.dart';

/// Screen for selecting short game scenarios
final class ShortGameScreen extends StatefulWidget {
  final GameState state;

  const ShortGameScreen({Key? key, required this.state}) : super(key: key);

  @override
  ShortGameScreenState createState() => ShortGameScreenState();
}

final class ShortGameScreenState extends State<ShortGameScreen> {
  Scenario? selectedScenario;
  Set<PurchasedAdvance> selectedAdvances = {};

  Scenario? selectedScenarioInProgress;
  Set<PurchasedAdvance> selectedAdvancesInProgress = {};

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void selectAdvances() {
    if (selectedScenarioInProgress == null) {
      setState(() {
        selectedScenario = null;
        selectedAdvances = {};
      });
      return;
    }

    final unrecordedAdvances = selectedScenarioInProgress!.advances
        .map((e) => indexedAdvances[e]!)
        .where((e) => !selectedAdvancesInProgress!
            .any((element) => element.advance.key == e.key));

    setState(() {
      unrecordedAdvances
          .where((element) => element.optionalCredits == 0)
          .forEach((element) {
        selectedAdvancesInProgress.add(element.purchase());
      });
    });

    final nextSelectCredits = unrecordedAdvances
        .where((element) => element.optionalCredits > 0)
        .firstOrNull;
    if (nextSelectCredits != null) {
      final allMandatoryCredits = {for (var e in AdvanceColour.values) e: 0};

      for (var element in selectedAdvancesInProgress) {
        element.advance.discounts.forEach((key, value) {
          allMandatoryCredits[key] = allMandatoryCredits[key]! + value;
        });
      }

      widget.state.additionalCredits.forEach((key, value) {
        allMandatoryCredits[key] = allMandatoryCredits[key]! + value;
      });

      nextSelectCredits.discounts.forEach((key, value) {
        allMandatoryCredits[key] = allMandatoryCredits[key]! + value;
      });

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChooseAdditionalCreditsScreen(
                  state: widget.state,
                  mandatoryCredits: allMandatoryCredits,
                  numberOfCredits: nextSelectCredits.optionalCredits,
                  update: (credits) {
                    setState(() {
                      selectedAdvancesInProgress.add(
                          PurchasedAdvance.withAdditional(
                              nextSelectCredits, credits));
                    });
                    selectAdvances();
                  })));
    } else {
      selectedScenario = selectedScenarioInProgress;
      selectedAdvances = selectedAdvancesInProgress;
      selectedScenarioInProgress = null;
      selectedAdvancesInProgress = {};
    }
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
                      child: SingleChildScrollView(
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
                                    RadioListTile<Scenario>(
                                      title: Text(e.name),
                                      key: Key("scenario_${e.key.name}"),
                                      value: e,
                                      groupValue: selectedScenario,
                                      onChanged: (Scenario? value) {
                                        setState(() {
                                          selectedScenarioInProgress = value;
                                          selectedAdvancesInProgress = {};
                                          selectAdvances();
                                        });
                                      },
                                    ),
                                  })
                              .toList())
                    ],
                  ))),
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
                                              // We need to take the already given additional credits out so they are also collected

                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => SummaryScreen(
                                                          additionalCredits: widget
                                                              .state
                                                              .additionalCredits,
                                                          state: widget.state
                                                              .withAdditionalCredits({
                                                            for (var e
                                                                in AdvanceColour
                                                                    .values)
                                                              e: 0
                                                          }).withAdvancesInCart(
                                                                  selectedAdvances!))),
                                                  (route) => false);
                                            }
                                          : null,
                                      key: startButton,
                                      child: Text(S.of(context).start))
                                ])
                          ]))
                ])));
  }
}
