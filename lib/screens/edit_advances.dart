import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/screens/view_advance.dart';
import 'package:mega_empires_assistant/util/utils.dart';

import '../data/advance.dart';
import '../game/advances.dart';
import 'edit_credits.dart';
import '../main.dart';
import '../data/purchased_advance.dart';


class EditAdvances extends StatefulWidget {
  Function(GameState) update;
  GameState state;

  EditAdvances({Key? key, required this.state, required this.update}) : super(key: key);

  @override
  _EditAdvancesState createState() => _EditAdvancesState();
}

class _EditAdvancesState extends State<EditAdvances> {
  TextEditingController searchController = TextEditingController();

  List<Advance> activeAdvances = [];
  var purchasedAdvances = Set<PurchasedAdvance>();
  var selectedAdvances = Map<Advance, PurchasedAdvance>();

  @override
  void initState() {
    purchasedAdvances.addAll(widget.state.purchasedAdvances);
    for (var advance in purchasedAdvances) {
      selectedAdvances[advance.advance] = advance;
    }

    activeAdvances.addAll(allAdvances);
    super.initState();
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      List<Advance> searchResults = [];
      allAdvances.forEach((item) {
        if (item.title.toLowerCase().contains(query.toLowerCase())) {
          searchResults.add(item);
        }
      });
      setState(() {
        activeAdvances.clear();
        activeAdvances.addAll(searchResults);
      });
      return;
    } else {
      setState(() {
        activeAdvances.clear();
        activeAdvances.addAll(allAdvances);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text("Edit Advances"),
            ),
            body: Container(
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      filterSearchResults(value);
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                        labelText: "Search",
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25.0)))),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: activeAdvances.length,
                    itemBuilder: (context, index) {
                      return AdvanceListTile(
                          state: widget.state,
                          advance: activeAdvances[index],
                          selected:
                          selectedAdvances.containsKey(activeAdvances[index]),
                          onChange: (selected) {
                            if (selected) {
                              setState(() {
                                var purchase = PurchasedAdvance.of(activeAdvances[index]);
                                purchasedAdvances.add(purchase);
                                selectedAdvances[activeAdvances[index]] = purchase;
                              });
                            } else {
                              setState(() {
                                purchasedAdvances.remove(selectedAdvances[activeAdvances[index]]);
                                selectedAdvances.remove(activeAdvances[index]);
                              });
                            }
                          });
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditCredits(
                                          state: widget.state.withAdvances(purchasedAdvances),
                                          update: (state) {
                                            Navigator.pop(context);
                                            widget.update(state);
                                          }))
                                );
                                }
                            )
                          ],
                        )
                      ],
                    )),
              ]),
            ));
  }
}

class AdvanceListTile extends StatelessWidget {
  GameState state;
  Advance advance;
  bool selected;
  Function onChange;

  AdvanceListTile({required this.state, required this.advance, required this.selected, required this.onChange})
      : super(key: Key(advance.title));

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: boxDecorationForAdvance(advance),
        child: new CheckboxListTile(
          title: Row(children: [
            TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size(0, 30)),
              child: Icon(Icons.info_outline, color: Colors.black),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewAdvance(state: state, advance: advance)
                    ));
              },
            ), Text(" " + advance.title)]),
          value: selected,
          onChanged: (bool? value) {
            onChange(value);
          },
        ));
  }
}