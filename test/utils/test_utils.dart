import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';
import 'package:mega_empires_assistant/screens/short_game.dart';
import 'package:mega_empires_assistant/screens/summary.dart';
import 'package:mega_empires_assistant/screens/trade_goods.dart';
import 'package:shared_preferences/shared_preferences.dart';

void initTests() async {
  SharedPreferences.setMockInitialValues({});
  await S.load(const Locale.fromSubtags(languageCode: 'en'));
}

final testNavigator = MockNavigatorObserver();

/// Set up the app correctly with localization, navigation, etc. for the given
/// widget
Widget prepareWidget(Widget child) {
  testNavigator.reset();
  return MaterialApp(
      title: "Mega Empires Assistant",
      // S.of(context).appName (can't be used yet)
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: child,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      navigatorObservers: [testNavigator],
      supportedLocales: S.delegate.supportedLocales);
}

/// Find the [GameState] of the current screen, whatever it is
GameState findGameState(WidgetTester tester, CommonFinders find) {
  if (find.byType(SummaryScreen).evaluate().isNotEmpty) {
    return tester
        .state<SummaryScreenState>(find.byType(SummaryScreen))
        .widget
        .state;
  }

  if (find.byType(SelectTradeGoodsScreen).evaluate().isNotEmpty) {
    return tester
        .state<SelectTradeGoodsScreenState>(find.byType(SelectTradeGoodsScreen))
        .widget
        .state;
  }

  if (find.byType(ShortGameScreen).evaluate().isNotEmpty) {
    return tester
        .state<ShortGameScreenState>(find.byType(ShortGameScreen))
        .widget
        .state;
  }

  throw Exception(
      "Could not find GameState. Maybe the screen hasn't been added to findGameState");
}

/// Use to dump the current screen state - useful while developing tests
Future<void> dumpAppToAppPng() {
  return expectLater(
      find.byType(MaterialApp), matchesGoldenFile('golden/App.png'));
}

class MockNavigatorObserver extends NavigatorObserver {
  Route<dynamic>? latestPushed;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    latestPushed = route;
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {}

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {}

  @override
  void didStopUserGesture() {}

  void reset() {
    latestPushed = null;
  }
}
