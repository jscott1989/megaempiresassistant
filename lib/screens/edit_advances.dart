import 'package:flutter/material.dart' hide SearchController;
import 'package:mega_empires_assistant/data/advance.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/data/purchased_advance.dart';
import 'package:mega_empires_assistant/game/advances.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';
import 'package:mega_empires_assistant/screens/edit_credits.dart';
import 'package:mega_empires_assistant/screens/view_advance.dart';
import 'package:mega_empires_assistant/screens/widgets/search_controller.dart';

/// Screen to allow modifying the advances we have, without taking into account
/// costs, etc.
final class EditAdvancesScreen extends StatefulWidget {
  /// A callback to be called with the modified [GameState] upon completion
  final Function(GameState) update;

  /// The starting [GameState]
  final GameState state;

  const EditAdvancesScreen(
      {Key? key, required this.state, required this.update})
      : super(key: key);

  @override
  EditAdvancesScreenState createState() => EditAdvancesScreenState();
}

final class EditAdvancesScreenState extends State<EditAdvancesScreen> {
  final List<Advance> activeAdvances = [];
  final purchasedAdvances = <PurchasedAdvance>{};
  final selectedAdvances = <Advance, PurchasedAdvance>{};

  @override
  void initState() {
    purchasedAdvances.addAll(widget.state.purchasedAdvances);
    for (var advance in purchasedAdvances) {
      selectedAdvances[advance.advance] = advance;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).editAdvances),
        ),
        body: Column(children: [
          SearchController<Advance>(
            allItems: allAdvances,
            queryFunction: (advance, query) {
              return advance.title.toLowerCase().contains(query);
            },
            itemBuilder: (advance) {
              return AdvanceListTile(
                  state: widget.state,
                  advance: advance,
                  selected: selectedAdvances.containsKey(advance),
                  onChange: (selected) {
                    if (selected) {
                      setState(() {
                        var purchase = PurchasedAdvance.of(advance);
                        purchasedAdvances.add(purchase);
                        selectedAdvances[advance] = purchase;
                      });
                    } else {
                      setState(() {
                        purchasedAdvances.remove(selectedAdvances[advance]);
                        selectedAdvances.remove(advance);
                      });
                    }
                  });
            },
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OutlinedButton(
                          child: Text(S.of(context).cont),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditCreditsScreen(
                                        state: widget.state
                                            .withAdvances(purchasedAdvances),
                                        update: (state) {
                                          Navigator.pop(context);
                                          widget.update(state);
                                        })));
                          })
                    ],
                  )
                ],
              ))
        ]));
  }
}

final class AdvanceListTile extends StatelessWidget {
  final GameState state;
  final Advance advance;
  final bool selected;
  final Function onChange;

  AdvanceListTile(
      {required this.state,
      required this.advance,
      required this.selected,
      required this.onChange})
      : super(key: Key(advance.key.name));

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: advance.boxDecoration(),
        child: CheckboxListTile(
          title: Row(children: [
            TextButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, minimumSize: const Size(0, 30)),
              child: const Icon(Icons.info_outline, color: Colors.black),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ViewAdvanceScreen(state: state, advance: advance)));
              },
            ),
            Text(" ${advance.title}")
          ]),
          value: selected,
          onChanged: (bool? value) {
            onChange(value);
          },
        ));
  }
}
