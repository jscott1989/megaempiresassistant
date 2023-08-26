import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';
import 'package:mega_empires_assistant/screens/new_game.dart';
import 'package:mega_empires_assistant/screens/trade_goods.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The Welcome Screen
final class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  MainMenuScreenState createState() => MainMenuScreenState();
}

final class MainMenuScreenState extends State<MainMenuScreen> {
  /// True if we have a stored game we can resume
  var canContinue = false;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) => setState(() {
          canContinue = value.getString("gameState") != null;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).appName),
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: const Size.fromWidth(100).width),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(S.of(context).instructions),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(40),
                        ),
                        onPressed: canContinue
                            ? () {
                                SharedPreferences.getInstance()
                                    .then((value) => setState(() {
                                          var gameState = GameState.fromJson(
                                              jsonDecode(value
                                                  .getString("gameState")!));

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SelectTradeGoodsScreen(
                                                          state: gameState)));
                                        }));
                              }
                            : null,
                        child: Text(S.of(context).cont))),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(40),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewGameScreen()));
                    },
                    child: Text(S.of(context).newGame))
              ]),
        ));
  }
}
