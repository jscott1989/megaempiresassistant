import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';
import 'package:mega_empires_assistant/screens/main_menu.dart';

void main() => runApp(const WesternEmpiresAssistant());

/// App Entry Point
final class WesternEmpiresAssistant extends StatelessWidget {
  const WesternEmpiresAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Mega Empires Assistant",
        // S.of(context).appName (can't be used yet)
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainMenuScreen(),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales);
  }
}
