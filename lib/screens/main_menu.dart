import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mega_empires_assistant/screens/trade_goods.dart';

import '../generated/l10n.dart';
import '../main.dart';
import 'new_game.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({ Key? key }) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

  var canContinue = false;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then(
            (value) => setState(() {
              canContinue = value.getString("gameState") != null;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).appName),
            ),
            body: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Size.fromWidth(100).width),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(S.of(context).instructions),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: new OutlinedButton(
              child: new Text(S.of(context).cont),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                ),
                onPressed: canContinue ? () {
    SharedPreferences.getInstance().then(
    (value) => setState(()
    {
      var gameState = GameState.fromJson(jsonDecode(value.getString("gameState")!));

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  TradeGoods(state: gameState))
      );
    }));
                } : null
              )),
                  new OutlinedButton(
                      child: new Text(S.of(context).newGame),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size.fromHeight(40),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewGame()
                            )
                        );
                      }
                  )
              ]),
            )));
  }
}