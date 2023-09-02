import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';
import 'package:mega_empires_assistant/screens/keys.dart';
import 'package:mega_empires_assistant/screens/new_game.dart';
import 'package:mega_empires_assistant/screens/summary.dart';
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: SingleChildScrollView(
                        child: Text(S.of(context).instructions))),
                Flexible(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: OutlinedButton(
                            key: continueButton,
                            onPressed: canContinue
                                ? () {
                                    SharedPreferences.getInstance()
                                        .then((value) => setState(() {
                                              var gameState =
                                                  GameState.fromJson(jsonDecode(
                                                      value.getString(
                                                          "gameState")!));

                                              // We move the advances into the cart so they are picked up by the summary
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => SummaryScreen(
                                                          additionalCredits:
                                                              gameState
                                                                  .additionalCredits,
                                                          state: gameState
                                                              .withAdvancesInCart(
                                                                  gameState
                                                                      .purchasedAdvances)
                                                              .withAdvances(
                                                                  {}))));
                                            }));
                                  }
                                : null,
                            child: Text(S.of(context).cont)))),
                OutlinedButton(
                    key: startButton,
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
