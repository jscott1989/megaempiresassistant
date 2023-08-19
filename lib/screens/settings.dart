import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mega_empires_assistant/screens/trade_goods.dart';

import '../main.dart';

class EditSettings extends StatefulWidget {
  GameState state;
  Function update;

  EditSettings({Key? key, required this.state, required this.update}) : super(key: key);

  @override
  _EditSettingsState createState() => _EditSettingsState();
}

class _EditSettingsState extends State<EditSettings> {

  var easternEmpiresEnabled = false;
  var westernEmpiresEnabled = false;

  final numberOfPlayersController = TextEditingController();

  @override
  void dispose() {
    numberOfPlayersController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    easternEmpiresEnabled = widget.state.settings.games.contains(Game.EASTERN);
    westernEmpiresEnabled = widget.state.settings.games.contains(Game.WESTERN);
    numberOfPlayersController.text = widget.state.settings.numberOfPlayers.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Settings"),
        ),
        body: Container(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Size.fromWidth(100).width),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Games"),

                      CheckboxListTile(
                        title: Text("Western Empires"),
                        value: westernEmpiresEnabled,
                        onChanged: (newValue) {
                          setState(() {
                            westernEmpiresEnabled = newValue!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                      ),

                      CheckboxListTile(
                        title: Text("Eastern Empires"),
                        value: easternEmpiresEnabled,
                        onChanged: (newValue) {
                          setState(() {
                            easternEmpiresEnabled = newValue!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                      ),

                      TextField(
                          decoration: new InputDecoration(
                              labelText: "Number of players",
                              border: OutlineInputBorder()
                          ),
                          controller: numberOfPlayersController,
                          onChanged: (v) { setState(() {

                          });},
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ]
                      ),

                      Text(""), // Spacer

                      OutlinedButton(
                          onPressed: (canContinue() ? () {

                            var enabledGames = Set<Game>();

                            if (easternEmpiresEnabled) {
                              enabledGames.add(Game.EASTERN);
                            }
                            if (westernEmpiresEnabled) {
                              enabledGames.add(Game.WESTERN);
                            }

                            Navigator.pop(context);
                            widget.update(widget.state.withSettings(
                              Settings(
                                numberOfPlayers: int.parse(numberOfPlayersController.text),
                                games: enabledGames,
                                setup: GameSetup.NORMAL // TODO: COnfiugre
                              )
                            ));
                          } : null), child: Text("Continue"))

                    ]))));
  }

  bool canContinue() {

    var maxPlayers = 0;

    if (westernEmpiresEnabled) {
      maxPlayers += 9;
    }
    if (easternEmpiresEnabled) {
      maxPlayers += 9;
    }

    if (maxPlayers == 0) {
      return false;
    }

    if (numberOfPlayersController.text.isEmpty) {
      return false;
    }

    var numberOfPlayers = int.parse(numberOfPlayersController.text);

    if (numberOfPlayers < 1 || numberOfPlayers > maxPlayers) {
      return false;
    }

    return true;
  }
}