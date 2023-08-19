import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mega_empires_assistant/screens/trade_goods.dart';

import '../main.dart';

class NewGame extends StatefulWidget {
  const NewGame({ Key? key }) : super(key: key);

  @override
  _NewGameState createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  var easternEmpiresEnabled = false;
  var westernEmpiresEnabled = false;
  var isFirstGame = false;
  var isShortGame = false;
  var isExpertGame = false;

  final numberOfPlayersController = TextEditingController();

  @override
  void dispose() {
    numberOfPlayersController.dispose();
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
          title: Text("Mega Empires Assistant"),
        ),
        body: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Size.fromWidth(100).width),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CheckboxListTile(
                      title: Text("Western Empires"),
                      value: westernEmpiresEnabled,
                      onChanged: (newValue) {
                        setState(() {
                          westernEmpiresEnabled = newValue!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),

                    CheckboxListTile(
                      title: Text("Eastern Empires"),
                      value: easternEmpiresEnabled,
                      onChanged: (newValue) {
                        setState(() {
                          easternEmpiresEnabled = newValue!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),

                    CheckboxListTile(
                      title: Text("First Game"),
                      value: isFirstGame,
                      onChanged: (newValue) {
                        setState(() {
                          isFirstGame = newValue!;
                          if (isFirstGame) {
                            isShortGame = false;
                            isExpertGame = false;
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),

                    CheckboxListTile(
                      title: Text("Short Game"),
                      value: isShortGame,
                      onChanged: (newValue) {
                        setState(() {
                          isShortGame = newValue!;
                          if (isShortGame) {
                            isFirstGame = false;
                            isExpertGame = false;
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),

                    CheckboxListTile(
                      title: Text("Expert Game"),
                      value: isExpertGame,
                      onChanged: (newValue) {
                        setState(() {
                          isExpertGame = newValue!;
                          if (isExpertGame) {
                            isFirstGame = false;
                            isShortGame = false;
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),

                    Text(""), // Spacer

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

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                          builder: (context) =>
                            TradeGoods(state: GameState(
                              additionalCredits: Map.of(START_CREDITS),
                              purchasedAdvances: Set(),
                              tradeGoods: Map(),
                              advancesInCart: Set(),
                              settings: Settings(numberOfPlayers: int.parse(numberOfPlayersController.text), games: enabledGames, setup: gameSetup()) // TODO: CONFIGURE SETUP
                            ))), (Route<dynamic> route) => false);
                    } : null), child: Text("Start"))

    ]))));
  }

  GameSetup gameSetup() {
    if (isShortGame) {
      return GameSetup.SHORT;
    } else {
      // TODO: Figure out if expert or first game have implications we need to track (expert does not seem to)
      return GameSetup.NORMAL;
    }
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