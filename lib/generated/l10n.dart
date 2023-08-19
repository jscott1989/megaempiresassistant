// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Mega Empires Assistant`
  String get appName {
    return Intl.message(
      'Mega Empires Assistant',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `The assistant is created to make your Mega Empires games go smoother.\n\nAt any point, you can use the menu in the top right corner to modify the advancements and credits you have, and the game settings.\n\nThe assistant understands the impact of the advancements and will apply them. For example, if you hold the 'Mining' advance then the value of your treasury tokens is automatically counted as double, you don't need to do anything manual to make this happen.\n\nMandatory credits are automatically applied and are visible on the credits screen. You may edit the credits on top of that for your own purposes.\n\nYou can use the 'Calamities' menu to show the effect of each calamity on you given the current state of your advances. Again, this will automatically account for advances which make calamities better or worse for you.\n\n\n\n\n`
  String get instructions {
    return Intl.message(
      'The assistant is created to make your Mega Empires games go smoother.\n\nAt any point, you can use the menu in the top right corner to modify the advancements and credits you have, and the game settings.\n\nThe assistant understands the impact of the advancements and will apply them. For example, if you hold the \'Mining\' advance then the value of your treasury tokens is automatically counted as double, you don\'t need to do anything manual to make this happen.\n\nMandatory credits are automatically applied and are visible on the credits screen. You may edit the credits on top of that for your own purposes.\n\nYou can use the \'Calamities\' menu to show the effect of each calamity on you given the current state of your advances. Again, this will automatically account for advances which make calamities better or worse for you.\n\n\n\n\n',
      name: 'instructions',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get cont {
    return Intl.message(
      'Continue',
      name: 'cont',
      desc: '',
      args: [],
    );
  }

  /// `New Game`
  String get newGame {
    return Intl.message(
      'New Game',
      name: 'newGame',
      desc: '',
      args: [],
    );
  }

  /// `Yellow`
  String get advanceColourYellow {
    return Intl.message(
      'Yellow',
      name: 'advanceColourYellow',
      desc: '',
      args: [],
    );
  }

  /// `Religion`
  String get advanceColourNameYellow {
    return Intl.message(
      'Religion',
      name: 'advanceColourNameYellow',
      desc: '',
      args: [],
    );
  }

  /// `Green`
  String get advanceColourGreen {
    return Intl.message(
      'Green',
      name: 'advanceColourGreen',
      desc: '',
      args: [],
    );
  }

  /// `Science`
  String get advanceColourNameGreen {
    return Intl.message(
      'Science',
      name: 'advanceColourNameGreen',
      desc: '',
      args: [],
    );
  }

  /// `Blue`
  String get advanceColourBlue {
    return Intl.message(
      'Blue',
      name: 'advanceColourBlue',
      desc: '',
      args: [],
    );
  }

  /// `Arts`
  String get advanceColourNameBlue {
    return Intl.message(
      'Arts',
      name: 'advanceColourNameBlue',
      desc: '',
      args: [],
    );
  }

  /// `Red`
  String get advanceColourRed {
    return Intl.message(
      'Red',
      name: 'advanceColourRed',
      desc: '',
      args: [],
    );
  }

  /// `Civics`
  String get advanceColourNameRed {
    return Intl.message(
      'Civics',
      name: 'advanceColourNameRed',
      desc: '',
      args: [],
    );
  }

  /// `Orange`
  String get advanceColourOrange {
    return Intl.message(
      'Orange',
      name: 'advanceColourOrange',
      desc: '',
      args: [],
    );
  }

  /// `Crafts`
  String get advanceColourNameOrange {
    return Intl.message(
      'Crafts',
      name: 'advanceColourNameOrange',
      desc: '',
      args: [],
    );
  }

  /// `Additional Credits`
  String get additionalCredits {
    return Intl.message(
      'Additional Credits',
      name: 'additionalCredits',
      desc: '',
      args: [],
    );
  }

  /// `Purchase Advances`
  String get purchaseAdvances {
    return Intl.message(
      'Purchase Advances',
      name: 'purchaseAdvances',
      desc: '',
      args: [],
    );
  }

  /// `No advances match your query`
  String get noAdvancesMatchYourQuery {
    return Intl.message(
      'No advances match your query',
      name: 'noAdvancesMatchYourQuery',
      desc: '',
      args: [],
    );
  }

  /// `Remaining: {remainingCredits}`
  String remainingCredits(int remainingCredits) {
    return Intl.message(
      'Remaining: $remainingCredits',
      name: 'remainingCredits',
      desc:
          'The remaining credits to choose on the \'additional credits\' screen',
      args: [remainingCredits],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
