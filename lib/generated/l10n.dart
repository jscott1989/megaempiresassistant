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

  /// `Edit Advances`
  String get editAdvances {
    return Intl.message(
      'Edit Advances',
      name: 'editAdvances',
      desc: '',
      args: [],
    );
  }

  /// `Edit Credits`
  String get editCredits {
    return Intl.message(
      'Edit Credits',
      name: 'editCredits',
      desc: '',
      args: [],
    );
  }

  /// `View Calamities`
  String get viewCalamities {
    return Intl.message(
      'View Calamities',
      name: 'viewCalamities',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `PURCHASED`
  String get purchased {
    return Intl.message(
      'PURCHASED',
      name: 'purchased',
      desc: '',
      args: [],
    );
  }

  /// `Slave Revolt`
  String get calamityNameSlaveRevolt {
    return Intl.message(
      'Slave Revolt',
      name: 'calamityNameSlaveRevolt',
      desc: '',
      args: [],
    );
  }

  /// `Literacy`
  String get advanceNameLiteracy {
    return Intl.message(
      'Literacy',
      name: 'advanceNameLiteracy',
      desc: '',
      args: [],
    );
  }

  /// `Superstition`
  String get calamityNameSuperstition {
    return Intl.message(
      'Superstition',
      name: 'calamityNameSuperstition',
      desc: '',
      args: [],
    );
  }

  /// `Fundamentalism`
  String get advanceNameFundamentalism {
    return Intl.message(
      'Fundamentalism',
      name: 'advanceNameFundamentalism',
      desc: '',
      args: [],
    );
  }

  /// `You may choose to destroy all units in an area adjacent by land to your units. Barbarian tokens, pirate cities and units belonging to players holding Fundamentalism or Philosophy are unaffected.`
  String get advanceNoteFundamentalism {
    return Intl.message(
      'You may choose to destroy all units in an area adjacent by land to your units. Barbarian tokens, pirate cities and units belonging to players holding Fundamentalism or Philosophy are unaffected.',
      name: 'advanceNoteFundamentalism',
      desc: '',
      args: [],
    );
  }

  /// `Regression`
  String get calamityNameRegression {
    return Intl.message(
      'Regression',
      name: 'calamityNameRegression',
      desc: '',
      args: [],
    );
  }

  /// `Monotheism`
  String get advanceNameMonotheism {
    return Intl.message(
      'Monotheism',
      name: 'advanceNameMonotheism',
      desc: '',
      args: [],
    );
  }

  /// `You may choose to annex 1 pirate city or up to 5 barbarian tokens anywhere on the board.`
  String get advanceSpecialAbilityUniversalDoctrine {
    return Intl.message(
      'You may choose to annex 1 pirate city or up to 5 barbarian tokens anywhere on the board.',
      name: 'advanceSpecialAbilityUniversalDoctrine',
      desc: '',
      args: [],
    );
  }

  /// `The barbarian tokens may be selected from more than 1 area.`
  String get advanceNoteUniversalDoctrine {
    return Intl.message(
      'The barbarian tokens may be selected from more than 1 area.',
      name: 'advanceNoteUniversalDoctrine',
      desc: '',
      args: [],
    );
  }

  /// `Theology`
  String get advanceNameTheology {
    return Intl.message(
      'Theology',
      name: 'advanceNameTheology',
      desc: '',
      args: [],
    );
  }

  /// `You may choose to annex all units in an area adjacent by land to your units. Barbarian tokens, pirate cities and units belonging to players holding Monotheism or Theology are unaffected.`
  String get advanceSpecialAbilitiesMonotheism {
    return Intl.message(
      'You may choose to annex all units in an area adjacent by land to your units. Barbarian tokens, pirate cities and units belonging to players holding Monotheism or Theology are unaffected.',
      name: 'advanceSpecialAbilitiesMonotheism',
      desc: '',
      args: [],
    );
  }

  /// `If you have insufficient units in stock to annex all units in the area to start with, you cannot select this area.`
  String get advanceNotesMonotheism1 {
    return Intl.message(
      'If you have insufficient units in stock to annex all units in the area to start with, you cannot select this area.',
      name: 'advanceNotesMonotheism1',
      desc: '',
      args: [],
    );
  }

  /// `If you annex an area containing a city and a token (due to 'Public Works') or more tokens than the population limit allows (due to 'Agriculture'), the extra token must also be annexed, even if you don't also hold any of these advances. In this case it will be destroyed during the next 'Remove surplus population' phase.`
  String get advanceNotesMonotheism2 {
    return Intl.message(
      'If you annex an area containing a city and a token (due to \'Public Works\') or more tokens than the population limit allows (due to \'Agriculture\'), the extra token must also be annexed, even if you don\'t also hold any of these advances. In this case it will be destroyed during the next \'Remove surplus population\' phase.',
      name: 'advanceNotesMonotheism2',
      desc: '',
      args: [],
    );
  }

  /// `Your units are protected against the effect of Monotheism.`
  String get advanceDescriptionTheology {
    return Intl.message(
      'Your units are protected against the effect of Monotheism.',
      name: 'advanceDescriptionTheology',
      desc: '',
      args: [],
    );
  }

  /// `You may choose to take up to 5 of your tokens from the board and place them anywhere else on the board, providing that no population limits are exceeded.`
  String get advanceSpecialAbilitiesDiaspora {
    return Intl.message(
      'You may choose to take up to 5 of your tokens from the board and place them anywhere else on the board, providing that no population limits are exceeded.',
      name: 'advanceSpecialAbilitiesDiaspora',
      desc: '',
      args: [],
    );
  }

  /// `Placing a token in an area containing a city is not allowed, except for your own city if you hold 'Public Works'.`
  String get advanceNotesDiaspora1 {
    return Intl.message(
      'Placing a token in an area containing a city is not allowed, except for your own city if you hold \'Public Works\'.',
      name: 'advanceNotesDiaspora1',
      desc: '',
      args: [],
    );
  }

  /// `In areas that only contain your tokens the effect of 'Agriculture' may be used.`
  String get advanceNotesDiaspora2 {
    return Intl.message(
      'In areas that only contain your tokens the effect of \'Agriculture\' may be used.',
      name: 'advanceNotesDiaspora2',
      desc: '',
      args: [],
    );
  }

  /// `Your ships are allowed to move through open sea areas.`
  String get advanceDescriptionAstronavigation {
    return Intl.message(
      'Your ships are allowed to move through open sea areas.',
      name: 'advanceDescriptionAstronavigation',
      desc: '',
      args: [],
    );
  }

  /// `Your ships may not end in an open sea area.`
  String get advanceNotesAstronavigation {
    return Intl.message(
      'Your ships may not end in an open sea area.',
      name: 'advanceNotesAstronavigation',
      desc: '',
      args: [],
    );
  }

  /// `You may choose to increase or decrease your tax rate by 1.`
  String get advanceDescriptionCoinage {
    return Intl.message(
      'You may choose to increase or decrease your tax rate by 1.',
      name: 'advanceDescriptionCoinage',
      desc: '',
      args: [],
    );
  }

  /// `You may only set a single tax rate for all of your cities.`
  String get advanceNotesCoinage1 {
    return Intl.message(
      'You may only set a single tax rate for all of your cities.',
      name: 'advanceNotesCoinage1',
      desc: '',
      args: [],
    );
  }

  /// `The tax rate effects of 'Coinage' and 'Monarchy' are cumulative.`
  String get advanceNotesCoinage2 {
    return Intl.message(
      'The tax rate effects of \'Coinage\' and \'Monarchy\' are cumulative.',
      name: 'advanceNotesCoinage2',
      desc: '',
      args: [],
    );
  }

  /// `If an increase in tax rate would result in a tax revolt, you may still choose to do so.`
  String get advanceNotesCoinage3 {
    return Intl.message(
      'If an increase in tax rate would result in a tax revolt, you may still choose to do so.',
      name: 'advanceNotesCoinage3',
      desc: '',
      args: [],
    );
  }

  /// `During the Trade cards acquisition phase, you may acquire additional trade cards from stack 2 for 5 treasury tokens and/or from stack 7 for 13 treasury tokens per card.`
  String get advanceDescriptionCartography {
    return Intl.message(
      'During the Trade cards acquisition phase, you may acquire additional trade cards from stack 2 for 5 treasury tokens and/or from stack 7 for 13 treasury tokens per card.',
      name: 'advanceDescriptionCartography',
      desc: '',
      args: [],
    );
  }

  /// `If you are a victim of Cyclone, you must first select the required number of affected cities by flipping the cities (either 1, 2 or 3). If you hold 'Trade Empire' this number is increased by 1. If you have insufficient cities directly adjacent to the affected open sea area, you select all of those cities. Calendar subsequently permits you to deselect up to 2 of your selected cities. Then you must reduce all your remaining selected cities (if any).`
  String get advanceNotesCalendar {
    return Intl.message(
      'If you are a victim of Cyclone, you must first select the required number of affected cities by flipping the cities (either 1, 2 or 3). If you hold \'Trade Empire\' this number is increased by 1. If you have insufficient cities directly adjacent to the affected open sea area, you select all of those cities. Calendar subsequently permits you to deselect up to 2 of your selected cities. Then you must reduce all your remaining selected cities (if any).',
      name: 'advanceNotesCalendar',
      desc: '',
      args: [],
    );
  }

  /// `You may discount the cost of 1 other Civilization Advance that you purchase in the same turn as Library by 40 points.`
  String get advanceDescriptionLibrary {
    return Intl.message(
      'You may discount the cost of 1 other Civilization Advance that you purchase in the same turn as Library by 40 points.',
      name: 'advanceDescriptionLibrary',
      desc: '',
      args: [],
    );
  }

  /// `Upon purchase, you may choose to acquire 1 science card with an undiscounted cost price of less than 100 for free.`
  String get advanceDescriptionAnatomy {
    return Intl.message(
      'Upon purchase, you may choose to acquire 1 science card with an undiscounted cost price of less than 100 for free.',
      name: 'advanceDescriptionAnatomy',
      desc: '',
      args: [],
    );
  }

  /// `Once per turn, when constructing a wilderness city you may choose to use up to 4 tokens from areas adjacent by land.`
  String get advanceDescriptionUrbanism {
    return Intl.message(
      'Once per turn, when constructing a wilderness city you may choose to use up to 4 tokens from areas adjacent by land.',
      name: 'advanceDescriptionUrbanism',
      desc: '',
      args: [],
    );
  }

  /// `In combination with 'Architecture' this means a wilderness city can be built in an area containing 2 tokens, using 4 tokens from adjacent areas and 6 tokens from treasury.`
  String get advanceNotesUrbanism {
    return Intl.message(
      'In combination with \'Architecture\' this means a wilderness city can be built in an area containing 2 tokens, using 4 tokens from adjacent areas and 6 tokens from treasury.',
      name: 'advanceNotesUrbanism',
      desc: '',
      args: [],
    );
  }

  /// `Urbanism`
  String get advanceNameUrbanism {
    return Intl.message(
      'Urbanism',
      name: 'advanceNameUrbanism',
      desc: '',
      args: [],
    );
  }

  /// `Mythology`
  String get advanceNameMythology {
    return Intl.message(
      'Mythology',
      name: 'advanceNameMythology',
      desc: '',
      args: [],
    );
  }

  /// `Deism`
  String get advanceNameDeism {
    return Intl.message(
      'Deism',
      name: 'advanceNameDeism',
      desc: '',
      args: [],
    );
  }

  /// `Universal Doctrine`
  String get advanceNameUniversalDoctrine {
    return Intl.message(
      'Universal Doctrine',
      name: 'advanceNameUniversalDoctrine',
      desc: '',
      args: [],
    );
  }

  /// `Enlightenment`
  String get advanceNameEnlightenment {
    return Intl.message(
      'Enlightenment',
      name: 'advanceNameEnlightenment',
      desc: '',
      args: [],
    );
  }

  /// `Diaspora`
  String get advanceNameDiaspora {
    return Intl.message(
      'Diaspora',
      name: 'advanceNameDiaspora',
      desc: '',
      args: [],
    );
  }

  /// `Empiricism`
  String get advanceNameEmpiricism {
    return Intl.message(
      'Empiricism',
      name: 'advanceNameEmpiricism',
      desc: '',
      args: [],
    );
  }

  /// `Astronavigation`
  String get advanceNameAstronavigation {
    return Intl.message(
      'Astronavigation',
      name: 'advanceNameAstronavigation',
      desc: '',
      args: [],
    );
  }

  /// `Coinage`
  String get advanceNameCoinage {
    return Intl.message(
      'Coinage',
      name: 'advanceNameCoinage',
      desc: '',
      args: [],
    );
  }

  /// `Medicine`
  String get advanceNameMedicine {
    return Intl.message(
      'Medicine',
      name: 'advanceNameMedicine',
      desc: '',
      args: [],
    );
  }

  /// `Cartography`
  String get advanceNameCartography {
    return Intl.message(
      'Cartography',
      name: 'advanceNameCartography',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get advanceNameCalendar {
    return Intl.message(
      'Calendar',
      name: 'advanceNameCalendar',
      desc: '',
      args: [],
    );
  }

  /// `Library`
  String get advanceNameLibrary {
    return Intl.message(
      'Library',
      name: 'advanceNameLibrary',
      desc: '',
      args: [],
    );
  }

  /// `Anatomy`
  String get advanceNameAnatomy {
    return Intl.message(
      'Anatomy',
      name: 'advanceNameAnatomy',
      desc: '',
      args: [],
    );
  }

  /// `Monarchy`
  String get advanceNameMonarchy {
    return Intl.message(
      'Monarchy',
      name: 'advanceNameMonarchy',
      desc: '',
      args: [],
    );
  }

  /// `You may choose to increase your tax rate by 1.`
  String get advanceDescriptionMonarchy {
    return Intl.message(
      'You may choose to increase your tax rate by 1.',
      name: 'advanceDescriptionMonarchy',
      desc: '',
      args: [],
    );
  }

  /// `You may only set a single tax rate for all of your cities.`
  String get advanceNotesMonarchy1 {
    return Intl.message(
      'You may only set a single tax rate for all of your cities.',
      name: 'advanceNotesMonarchy1',
      desc: '',
      args: [],
    );
  }

  /// `The tax rate effects of 'Monarchy' and 'Coinage' are cumulative.`
  String get advanceNotesMonarchy2 {
    return Intl.message(
      'The tax rate effects of \'Monarchy\' and \'Coinage\' are cumulative.',
      name: 'advanceNotesMonarchy2',
      desc: '',
      args: [],
    );
  }

  /// `If an increase in tax rate would result in a tax revolt, you may still choose to do so.`
  String get advanceNotesMonarchy3 {
    return Intl.message(
      'If an increase in tax rate would result in a tax revolt, you may still choose to do so.',
      name: 'advanceNotesMonarchy3',
      desc: '',
      args: [],
    );
  }

  /// `Law`
  String get advanceNameLaw {
    return Intl.message(
      'Law',
      name: 'advanceNameLaw',
      desc: '',
      args: [],
    );
  }

  /// `Naval Warfare`
  String get advanceNameNavalWarfare {
    return Intl.message(
      'Naval Warfare',
      name: 'advanceNameNavalWarfare',
      desc: '',
      args: [],
    );
  }

  /// `Your ships are allowed to carry 6 tokens. In conflicts, you may choose to remove ships from the conflict area instead of tokens. After each round of token removal a new check for token majority must be made.`
  String get advanceDescriptionNavalWarfare {
    return Intl.message(
      'Your ships are allowed to carry 6 tokens. In conflicts, you may choose to remove ships from the conflict area instead of tokens. After each round of token removal a new check for token majority must be made.',
      name: 'advanceDescriptionNavalWarfare',
      desc: '',
      args: [],
    );
  }

  /// `In conflict, while checking for token majority, your ships are not counted. Because you can remove a ship rather than a token each round, this token balance may change every round of removal. Therefore a new check for majority has to be made each round.`
  String get advanceNotesNavalWarfare1 {
    return Intl.message(
      'In conflict, while checking for token majority, your ships are not counted. Because you can remove a ship rather than a token each round, this token balance may change every round of removal. Therefore a new check for majority has to be made each round.',
      name: 'advanceNotesNavalWarfare1',
      desc: '',
      args: [],
    );
  }

  /// `Even if you hold ‘Naval Warfare’, moving your ships into an area (with or without tokens), is not considered to be causing conflict or attacking, while disembarking tokens may actually be. In an area containing only your ship and 1 or more enemy tokens or a city, your ship itself does not cause conflict.`
  String get advanceNotesNavalWarfare2 {
    return Intl.message(
      'Even if you hold ‘Naval Warfare’, moving your ships into an area (with or without tokens), is not considered to be causing conflict or attacking, while disembarking tokens may actually be. In an area containing only your ship and 1 or more enemy tokens or a city, your ship itself does not cause conflict.',
      name: 'advanceNotesNavalWarfare2',
      desc: '',
      args: [],
    );
  }

  /// `An enemy token in an area containing only your ship (none of your tokens) is not causing conflict here due to your ship.`
  String get advanceNotesNavalWarfare3 {
    return Intl.message(
      'An enemy token in an area containing only your ship (none of your tokens) is not causing conflict here due to your ship.',
      name: 'advanceNotesNavalWarfare3',
      desc: '',
      args: [],
    );
  }

  /// `When attacking a city, a ship does not count for the minimum of 7 tokens; you still require sufficient tokens. However, during conflict resolution you may remove your ships as losses if the attack is successful.`
  String get advanceNotesNavalWarfare4 {
    return Intl.message(
      'When attacking a city, a ship does not count for the minimum of 7 tokens; you still require sufficient tokens. However, during conflict resolution you may remove your ships as losses if the attack is successful.',
      name: 'advanceNotesNavalWarfare4',
      desc: '',
      args: [],
    );
  }

  /// `If your city attack is unsuccessful, all of your ships in this area are destroyed as well.`
  String get advanceNotesNavalWarfare5 {
    return Intl.message(
      'If your city attack is unsuccessful, all of your ships in this area are destroyed as well.',
      name: 'advanceNotesNavalWarfare5',
      desc: '',
      args: [],
    );
  }

  /// `If you hold both ‘Advanced Military’ and ‘Naval Warfare’, you cannot remove ships from areas adjacent to the conflict area.`
  String get advanceNotesNavalWarfare6 {
    return Intl.message(
      'If you hold both ‘Advanced Military’ and ‘Naval Warfare’, you cannot remove ships from areas adjacent to the conflict area.',
      name: 'advanceNotesNavalWarfare6',
      desc: '',
      args: [],
    );
  }

  /// `Military`
  String get advanceNameMilitary {
    return Intl.message(
      'Military',
      name: 'advanceNameMilitary',
      desc: '',
      args: [],
    );
  }

  /// `Your movement phase is after all other players not holding Military have moved. You are allowed to move tokens into areas containing cities belonging to players holding Diplomacy.`
  String get advanceDescriptionMilitary {
    return Intl.message(
      'Your movement phase is after all other players not holding Military have moved. You are allowed to move tokens into areas containing cities belonging to players holding Diplomacy.',
      name: 'advanceDescriptionMilitary',
      desc: '',
      args: [],
    );
  }

  /// `If more than 1 player holds 'Military', for these players their mutual order is again defined by their census.`
  String get advanceNotesMilitary {
    return Intl.message(
      'If more than 1 player holds \'Military\', for these players their mutual order is again defined by their census.',
      name: 'advanceNotesMilitary',
      desc: '',
      args: [],
    );
  }

  /// `Democracy`
  String get advanceNameDemocracy {
    return Intl.message(
      'Democracy',
      name: 'advanceNameDemocracy',
      desc: '',
      args: [],
    );
  }

  /// `During the Tax collection phase you collect tax as usual but your cities do not revolt as a result of a shortage in tax collection.`
  String get advanceDescriptionDemocracy {
    return Intl.message(
      'During the Tax collection phase you collect tax as usual but your cities do not revolt as a result of a shortage in tax collection.',
      name: 'advanceDescriptionDemocracy',
      desc: '',
      args: [],
    );
  }

  /// `If an increase in tax rate would result in a tax revolt, you may still choose to do so. If this would happen you can still become the beneficiary of another player’s tax revolt that turn.`
  String get advanceNotesDemocracy {
    return Intl.message(
      'If an increase in tax rate would result in a tax revolt, you may still choose to do so. If this would happen you can still become the beneficiary of another player’s tax revolt that turn.',
      name: 'advanceNotesDemocracy',
      desc: '',
      args: [],
    );
  }

  /// `Public Works`
  String get advanceNamePublicWorks {
    return Intl.message(
      'Public Works',
      name: 'advanceNamePublicWorks',
      desc: '',
      args: [],
    );
  }

  /// `Areas containing your cities may also contain 1 of your tokens.\n\nYou are protected against the effect of Provincial Empire.`
  String get advanceDescriptionPublicWorks {
    return Intl.message(
      'Areas containing your cities may also contain 1 of your tokens.\n\nYou are protected against the effect of Provincial Empire.',
      name: 'advanceDescriptionPublicWorks',
      desc: '',
      args: [],
    );
  }

  /// `Tokens in areas with a city expand as normal.`
  String get advanceNotesPublicWorks1 {
    return Intl.message(
      'Tokens in areas with a city expand as normal.',
      name: 'advanceNotesPublicWorks1',
      desc: '',
      args: [],
    );
  }

  /// `If your city is annexed or destroyed due to a tax revolt or calamity the additional token is destroyed.`
  String get advanceNotesPublicWorks2 {
    return Intl.message(
      'If your city is annexed or destroyed due to a tax revolt or calamity the additional token is destroyed.',
      name: 'advanceNotesPublicWorks2',
      desc: '',
      args: [],
    );
  }

  /// `When building a city, only if you use more than the required tokens from the map board, you may leave 1 token in the area.`
  String get advanceNotesPublicWorks3 {
    return Intl.message(
      'When building a city, only if you use more than the required tokens from the map board, you may leave 1 token in the area.',
      name: 'advanceNotesPublicWorks3',
      desc: '',
      args: [],
    );
  }

  /// `If you reduce a city containing the additional token you must immediately count the extra token as population and thus replace the city with 1 token less than normal.`
  String get advanceNotesPublicWorks4 {
    return Intl.message(
      'If you reduce a city containing the additional token you must immediately count the extra token as population and thus replace the city with 1 token less than normal.',
      name: 'advanceNotesPublicWorks4',
      desc: '',
      args: [],
    );
  }

  /// `'Agriculture' does not allow you to keep more than 1 token in an area containing your city.`
  String get advanceNotesPublicWorks5 {
    return Intl.message(
      '\'Agriculture\' does not allow you to keep more than 1 token in an area containing your city.',
      name: 'advanceNotesPublicWorks5',
      desc: '',
      args: [],
    );
  }

  /// `If a special ability mentions destroying or annexing all units in an area containing your city, the additional token must also be annexed or destroyed.`
  String get advanceNotesPublicWorks6 {
    return Intl.message(
      'If a special ability mentions destroying or annexing all units in an area containing your city, the additional token must also be annexed or destroyed.',
      name: 'advanceNotesPublicWorks6',
      desc: '',
      args: [],
    );
  }

  /// `Advanced Military`
  String get advanceNameAdvancedMilitary {
    return Intl.message(
      'Advanced Military',
      name: 'advanceNameAdvancedMilitary',
      desc: '',
      args: [],
    );
  }

  /// `In conflicts, you may choose to remove tokens from areas adjacent by land. After each round of token removal a new check for token majority must be made. You may decide to wait for other token conflicts to be resolved first.\n\nYou are allowed to cause conflict in areas containing units belonging to players holding Cultural Ascendancy.`
  String get advanceDescriptionAdvancedMilitary {
    return Intl.message(
      'In conflicts, you may choose to remove tokens from areas adjacent by land. After each round of token removal a new check for token majority must be made. You may decide to wait for other token conflicts to be resolved first.\n\nYou are allowed to cause conflict in areas containing units belonging to players holding Cultural Ascendancy.',
      name: 'advanceDescriptionAdvancedMilitary',
      desc: '',
      args: [],
    );
  }

  /// `In conflict the token balance may change after every round of removal as you can remove tokens from different areas instead of the conflict area. A new check for token majority must be made each round.`
  String get advanceNotesAdvancedMilitary1 {
    return Intl.message(
      'In conflict the token balance may change after every round of removal as you can remove tokens from different areas instead of the conflict area. A new check for token majority must be made each round.',
      name: 'advanceNotesAdvancedMilitary1',
      desc: '',
      args: [],
    );
  }

  /// `A player holding 'Advanced Military' may wait before resolving token conflicts in which he is involved, in order to choose where to remove his tokens (or ships, if he also holds ‘Naval Warfare’). If more than 1 player involved holds 'Advanced Military', the player with the lowest A.S.T.-ranking (highest Civilization #) order may wait for players with a higher order (lowest #).`
  String get advanceNotesAdvancedMilitary2 {
    return Intl.message(
      'A player holding \'Advanced Military\' may wait before resolving token conflicts in which he is involved, in order to choose where to remove his tokens (or ships, if he also holds ‘Naval Warfare’). If more than 1 player involved holds \'Advanced Military\', the player with the lowest A.S.T.-ranking (highest Civilization #) order may wait for players with a higher order (lowest #).',
      name: 'advanceNotesAdvancedMilitary2',
      desc: '',
      args: [],
    );
  }

  /// `Players are not allowed to reduce a city in order to provide themselves with more tokens in conflict.`
  String get advanceNotesAdvancedMilitary3 {
    return Intl.message(
      'Players are not allowed to reduce a city in order to provide themselves with more tokens in conflict.',
      name: 'advanceNotesAdvancedMilitary3',
      desc: '',
      args: [],
    );
  }

  /// `If you unsuccessfully attack a city, the tokens that are destroyed from the area may not be removed from an adjacent area instead.`
  String get advanceNotesAdvancedMilitary4 {
    return Intl.message(
      'If you unsuccessfully attack a city, the tokens that are destroyed from the area may not be removed from an adjacent area instead.',
      name: 'advanceNotesAdvancedMilitary4',
      desc: '',
      args: [],
    );
  }

  /// `Provincial Empire`
  String get advanceNameProvincialEmpire {
    return Intl.message(
      'Provincial Empire',
      name: 'advanceNameProvincialEmpire',
      desc: '',
      args: [],
    );
  }

  /// `You may choose to select up to 5 players that have units adjacent by land or water to your units. These players must choose and give you a commodity card with a face value of at least 2. Players holding Provincial Empire or Public Works may not be selected.`
  String get advanceSpecialAbilitiesProvincialEmpire {
    return Intl.message(
      'You may choose to select up to 5 players that have units adjacent by land or water to your units. These players must choose and give you a commodity card with a face value of at least 2. Players holding Provincial Empire or Public Works may not be selected.',
      name: 'advanceSpecialAbilitiesProvincialEmpire',
      desc: '',
      args: [],
    );
  }

  /// `The victims may choose whether they give their cards face up or down. You may choose whether you reveal them.`
  String get advanceNotesProvincialEmpire {
    return Intl.message(
      'The victims may choose whether they give their cards face up or down. You may choose whether you reveal them.',
      name: 'advanceNotesProvincialEmpire',
      desc: '',
      args: [],
    );
  }

  /// `Music`
  String get advanceNameMusic {
    return Intl.message(
      'Music',
      name: 'advanceNameMusic',
      desc: '',
      args: [],
    );
  }

  /// `Rhetoric`
  String get advanceNameRhetoric {
    return Intl.message(
      'Rhetoric',
      name: 'advanceNameRhetoric',
      desc: '',
      args: [],
    );
  }

  /// `During the Trade cards acquisition phase, you may acquire additional trade cards from stack 3 for 9 treasury tokens per card.`
  String get advanceDescriptionRhetoric {
    return Intl.message(
      'During the Trade cards acquisition phase, you may acquire additional trade cards from stack 3 for 9 treasury tokens per card.',
      name: 'advanceDescriptionRhetoric',
      desc: '',
      args: [],
    );
  }

  /// `Architecture`
  String get advanceNameArchitecture {
    return Intl.message(
      'Architecture',
      name: 'advanceNameArchitecture',
      desc: '',
      args: [],
    );
  }

  /// `Once per turn, when constructing a city, you may choose to pay up to half of the required number of tokens from treasury.`
  String get advanceDescriptionArchitecture {
    return Intl.message(
      'Once per turn, when constructing a city, you may choose to pay up to half of the required number of tokens from treasury.',
      name: 'advanceDescriptionArchitecture',
      desc: '',
      args: [],
    );
  }

  /// `You are allowed to use the ability when building a wilderness city.`
  String get advanceNotesArchitecture {
    return Intl.message(
      'You are allowed to use the ability when building a wilderness city.',
      name: 'advanceNotesArchitecture',
      desc: '',
      args: [],
    );
  }

  /// `Diplomacy`
  String get advanceNameDiplomacy {
    return Intl.message(
      'Diplomacy',
      name: 'advanceNameDiplomacy',
      desc: '',
      args: [],
    );
  }

  /// `Players are not allowed to move tokens into areas containing your cities, except for areas where a conflict situation already occurs. This does not count for players holding Diplomacy or Military.`
  String get advanceDescriptionDiplomacy {
    return Intl.message(
      'Players are not allowed to move tokens into areas containing your cities, except for areas where a conflict situation already occurs. This does not count for players holding Diplomacy or Military.',
      name: 'advanceDescriptionDiplomacy',
      desc: '',
      args: [],
    );
  }

  /// `Barbarian tokens are unaffected by 'Diplomacy'.`
  String get advanceNotesDiplomacy1 {
    return Intl.message(
      'Barbarian tokens are unaffected by \'Diplomacy\'.',
      name: 'advanceNotesDiplomacy1',
      desc: '',
      args: [],
    );
  }

  /// `Placing tokens during population expansion, annexation, Special abilities phase or moving ships into an area without disembarking tokens is not considered attacking or causing conflict.`
  String get advanceNotesDiplomacy2 {
    return Intl.message(
      'Placing tokens during population expansion, annexation, Special abilities phase or moving ships into an area without disembarking tokens is not considered attacking or causing conflict.',
      name: 'advanceNotesDiplomacy2',
      desc: '',
      args: [],
    );
  }

  /// `If a player holding ‘Military’ moves a single token into an area containing your city, this is considered 'attacking the city'. After he moved (and the token stays there), other players may move tokens into this area, even if they don’t hold 'Military', because at this point a 'conflict situation' already occurs in this area.`
  String get advanceNotesDiplomacy3 {
    return Intl.message(
      'If a player holding ‘Military’ moves a single token into an area containing your city, this is considered \'attacking the city\'. After he moved (and the token stays there), other players may move tokens into this area, even if they don’t hold \'Military\', because at this point a \'conflict situation\' already occurs in this area.',
      name: 'advanceNotesDiplomacy3',
      desc: '',
      args: [],
    );
  }

  /// `Politics`
  String get advanceNamePolitics {
    return Intl.message(
      'Politics',
      name: 'advanceNamePolitics',
      desc: '',
      args: [],
    );
  }

  /// `You may choose 1 of 2 options: 1) Gain up to 5 treasury tokens from stock. 2) Annex all units in an area adjacent by land to your units. Pay treasury tokens equal to the number of unit points annexed, or the effect is canceled. Barbarian tokens, pirate cities and units belonging to players holding Politics or Cultural Ascendancy are unaffected.`
  String get advanceSpecialAbilitiesPolitics {
    return Intl.message(
      'You may choose 1 of 2 options: 1) Gain up to 5 treasury tokens from stock. 2) Annex all units in an area adjacent by land to your units. Pay treasury tokens equal to the number of unit points annexed, or the effect is canceled. Barbarian tokens, pirate cities and units belonging to players holding Politics or Cultural Ascendancy are unaffected.',
      name: 'advanceSpecialAbilitiesPolitics',
      desc: '',
      args: [],
    );
  }

  /// `If you have insufficient units in stock or treasury to annex all units in the area to start with, you cannot select this area.`
  String get advanceNotesPolitics1 {
    return Intl.message(
      'If you have insufficient units in stock or treasury to annex all units in the area to start with, you cannot select this area.',
      name: 'advanceNotesPolitics1',
      desc: '',
      args: [],
    );
  }

  /// `If you annex an area containing a city and a token (due to 'Public Works') or more tokens than the population limit allows (due to 'Agriculture'), the extra token must also be annexed (and be paid for), even if you do not also hold any of these advances. In this case it will be destroyed during the next 'Remove surplus population' phase.`
  String get advanceNotesPolitics2 {
    return Intl.message(
      'If you annex an area containing a city and a token (due to \'Public Works\') or more tokens than the population limit allows (due to \'Agriculture\'), the extra token must also be annexed (and be paid for), even if you do not also hold any of these advances. In this case it will be destroyed during the next \'Remove surplus population\' phase.',
      name: 'advanceNotesPolitics2',
      desc: '',
      args: [],
    );
  }

  /// `The treasury tokens paid are put into your own stock. The treasury of the victim is unaffected.`
  String get advanceNotesPolitics3 {
    return Intl.message(
      'The treasury tokens paid are put into your own stock. The treasury of the victim is unaffected.',
      name: 'advanceNotesPolitics3',
      desc: '',
      args: [],
    );
  }

  /// `Players are not allowed to cause conflict in areas containing your units, except for areas where a conflict situation already occurs. This does not count for players holding Cultural Ascendancy or Advanced Military.\n\nYour units are protected against the effect of Politics.\n\nYour default city support rate is increased by 1.`
  String get advanceDescriptionCulturalAscendancy {
    return Intl.message(
      'Players are not allowed to cause conflict in areas containing your units, except for areas where a conflict situation already occurs. This does not count for players holding Cultural Ascendancy or Advanced Military.\n\nYour units are protected against the effect of Politics.\n\nYour default city support rate is increased by 1.',
      name: 'advanceDescriptionCulturalAscendancy',
      desc: '',
      args: [],
    );
  }

  /// `Cultural Ascendancy`
  String get advanceNameCulturalAscendancy {
    return Intl.message(
      'Cultural Ascendancy',
      name: 'advanceNameCulturalAscendancy',
      desc: '',
      args: [],
    );
  }

  /// `Barbarian tokens are unaffected by 'Cultural Ascendancy'.`
  String get advanceNotesCulturalAscendancy1 {
    return Intl.message(
      'Barbarian tokens are unaffected by \'Cultural Ascendancy\'.',
      name: 'advanceNotesCulturalAscendancy1',
      desc: '',
      args: [],
    );
  }

  /// `Placing tokens during population expansion, annexation, Special abilities phase or moving ships in an area without disembarking tokens is not considered attacking or causing conflict.`
  String get advanceNotesCulturalAscendancy2 {
    return Intl.message(
      'Placing tokens during population expansion, annexation, Special abilities phase or moving ships in an area without disembarking tokens is not considered attacking or causing conflict.',
      name: 'advanceNotesCulturalAscendancy2',
      desc: '',
      args: [],
    );
  }

  /// `An opponent moving a single token in an area that would result in conflict if it stays there is considered 'causing a conflict', even if in case of a city attack the attack would be unsuccessful.`
  String get advanceNotesCulturalAscendancy3 {
    return Intl.message(
      'An opponent moving a single token in an area that would result in conflict if it stays there is considered \'causing a conflict\', even if in case of a city attack the attack would be unsuccessful.',
      name: 'advanceNotesCulturalAscendancy3',
      desc: '',
      args: [],
    );
  }

  /// `Attacking a city is considered 'causing conflict', even if the attack is performed by a single token.`
  String get advanceNotesCulturalAscendancy4 {
    return Intl.message(
      'Attacking a city is considered \'causing conflict\', even if the attack is performed by a single token.',
      name: 'advanceNotesCulturalAscendancy4',
      desc: '',
      args: [],
    );
  }

  /// `If a player holding 'Advanced Military' moves a single token into an area containing your city, this is considered 'attacking the city'. After he moved (and the token stays there), other players may move tokens into this area, even if they don’t hold 'Advanced Military', because at this point a 'conflict situation' already occurs in this area.`
  String get advanceNotesCulturalAscendancy5 {
    return Intl.message(
      'If a player holding \'Advanced Military\' moves a single token into an area containing your city, this is considered \'attacking the city\'. After he moved (and the token stays there), other players may move tokens into this area, even if they don’t hold \'Advanced Military\', because at this point a \'conflict situation\' already occurs in this area.',
      name: 'advanceNotesCulturalAscendancy5',
      desc: '',
      args: [],
    );
  }

  /// `At any moment a check is made for city support (including the resolution of Slave Revolt) you must have an additional token on the map board for each of your cities. When you purchase 'Cultural Ascendancy' there is no check for city support. The first time a check is made is during the City construction phase.`
  String get advanceNotesCulturalAscendancy6 {
    return Intl.message(
      'At any moment a check is made for city support (including the resolution of Slave Revolt) you must have an additional token on the map board for each of your cities. When you purchase \'Cultural Ascendancy\' there is no check for city support. The first time a check is made is during the City construction phase.',
      name: 'advanceNotesCulturalAscendancy6',
      desc: '',
      args: [],
    );
  }

  /// `Sculpture`
  String get advanceNameSculpture {
    return Intl.message(
      'Sculpture',
      name: 'advanceNameSculpture',
      desc: '',
      args: [],
    );
  }

  /// `Drama And Poetry`
  String get advanceNameDramaAndPoetry {
    return Intl.message(
      'Drama And Poetry',
      name: 'advanceNameDramaAndPoetry',
      desc: '',
      args: [],
    );
  }

  /// `Cloth Making`
  String get advanceNameClothMaking {
    return Intl.message(
      'Cloth Making',
      name: 'advanceNameClothMaking',
      desc: '',
      args: [],
    );
  }

  /// `Your ships are allowed to move 5 steps.`
  String get advanceDescriptionClothMaking {
    return Intl.message(
      'Your ships are allowed to move 5 steps.',
      name: 'advanceDescriptionClothMaking',
      desc: '',
      args: [],
    );
  }

  /// `Masonry`
  String get advanceNameMasonry {
    return Intl.message(
      'Masonry',
      name: 'advanceNameMasonry',
      desc: '',
      args: [],
    );
  }

  /// `If you are a victim of Cyclone, you must first select the required number of affected cities by flipping the cities (either 1, 2 or 3). If you hold 'Trade Empire' this number is increased by 1. If you have insufficient cities directly adjacent to the affected open sea area, you select all of those cities. 'Masonry' subsequently permits you to deselect 1 of your selected cities. Then you must reduce all your remaining selected cities (if any).`
  String get advanceNotesMasonry {
    return Intl.message(
      'If you are a victim of Cyclone, you must first select the required number of affected cities by flipping the cities (either 1, 2 or 3). If you hold \'Trade Empire\' this number is increased by 1. If you have insufficient cities directly adjacent to the affected open sea area, you select all of those cities. \'Masonry\' subsequently permits you to deselect 1 of your selected cities. Then you must reduce all your remaining selected cities (if any).',
      name: 'advanceNotesMasonry',
      desc: '',
      args: [],
    );
  }

  /// `Pottery`
  String get advanceNamePottery {
    return Intl.message(
      'Pottery',
      name: 'advanceNamePottery',
      desc: '',
      args: [],
    );
  }

  /// `Metalworking`
  String get advanceNameMetalworking {
    return Intl.message(
      'Metalworking',
      name: 'advanceNameMetalworking',
      desc: '',
      args: [],
    );
  }

  /// `In conflicts, for each round of token removal all other players not holding Metalworking must remove their token first.`
  String get advanceDescriptionMetalworking {
    return Intl.message(
      'In conflicts, for each round of token removal all other players not holding Metalworking must remove their token first.',
      name: 'advanceDescriptionMetalworking',
      desc: '',
      args: [],
    );
  }

  /// `If more than 1 player holds 'Metalworking', their mutual order is again the normal minority/majority order.`
  String get advanceNotesMetalworking {
    return Intl.message(
      'If more than 1 player holds \'Metalworking\', their mutual order is again the normal minority/majority order.',
      name: 'advanceNotesMetalworking',
      desc: '',
      args: [],
    );
  }

  /// `Agriculture`
  String get advanceNameAgriculture {
    return Intl.message(
      'Agriculture',
      name: 'advanceNameAgriculture',
      desc: '',
      args: [],
    );
  }

  /// `The population limit of ‘0’, ‘1’ and ‘2’ areas on the board is increased by 1 for you as long as these areas do not contain any other player’s units or barbarian tokens.`
  String get advanceDescriptionAgriculture {
    return Intl.message(
      'The population limit of ‘0’, ‘1’ and ‘2’ areas on the board is increased by 1 for you as long as these areas do not contain any other player’s units or barbarian tokens.',
      name: 'advanceDescriptionAgriculture',
      desc: '',
      args: [],
    );
  }

  /// `'Agriculture' does not allow you to build a city in an area with population limit '0'.`
  String get advanceNotesAgriculture1 {
    return Intl.message(
      '\'Agriculture\' does not allow you to build a city in an area with population limit \'0\'.',
      name: 'advanceNotesAgriculture1',
      desc: '',
      args: [],
    );
  }

  /// `When reducing a city,you may immediately use the effect and thus place the additional token.`
  String get advanceNotesAgriculture2 {
    return Intl.message(
      'When reducing a city,you may immediately use the effect and thus place the additional token.',
      name: 'advanceNotesAgriculture2',
      desc: '',
      args: [],
    );
  }

  /// `In conflict, as soon as you are the only player occupying the area (and the conflict ends), you may immediately use the effect and thus keep the additional token if present`
  String get advanceNotesAgriculture3 {
    return Intl.message(
      'In conflict, as soon as you are the only player occupying the area (and the conflict ends), you may immediately use the effect and thus keep the additional token if present',
      name: 'advanceNotesAgriculture3',
      desc: '',
      args: [],
    );
  }

  /// `The effect of 'Agriculture' does not apply to areas containing cities in combination with the effect of 'Public Works'.`
  String get advanceNotesAgriculture4 {
    return Intl.message(
      'The effect of \'Agriculture\' does not apply to areas containing cities in combination with the effect of \'Public Works\'.',
      name: 'advanceNotesAgriculture4',
      desc: '',
      args: [],
    );
  }

  /// `Trade Routes`
  String get advanceNameTradeRoutes {
    return Intl.message(
      'Trade Routes',
      name: 'advanceNameTradeRoutes',
      desc: '',
      args: [],
    );
  }

  /// `You may choose to discard any number of commodity cards to gain treasury tokens at twice the face value of the commodity cards discarded this way.`
  String get advanceSpecialAbilitiesTradeRoutes {
    return Intl.message(
      'You may choose to discard any number of commodity cards to gain treasury tokens at twice the face value of the commodity cards discarded this way.',
      name: 'advanceSpecialAbilitiesTradeRoutes',
      desc: '',
      args: [],
    );
  }

  /// `You cannot gain less treasury than exactly twice the face value of a commodity card. If you have insufficient tokens in stock you cannot discard this card.`
  String get advanceNotesTradeRoutes {
    return Intl.message(
      'You cannot gain less treasury than exactly twice the face value of a commodity card. If you have insufficient tokens in stock you cannot discard this card.',
      name: 'advanceNotesTradeRoutes',
      desc: '',
      args: [],
    );
  }

  /// `Roadbuilding`
  String get advanceNameRoadbuilding {
    return Intl.message(
      'Roadbuilding',
      name: 'advanceNameRoadbuilding',
      desc: '',
      args: [],
    );
  }

  /// `When moving over land, your tokens may move 2 areas. Tokens that are in a conflict situation after 1 step are not allowed to move any further. Your hand limit of trade cards is increased by 1.`
  String get advanceDescriptionRoadbuilding {
    return Intl.message(
      'When moving over land, your tokens may move 2 areas. Tokens that are in a conflict situation after 1 step are not allowed to move any further. Your hand limit of trade cards is increased by 1.',
      name: 'advanceDescriptionRoadbuilding',
      desc: '',
      args: [],
    );
  }

  /// `For each of your tokens, if you choose to move 2 steps, you must do so in one go and then flip the token. This second step may not be made before or after embarking a ship. If a token is in a 'conflict situation' after the first of 2 steps, you may not move this token a second step.This second step may end in a 'conflict situation'.`
  String get advanceNotesRoadbuilding1 {
    return Intl.message(
      'For each of your tokens, if you choose to move 2 steps, you must do so in one go and then flip the token. This second step may not be made before or after embarking a ship. If a token is in a \'conflict situation\' after the first of 2 steps, you may not move this token a second step.This second step may end in a \'conflict situation\'.',
      name: 'advanceNotesRoadbuilding1',
      desc: '',
      args: [],
    );
  }

  /// `Attacking a city is considered 'causing conflict' or being in a 'conflict situation', even if the attack is performed by a single token.`
  String get advanceNotesRoadbuilding2 {
    return Intl.message(
      'Attacking a city is considered \'causing conflict\' or being in a \'conflict situation\', even if the attack is performed by a single token.',
      name: 'advanceNotesRoadbuilding2',
      desc: '',
      args: [],
    );
  }

  /// `Mining`
  String get advanceNameMining {
    return Intl.message(
      'Mining',
      name: 'advanceNameMining',
      desc: '',
      args: [],
    );
  }

  /// `During the Trade cards acquisition phase, you may acquire additional trade cards from stack 6 and/or stack 8 for 13 treasury tokens per card.\n\nTreasury tokens are worth 2 points when purchasing Civilization Advances.`
  String get advanceDescriptionMining {
    return Intl.message(
      'During the Trade cards acquisition phase, you may acquire additional trade cards from stack 6 and/or stack 8 for 13 treasury tokens per card.\n\nTreasury tokens are worth 2 points when purchasing Civilization Advances.',
      name: 'advanceDescriptionMining',
      desc: '',
      args: [],
    );
  }

  /// `When using treasury tokens to purchase Civilization Advances you may exceed the purchase price by exactly 1 this way.`
  String get advanceNotesMining {
    return Intl.message(
      'When using treasury tokens to purchase Civilization Advances you may exceed the purchase price by exactly 1 this way.',
      name: 'advanceNotesMining',
      desc: '',
      args: [],
    );
  }

  /// `Trade Empire`
  String get advanceNameTradeEmpire {
    return Intl.message(
      'Trade Empire',
      name: 'advanceNameTradeEmpire',
      desc: '',
      args: [],
    );
  }

  /// `Once per turn, you may choose to use 1 substitute commodity card of at least the same face value when turning in an incomplete set of commodity cards.`
  String get advanceDescriptionTradeEmpire {
    return Intl.message(
      'Once per turn, you may choose to use 1 substitute commodity card of at least the same face value when turning in an incomplete set of commodity cards.',
      name: 'advanceDescriptionTradeEmpire',
      desc: '',
      args: [],
    );
  }

  /// `Mysticism`
  String get advanceNameMysticism {
    return Intl.message(
      'Mysticism',
      name: 'advanceNameMysticism',
      desc: '',
      args: [],
    );
  }

  /// `Written Record`
  String get advanceNameWrittenRecord {
    return Intl.message(
      'Written Record',
      name: 'advanceNameWrittenRecord',
      desc: '',
      args: [],
    );
  }

  /// `Acquire 10 additional points of credit tokens in any combination of colors.`
  String get advanceDescriptionWrittenRecord {
    return Intl.message(
      'Acquire 10 additional points of credit tokens in any combination of colors.',
      name: 'advanceDescriptionWrittenRecord',
      desc: '',
      args: [],
    );
  }

  /// `You gain and choose the color(s) of the additional credit tokens at the time 'Written Record' is purchased. Your decision cannot be changed at a later stage.`
  String get advanceNotesWrittenRecord {
    return Intl.message(
      'You gain and choose the color(s) of the additional credit tokens at the time \'Written Record\' is purchased. Your decision cannot be changed at a later stage.',
      name: 'advanceNotesWrittenRecord',
      desc: '',
      args: [],
    );
  }

  /// `Theocracy`
  String get advanceNameTheocracy {
    return Intl.message(
      'Theocracy',
      name: 'advanceNameTheocracy',
      desc: '',
      args: [],
    );
  }

  /// `Using this ability prevents your cities from being reduced, but does not cancel the secondary effects of Iconoclasm and Heresy if you are the primary victim.`
  String get advanceNotesTheocracy1 {
    return Intl.message(
      'Using this ability prevents your cities from being reduced, but does not cancel the secondary effects of Iconoclasm and Heresy if you are the primary victim.',
      name: 'advanceNotesTheocracy1',
      desc: '',
      args: [],
    );
  }

  /// `Water commodity cards may be used.`
  String get advanceNotesTheocracy2 {
    return Intl.message(
      'Water commodity cards may be used.',
      name: 'advanceNotesTheocracy2',
      desc: '',
      args: [],
    );
  }

  /// `Engineering`
  String get advanceNameEngineering {
    return Intl.message(
      'Engineering',
      name: 'advanceNameEngineering',
      desc: '',
      args: [],
    );
  }

  /// `Other players or barbarians require 8 tokens to successfully attack your cities. Your cities are then replaced with 7 tokens. This does not apply when the attacking player also holds Engineering.\n\nYou require 6 tokens to successfully attack other player’s cities or pirate cities. Their cities are then replaced with 5 tokens. This does not apply when the defending player also holds Engineering.`
  String get advanceDescriptionEngineering {
    return Intl.message(
      'Other players or barbarians require 8 tokens to successfully attack your cities. Your cities are then replaced with 7 tokens. This does not apply when the attacking player also holds Engineering.\n\nYou require 6 tokens to successfully attack other player’s cities or pirate cities. Their cities are then replaced with 5 tokens. This does not apply when the defending player also holds Engineering.',
      name: 'advanceDescriptionEngineering',
      desc: '',
      args: [],
    );
  }

  /// `Monument`
  String get advanceNameMonument {
    return Intl.message(
      'Monument',
      name: 'advanceNameMonument',
      desc: '',
      args: [],
    );
  }

  /// `Acquire 20 additional points of credit tokens in any combination of colors.`
  String get advanceDescriptionMonument {
    return Intl.message(
      'Acquire 20 additional points of credit tokens in any combination of colors.',
      name: 'advanceDescriptionMonument',
      desc: '',
      args: [],
    );
  }

  /// `You gain and choose the color(s) of the additional credit tokens at the time 'Monument' is purchased. Your decision cannot be changed at a later stage.`
  String get advanceNotesMonument {
    return Intl.message(
      'You gain and choose the color(s) of the additional credit tokens at the time \'Monument\' is purchased. Your decision cannot be changed at a later stage.',
      name: 'advanceNotesMonument',
      desc: '',
      args: [],
    );
  }

  /// `Philosophy`
  String get advanceNamePhilosophy {
    return Intl.message(
      'Philosophy',
      name: 'advanceNamePhilosophy',
      desc: '',
      args: [],
    );
  }

  /// `Your units are protected against the effect of Fundamentalism.`
  String get advanceDescriptionPhilosophy {
    return Intl.message(
      'Your units are protected against the effect of Fundamentalism.',
      name: 'advanceDescriptionPhilosophy',
      desc: '',
      args: [],
    );
  }

  /// `Mathematics`
  String get advanceNameMathematics {
    return Intl.message(
      'Mathematics',
      name: 'advanceNameMathematics',
      desc: '',
      args: [],
    );
  }

  /// `Wonder Of The World`
  String get advanceNameWonderOfTheWorld {
    return Intl.message(
      'Wonder Of The World',
      name: 'advanceNameWonderOfTheWorld',
      desc: '',
      args: [],
    );
  }

  /// `During the Trade cards acquisition phase, you may acquire 1 additional trade card for free from a stack number that is higher than your number of cities in play. Wonder of the World counts as a city during the A.S.T.-alteration phase.`
  String get advanceDescriptionWonderOfTheWorld {
    return Intl.message(
      'During the Trade cards acquisition phase, you may acquire 1 additional trade card for free from a stack number that is higher than your number of cities in play. Wonder of the World counts as a city during the A.S.T.-alteration phase.',
      name: 'advanceDescriptionWonderOfTheWorld',
      desc: '',
      args: [],
    );
  }

  /// `Acquiring this additional card is considered purchasing for 0 treasury tokens during additional purchases.`
  String get advanceNotesWonderOfTheWorld1 {
    return Intl.message(
      'Acquiring this additional card is considered purchasing for 0 treasury tokens during additional purchases.',
      name: 'advanceNotesWonderOfTheWorld1',
      desc: '',
      args: [],
    );
  }

  /// `Players cannot acquire the additional card while having 9 cities in play.`
  String get advanceNotesWonderOfTheWorld2 {
    return Intl.message(
      'Players cannot acquire the additional card while having 9 cities in play.',
      name: 'advanceNotesWonderOfTheWorld2',
      desc: '',
      args: [],
    );
  }

  /// `Tempest`
  String get calamityNameTempest {
    return Intl.message(
      'Tempest',
      name: 'calamityNameTempest',
      desc: '',
      args: [],
    );
  }

  /// `Take 2 damage in total from coastal areas of your choice and lose 5 treasury tokens.`
  String get calamityDescriptionTempest {
    return Intl.message(
      'Take 2 damage in total from coastal areas of your choice and lose 5 treasury tokens.',
      name: 'calamityDescriptionTempest',
      desc: '',
      args: [],
    );
  }

  /// `Volcanic Eruption/Earthquake`
  String get calamityNameVolcanicEruptionEarthquake {
    return Intl.message(
      'Volcanic Eruption/Earthquake',
      name: 'calamityNameVolcanicEruptionEarthquake',
      desc: '',
      args: [],
    );
  }

  /// `reduce`
  String get reduceCity {
    return Intl.message(
      'reduce',
      name: 'reduceCity',
      desc: '',
      args: [],
    );
  }

  /// `destroy`
  String get destroyCity {
    return Intl.message(
      'destroy',
      name: 'destroyCity',
      desc: '',
      args: [],
    );
  }

  /// `If you have a city in an area with a volcano: destroy all units (irrespective of ownership) in the area(s) touched by the volcano. If you have cities in more than 1 area with a volcano, select 1 volcano that would affect the most of your unit points.\n\nOtherwise: select and {cityAction} 1 of your cities and select and reduce 1 city adjacent by land or water (irrespective of ownership)`
  String calamityDescriptionVolcanicEruptionEarthquake(String cityAction) {
    return Intl.message(
      'If you have a city in an area with a volcano: destroy all units (irrespective of ownership) in the area(s) touched by the volcano. If you have cities in more than 1 area with a volcano, select 1 volcano that would affect the most of your unit points.\n\nOtherwise: select and $cityAction 1 of your cities and select and reduce 1 city adjacent by land or water (irrespective of ownership)',
      name: 'calamityDescriptionVolcanicEruptionEarthquake',
      desc: 'The description for the Volcanic Eruption/Earthquake calamity',
      args: [cityAction],
    );
  }

  /// `Treachery`
  String get calamityNameTreachery {
    return Intl.message(
      'Treachery',
      name: 'calamityNameTreachery',
      desc: '',
      args: [],
    );
  }

  /// `The beneficiary selects and annexes {cities} of your cities.`
  String calamityDescriptionTreachery(int cities) {
    return Intl.message(
      'The beneficiary selects and annexes $cities of your cities.',
      name: 'calamityDescriptionTreachery',
      desc: 'The description for the Treachery calamity',
      args: [cities],
    );
  }

  /// `Squandered Wealth`
  String get calamityNameSquanderedWealth {
    return Intl.message(
      'Squandered Wealth',
      name: 'calamityNameSquanderedWealth',
      desc: '',
      args: [],
    );
  }

  /// `Lose 10 treasury tokens.`
  String get calamityDescriptionSquanderedWealth {
    return Intl.message(
      'Lose 10 treasury tokens.',
      name: 'calamityDescriptionSquanderedWealth',
      desc: '',
      args: [],
    );
  }

  /// `Famine`
  String get calamityNameFamine {
    return Intl.message(
      'Famine',
      name: 'calamityNameFamine',
      desc: '',
      args: [],
    );
  }

  /// `another player`
  String get calamityDescriptionFamineAnotherPlayer {
    return Intl.message(
      'another player',
      name: 'calamityDescriptionFamineAnotherPlayer',
      desc: '',
      args: [],
    );
  }

  /// `each of 3 players`
  String get calamityDescriptionFamineEachOf3Players {
    return Intl.message(
      'each of 3 players',
      name: 'calamityDescriptionFamineEachOf3Players',
      desc: '',
      args: [],
    );
  }

  /// `Primary victim: Take {primaryDamage} damage and assign 5 damage to {player} of your choice\n\nSecondary victim: Take {secondaryDamage} damage.`
  String calamityDescriptionFamine(
      int primaryDamage, int secondaryDamage, String player) {
    return Intl.message(
      'Primary victim: Take $primaryDamage damage and assign 5 damage to $player of your choice\n\nSecondary victim: Take $secondaryDamage damage.',
      name: 'calamityDescriptionFamine',
      desc: 'The description for the Famine calamity',
      args: [primaryDamage, secondaryDamage, player],
    );
  }

  /// `Your city support rate is {supportRate} during the resolution of Slave Revolt. Perform a check for city support and reduce cities until you have sufficient support.`
  String calamityDescriptionSlaveRevolt(int supportRate) {
    return Intl.message(
      'Your city support rate is $supportRate during the resolution of Slave Revolt. Perform a check for city support and reduce cities until you have sufficient support.',
      name: 'calamityDescriptionSlaveRevolt',
      desc: 'The description for the Slave Revolt calamity',
      args: [supportRate],
    );
  }

  /// `City Riots`
  String get calamityNameCityRiots {
    return Intl.message(
      'City Riots',
      name: 'calamityNameCityRiots',
      desc: '',
      args: [],
    );
  }

  /// `Reduce 1 of your cities and lose 5 treasury tokens.`
  String get calamityDescriptionCityRiots {
    return Intl.message(
      'Reduce 1 of your cities and lose 5 treasury tokens.',
      name: 'calamityDescriptionCityRiots',
      desc: '',
      args: [],
    );
  }

  /// `Flood`
  String get calamityNameFlood {
    return Intl.message(
      'Flood',
      name: 'calamityNameFlood',
      desc: '',
      args: [],
    );
  }

  /// `Flood/Avalanche`
  String get calamityNameFloodAvalanche {
    return Intl.message(
      'Flood/Avalanche',
      name: 'calamityNameFloodAvalanche',
      desc: '',
      args: [],
    );
  }

  /// `coastal areas or areas in or adjacent to Western Himalaya`
  String get calamityDescriptionFloodAvalancheTarget {
    return Intl.message(
      'coastal areas or areas in or adjacent to Western Himalaya',
      name: 'calamityDescriptionFloodAvalancheTarget',
      desc: '',
      args: [],
    );
  }

  /// `coastal areas of your choice`
  String get calamityDescriptionFloodTarget {
    return Intl.message(
      'coastal areas of your choice',
      name: 'calamityDescriptionFloodTarget',
      desc: '',
      args: [],
    );
  }

  /// `Primary victim: If you have any units on a flood plain: take {primaryDamage} damage on the flood plain. Select the flood plain where most of your units would be affected. All other players on the flood plain take 5 damage on that flood plain.\nIf you have no units on a flood plain, take 5 damage in total from {target} instead.\n\nSecondary victim: Take {secondaryDamage} damage on the flood plain.`
  String calamityDescriptionFlood(
      int primaryDamage, int secondaryDamage, String target) {
    return Intl.message(
      'Primary victim: If you have any units on a flood plain: take $primaryDamage damage on the flood plain. Select the flood plain where most of your units would be affected. All other players on the flood plain take 5 damage on that flood plain.\nIf you have no units on a flood plain, take 5 damage in total from $target instead.\n\nSecondary victim: Take $secondaryDamage damage on the flood plain.',
      name: 'calamityDescriptionFlood',
      desc: 'The description for the Flood calamity',
      args: [primaryDamage, secondaryDamage, target],
    );
  }

  /// `Reduce {cities} of your cities.`
  String calamityDescriptionSuperstition(int cities) {
    return Intl.message(
      'Reduce $cities of your cities.',
      name: 'calamityDescriptionSuperstition',
      desc: 'The description for the Superstition calamity',
      args: [cities],
    );
  }

  /// `City In Flames`
  String get calamityNameCityInFlames {
    return Intl.message(
      'City In Flames',
      name: 'calamityNameCityInFlames',
      desc: '',
      args: [],
    );
  }

  /// `Destroy 1 of your cities. You may choose to pay 10 treasury tokens to prevent this.`
  String get calamityDescriptionCityInFlames {
    return Intl.message(
      'Destroy 1 of your cities. You may choose to pay 10 treasury tokens to prevent this.',
      name: 'calamityDescriptionCityInFlames',
      desc: '',
      args: [],
    );
  }

  /// `Civil War`
  String get calamityNameCivilWar {
    return Intl.message(
      'Civil War',
      name: 'calamityNameCivilWar',
      desc: '',
      args: [],
    );
  }

  /// `Select all but {allBut} of your unit points. The beneficiary anexes all selected units.`
  String calamityDescriptionCivilWar(int allBut) {
    return Intl.message(
      'Select all but $allBut of your unit points. The beneficiary anexes all selected units.',
      name: 'calamityDescriptionCivilWar',
      desc: 'The description for the Civil War calamity',
      args: [allBut],
    );
  }

  /// `Barbarian Hordes`
  String get calamityNameBarbarianHordes {
    return Intl.message(
      'Barbarian Hordes',
      name: 'calamityNameBarbarianHordes',
      desc: '',
      args: [],
    );
  }

  /// `The beneficiary selects 1 of your cities (if possible a wilderness city), which is attacked by {barbarianTokens} barbarian tokens.`
  String calamityDescriptionBarbarianHordes(int barbarianTokens) {
    return Intl.message(
      'The beneficiary selects 1 of your cities (if possible a wilderness city), which is attacked by $barbarianTokens barbarian tokens.',
      name: 'calamityDescriptionBarbarianHordes',
      desc: 'The description for the Barbarian Hordes calamity',
      args: [barbarianTokens],
    );
  }

  /// `Tribal Conflict`
  String get calamityNameTribalConflict {
    return Intl.message(
      'Tribal Conflict',
      name: 'calamityNameTribalConflict',
      desc: '',
      args: [],
    );
  }

  /// `Take 5 damage.`
  String get calamityDescriptionTribalConflict {
    return Intl.message(
      'Take 5 damage.',
      name: 'calamityDescriptionTribalConflict',
      desc: '',
      args: [],
    );
  }

  /// `Cyclone/Blizzard`
  String get calamityNameCycloneBlizzard {
    return Intl.message(
      'Cyclone/Blizzard',
      name: 'calamityNameCycloneBlizzard',
      desc: '',
      args: [],
    );
  }

  /// `Cyclone`
  String get calamityNameCyclone {
    return Intl.message(
      'Cyclone',
      name: 'calamityNameCyclone',
      desc: '',
      args: [],
    );
  }

  /// `the open sea area`
  String get calamityDescriptionCyclonePotentialAreas {
    return Intl.message(
      'the open sea area',
      name: 'calamityDescriptionCyclonePotentialAreas',
      desc: '',
      args: [],
    );
  }

  /// `the open sea area or Western Himalaya`
  String get calamityDescriptionCycloneBlizzardPotentialAreas {
    return Intl.message(
      'the open sea area or Western Himalaya',
      name: 'calamityDescriptionCycloneBlizzardPotentialAreas',
      desc: '',
      args: [],
    );
  }

  /// `Primary: Select {potentialAreas} that has the largest number of your cities in areas directly adjacent to it. Select and reduce {citiesToSelect} of these cities.\n\nSecondary: Select and reduce {secondaryCitiesToSelect} cities adjacent to the selected area.`
  String calamityDescriptionCyclone(
      String potentialAreas, int citiesToSelect, int secondaryCitiesToSelect) {
    return Intl.message(
      'Primary: Select $potentialAreas that has the largest number of your cities in areas directly adjacent to it. Select and reduce $citiesToSelect of these cities.\n\nSecondary: Select and reduce $secondaryCitiesToSelect cities adjacent to the selected area.',
      name: 'calamityDescriptionCyclone',
      desc: 'The description for the Cyclone calamity',
      args: [potentialAreas, citiesToSelect, secondaryCitiesToSelect],
    );
  }

  /// `\n\nAny population tokens on Western Himalaya are unaffected by Cyclone/Blizzard.`
  String get calamityDescriptionCycloneBlizzard {
    return Intl.message(
      '\n\nAny population tokens on Western Himalaya are unaffected by Cyclone/Blizzard.',
      name: 'calamityDescriptionCycloneBlizzard',
      desc: '',
      args: [],
    );
  }

  /// `Epidemic`
  String get calamityNameEpidemic {
    return Intl.message(
      'Epidemic',
      name: 'calamityNameEpidemic',
      desc: '',
      args: [],
    );
  }

  /// `1 other player`
  String get calamityDescriptionEpidemicSecondaryVictims1 {
    return Intl.message(
      '1 other player',
      name: 'calamityDescriptionEpidemicSecondaryVictims1',
      desc: '',
      args: [],
    );
  }

  /// `2 other players`
  String get calamityDescriptionEpidemicSecondaryVictims2 {
    return Intl.message(
      '2 other players',
      name: 'calamityDescriptionEpidemicSecondaryVictims2',
      desc: '',
      args: [],
    );
  }

  /// `Primary: Take {primaryDamage} damage and select {secondaryVictims} that must take 10 damage as well\n\nSecondary: Take {secondaryDamage} damage`
  String calamityDescriptionEpidemic(
      int primaryDamage, String secondaryVictims, int secondaryDamage) {
    return Intl.message(
      'Primary: Take $primaryDamage damage and select $secondaryVictims that must take 10 damage as well\n\nSecondary: Take $secondaryDamage damage',
      name: 'calamityDescriptionEpidemic',
      desc: 'The description for the Epidemic calamity',
      args: [primaryDamage, secondaryVictims, secondaryDamage],
    );
  }

  /// `Minor Uprising`
  String get calamityNameMinorUprising {
    return Intl.message(
      'Minor Uprising',
      name: 'calamityNameMinorUprising',
      desc: '',
      args: [],
    );
  }

  /// `Destroy 1 of your cities.`
  String get calamityDescriptionMinorUprising {
    return Intl.message(
      'Destroy 1 of your cities.',
      name: 'calamityDescriptionMinorUprising',
      desc: '',
      args: [],
    );
  }

  /// `Tyranny`
  String get calamityNameTyranny {
    return Intl.message(
      'Tyranny',
      name: 'calamityNameTyranny',
      desc: '',
      args: [],
    );
  }

  /// `The beneficiary selects and annexes {unitPoints} of your unit points`
  String calamityDescriptionTyranny(int unitPoints) {
    return Intl.message(
      'The beneficiary selects and annexes $unitPoints of your unit points',
      name: 'calamityDescriptionTyranny',
      desc: 'The description for the Tyranny calamity',
      args: [unitPoints],
    );
  }

  /// `Civil Disorder`
  String get calamityNameCivilDisorder {
    return Intl.message(
      'Civil Disorder',
      name: 'calamityNameCivilDisorder',
      desc: '',
      args: [],
    );
  }

  /// `Reduce all but {citiesExemptFromReduction} of your cities`
  String calamityDescriptionCivilDisorder(int citiesExemptFromReduction) {
    return Intl.message(
      'Reduce all but $citiesExemptFromReduction of your cities',
      name: 'calamityDescriptionCivilDisorder',
      desc: 'The description for the Civil Disorder calamity',
      args: [citiesExemptFromReduction],
    );
  }

  /// `Banditry`
  String get calamityNameBanditry {
    return Intl.message(
      'Banditry',
      name: 'calamityNameBanditry',
      desc: '',
      args: [],
    );
  }

  /// `Discard 2 commodity cards of your choice. For each card you must discard, you may choose to pay 4 treasury tokens to prevent it.`
  String get calamityDescriptionBanditry {
    return Intl.message(
      'Discard 2 commodity cards of your choice. For each card you must discard, you may choose to pay 4 treasury tokens to prevent it.',
      name: 'calamityDescriptionBanditry',
      desc: '',
      args: [],
    );
  }

  /// `Corruption`
  String get calamityNameCorruption {
    return Intl.message(
      'Corruption',
      name: 'calamityNameCorruption',
      desc: '',
      args: [],
    );
  }

  /// `Discard commodity cards with a total face value (not set value) of at least {targetValue} points`
  String calamityDescriptionCorruption(int targetValue) {
    return Intl.message(
      'Discard commodity cards with a total face value (not set value) of at least $targetValue points',
      name: 'calamityDescriptionCorruption',
      desc: 'The description for the Corruption calamity',
      args: [targetValue],
    );
  }

  /// `Iconoclasm And Heresy`
  String get calamityNameIconoclasmAndHeresy {
    return Intl.message(
      'Iconoclasm And Heresy',
      name: 'calamityNameIconoclasmAndHeresy',
      desc: '',
      args: [],
    );
  }

  /// `1 other player`
  String get calamityDescriptionIconoclasmAndHeresySecondaryVictims1 {
    return Intl.message(
      '1 other player',
      name: 'calamityDescriptionIconoclasmAndHeresySecondaryVictims1',
      desc: '',
      args: [],
    );
  }

  /// `2 other players`
  String get calamityDescriptionIconoclasmAndHeresySecondaryVictims2 {
    return Intl.message(
      '2 other players',
      name: 'calamityDescriptionIconoclasmAndHeresySecondaryVictims2',
      desc: '',
      args: [],
    );
  }

  /// `Primary: Reduce {primaryCitiesToReduce} of your cities and select {secondaryVictims} to reduce 1 of their cities as well. The beneficiary may not be selected as a secondary victim.`
  String calamityDescriptionIconoclasmAndHeresy(
      int primaryCitiesToReduce, String secondaryVictims) {
    return Intl.message(
      'Primary: Reduce $primaryCitiesToReduce of your cities and select $secondaryVictims to reduce 1 of their cities as well. The beneficiary may not be selected as a secondary victim.',
      name: 'calamityDescriptionIconoclasmAndHeresy',
      desc: 'The description for the Iconoclasm And Heresy calamity',
      args: [primaryCitiesToReduce, secondaryVictims],
    );
  }

  /// `You may choose to discard 2 commodity cards to prevent the city reduction effect for you.`
  String get calamityDescriptionIconoclasmAndHeresyTheocracy {
    return Intl.message(
      'You may choose to discard 2 commodity cards to prevent the city reduction effect for you.',
      name: 'calamityDescriptionIconoclasmAndHeresyTheocracy',
      desc: '',
      args: [],
    );
  }

  /// `Secondary: Reduce {secondaryCitiesToReduce} of your cities`
  String calamityDescriptionIconoclasmAndHeresySecondary(
      int secondaryCitiesToReduce) {
    return Intl.message(
      'Secondary: Reduce $secondaryCitiesToReduce of your cities',
      name: 'calamityDescriptionIconoclasmAndHeresySecondary',
      desc: 'The description for the Iconoclasm And Heresy calamity',
      args: [secondaryCitiesToReduce],
    );
  }

  /// `Coastal Migration`
  String get calamityNameCoastalMigration {
    return Intl.message(
      'Coastal Migration',
      name: 'calamityNameCoastalMigration',
      desc: '',
      args: [],
    );
  }

  /// `Destroy 1 of your coastal cities and lose 5 treasury tokens`
  String get calamityDescriptionCoastalMigration {
    return Intl.message(
      'Destroy 1 of your coastal cities and lose 5 treasury tokens',
      name: 'calamityDescriptionCoastalMigration',
      desc: '',
      args: [],
    );
  }

  /// `Your succession marker on the A.S.T. is moved {stepsToRegress} steps backward`
  String calamityDescriptionRegression(int stepsToRegress) {
    return Intl.message(
      'Your succession marker on the A.S.T. is moved $stepsToRegress steps backward',
      name: 'calamityDescriptionRegression',
      desc: 'The description for the Regression calamity',
      args: [stepsToRegress],
    );
  }

  /// `. For each step backward, you may choose to prevent the effect by destroying 2 of your cities (if possible non-coastal)`
  String get calamityDescriptionRegressionEnlightenment {
    return Intl.message(
      '. For each step backward, you may choose to prevent the effect by destroying 2 of your cities (if possible non-coastal)',
      name: 'calamityDescriptionRegressionEnlightenment',
      desc: '',
      args: [],
    );
  }

  /// `Piracy/Raid`
  String get calamityNamePiracyRaid {
    return Intl.message(
      'Piracy/Raid',
      name: 'calamityNamePiracyRaid',
      desc: '',
      args: [],
    );
  }

  /// `Piracy`
  String get calamityNamePiracy {
    return Intl.message(
      'Piracy',
      name: 'calamityNamePiracy',
      desc: '',
      args: [],
    );
  }

  /// `coastal areas`
  String get calamityDescriptionPiracyTarget {
    return Intl.message(
      'coastal areas',
      name: 'calamityDescriptionPiracyTarget',
      desc: '',
      args: [],
    );
  }

  /// `coastal areas or areas adjacent to Western Himalaya`
  String get calamityDescriptionPiracyRaidTarget {
    return Intl.message(
      'coastal areas or areas adjacent to Western Himalaya',
      name: 'calamityDescriptionPiracyRaidTarget',
      desc: '',
      args: [],
    );
  }

  /// `another player`
  String get calamityDescriptionPiracySecondaryVictims1 {
    return Intl.message(
      'another player',
      name: 'calamityDescriptionPiracySecondaryVictims1',
      desc: '',
      args: [],
    );
  }

  /// `each of 2 other players`
  String get calamityDescriptionPiracySecondaryVictims2 {
    return Intl.message(
      'each of 2 other players',
      name: 'calamityDescriptionPiracySecondaryVictims2',
      desc: '',
      args: [],
    );
  }

  /// `The beneficiary selects {coastalCities} of your cities in {target} and you select 1 city in {target} from {secondaryVictims}. All selected cities are replaced with pirate cities. The beneficiary may not be selected as a secondary victim.`
  String calamityDescriptionPiracy(
      int coastalCities, String target, String secondaryVictims) {
    return Intl.message(
      'The beneficiary selects $coastalCities of your cities in $target and you select 1 city in $target from $secondaryVictims. All selected cities are replaced with pirate cities. The beneficiary may not be selected as a secondary victim.',
      name: 'calamityDescriptionPiracy',
      desc: 'The description for the Piracy calamity',
      args: [coastalCities, target, secondaryVictims],
    );
  }

  /// `. You may not be selected as a secondary victim`
  String get calamityDescriptionPiracyNavalWarfare {
    return Intl.message(
      '. You may not be selected as a secondary victim',
      name: 'calamityDescriptionPiracyNavalWarfare',
      desc: '',
      args: [],
    );
  }

  /// `Calamities`
  String get calamities {
    return Intl.message(
      'Calamities',
      name: 'calamities',
      desc: '',
      args: [],
    );
  }

  /// `Primary victim: {effect}`
  String calamityEffectPrimaryVictim(String effect) {
    return Intl.message(
      'Primary victim: $effect',
      name: 'calamityEffectPrimaryVictim',
      desc:
          'The description calamity effects that affect the primary victim only',
      args: [effect],
    );
  }

  /// `Secondary victim: {effect}`
  String calamityEffectSecondaryVictim(String effect) {
    return Intl.message(
      'Secondary victim: $effect',
      name: 'calamityEffectSecondaryVictim',
      desc:
          'The description calamity effects that affect the secondary victim only',
      args: [effect],
    );
  }

  /// `take {additionalDamage} additional damage`
  String calamityEffectTakeAdditionalDamage(int additionalDamage) {
    return Intl.message(
      'take $additionalDamage additional damage',
      name: 'calamityEffectTakeAdditionalDamage',
      desc:
          'The description calamity effects that have the player take additional damage',
      args: [additionalDamage],
    );
  }

  /// `prevent {damage} damage`
  String calamityEffectPreventDamage(int damage) {
    return Intl.message(
      'prevent $damage damage',
      name: 'calamityEffectPreventDamage',
      desc: 'The description calamity effects that have victim prevent damage',
      args: [damage],
    );
  }

  /// `select {unitPoints} less unit points`
  String calamityEffectSelectLessUnitPoints(int unitPoints) {
    return Intl.message(
      'select $unitPoints less unit points',
      name: 'calamityEffectSelectLessUnitPoints',
      desc:
          'The description calamity effects that have victim select less unit points',
      args: [unitPoints],
    );
  }

  /// `select {unitPoints} additional unit points`
  String calamityEffectSelectAdditionalUnitPoints(int unitPoints) {
    return Intl.message(
      'select $unitPoints additional unit points',
      name: 'calamityEffectSelectAdditionalUnitPoints',
      desc:
          'The description calamity effects that have victim select additional unit points',
      args: [unitPoints],
    );
  }

  /// `Reduce 1 less city`
  String get calamityEffectReduce1LessCity {
    return Intl.message(
      'Reduce 1 less city',
      name: 'calamityEffectReduce1LessCity',
      desc: '',
      args: [],
    );
  }

  /// `Reduce {cities} less cities`
  String calamityEffectReduceLessCities(int cities) {
    return Intl.message(
      'Reduce $cities less cities',
      name: 'calamityEffectReduceLessCities',
      desc:
          'The description calamity effects that involves reducing less cities',
      args: [cities],
    );
  }

  /// `Reduce 1 additional city`
  String get calamityEffectReduce1AdditionalCity {
    return Intl.message(
      'Reduce 1 additional city',
      name: 'calamityEffectReduce1AdditionalCity',
      desc: '',
      args: [],
    );
  }

  /// `Select 1 additional city`
  String get calamityEffectSelect1AdditionalCity {
    return Intl.message(
      'Select 1 additional city',
      name: 'calamityEffectSelect1AdditionalCity',
      desc: '',
      args: [],
    );
  }

  /// `Deselect 1 selected city`
  String get calamityEffectDeselect1SelectedCity {
    return Intl.message(
      'Deselect 1 selected city',
      name: 'calamityEffectDeselect1SelectedCity',
      desc: '',
      args: [],
    );
  }

  /// `Deselect {cities} selected cities`
  String calamityEffectDeselectSelectedCities(int cities) {
    return Intl.message(
      'Deselect $cities selected cities',
      name: 'calamityEffectDeselectSelectedCities',
      desc:
          'The description calamity effects that involves deselecting selected cities',
      args: [cities],
    );
  }

  /// `Your city support rate is decreased by {supportRate} during the resolution of Slave Revolt`
  String yourCitySupportRateIsDecreasedDuringTheResolutionOfSlaveRevolt(
      int supportRate) {
    return Intl.message(
      'Your city support rate is decreased by $supportRate during the resolution of Slave Revolt',
      name: 'yourCitySupportRateIsDecreasedDuringTheResolutionOfSlaveRevolt',
      desc:
          'The description calamity effects that decrease the support rate during slave revolt',
      args: [supportRate],
    );
  }

  /// `Your city support rate is increased by {supportRate} during the resolution of Slave Revolt`
  String yourCitySupportRateIsIncreasedDuringTheResolutionOfSlaveRevolt(
      int supportRate) {
    return Intl.message(
      'Your city support rate is increased by $supportRate during the resolution of Slave Revolt',
      name: 'yourCitySupportRateIsIncreasedDuringTheResolutionOfSlaveRevolt',
      desc:
          'The description calamity effects that increase the support rate during slave revolt',
      args: [supportRate],
    );
  }

  /// `In the case of an Earthquake, your city is reduced rather than destroyed.`
  String get calamityEffectEngineeringVolcanicEruptionEarthquake {
    return Intl.message(
      'In the case of an Earthquake, your city is reduced rather than destroyed.',
      name: 'calamityEffectEngineeringVolcanicEruptionEarthquake',
      desc: '',
      args: [],
    );
  }

  /// `The beneficiary selects and annexes 1 additional city.`
  String get calamityEffectBeneficiaryAnnexes1AdditionalCity {
    return Intl.message(
      'The beneficiary selects and annexes 1 additional city.',
      name: 'calamityEffectBeneficiaryAnnexes1AdditionalCity',
      desc: '',
      args: [],
    );
  }

  /// `{tokens} less barbarian tokens are used`
  String calamityEffectLessBarbarianTokensAreUsed(int tokens) {
    return Intl.message(
      '$tokens less barbarian tokens are used',
      name: 'calamityEffectLessBarbarianTokensAreUsed',
      desc:
          'The description calamity effects that have less barbarian tokens used',
      args: [tokens],
    );
  }

  /// `{tokens} additional barbarian tokens are used`
  String calamityEffectAdditionalBarbarianTokensAreUsed(int tokens) {
    return Intl.message(
      '$tokens additional barbarian tokens are used',
      name: 'calamityEffectAdditionalBarbarianTokensAreUsed',
      desc:
          'The description calamity effects that have additional barbarian tokens used',
      args: [tokens],
    );
  }

  /// `The beneficiary selects and annexes {unitPoints} less unit points`
  String calamityEffectBeneficiarySelectsAndAnnexesLessUnitPoints(
      int unitPoints) {
    return Intl.message(
      'The beneficiary selects and annexes $unitPoints less unit points',
      name: 'calamityEffectBeneficiarySelectsAndAnnexesLessUnitPoints',
      desc:
          'The description calamity effects that involve selecting less unit points',
      args: [unitPoints],
    );
  }

  /// `The beneficiary selects and annexes {unitPoints} additional unit points`
  String calamityEffectBeneficiarySelectsAndAnnexesAdditionalUnitPoints(
      int unitPoints) {
    return Intl.message(
      'The beneficiary selects and annexes $unitPoints additional unit points',
      name: 'calamityEffectBeneficiarySelectsAndAnnexesAdditionalUnitPoints',
      desc:
          'The description calamity effects that involve selecting additional unit points',
      args: [unitPoints],
    );
  }

  /// `Discard {points} less points of face value`
  String calamityEffectDiscardLessPointsOfFaceValue(int points) {
    return Intl.message(
      'Discard $points less points of face value',
      name: 'calamityEffectDiscardLessPointsOfFaceValue',
      desc:
          'The description calamity effects that involve discarding less points of face value',
      args: [points],
    );
  }

  /// `Discard {points} additional points of face value`
  String calamityEffectDiscardAdditionalPointsOfFaceValue(int points) {
    return Intl.message(
      'Discard $points additional points of face value',
      name: 'calamityEffectDiscardAdditionalPointsOfFaceValue',
      desc:
          'The description calamity effects that involve discarding additional points of face value',
      args: [points],
    );
  }

  /// `You may choose to discard 2 commodity cards to prevent the city reduction effect for you`
  String get calamityEffectTheocracyIconoclasmAndHeresy {
    return Intl.message(
      'You may choose to discard 2 commodity cards to prevent the city reduction effect for you',
      name: 'calamityEffectTheocracyIconoclasmAndHeresy',
      desc: '',
      args: [],
    );
  }

  /// `Your marker is moved backward 1 additional step`
  String get calamityEffectFundamentalismRegression {
    return Intl.message(
      'Your marker is moved backward 1 additional step',
      name: 'calamityEffectFundamentalismRegression',
      desc: '',
      args: [],
    );
  }

  /// `Your marker is moved backward 1 less step`
  String get calamityEffectLibraryRegression {
    return Intl.message(
      'Your marker is moved backward 1 less step',
      name: 'calamityEffectLibraryRegression',
      desc: '',
      args: [],
    );
  }

  /// `For each step backward, you may choose to prevent the effect by destroying 2 of your cities (if possible non-coastal)`
  String get calamityEffectEnlightenmentRegression {
    return Intl.message(
      'For each step backward, you may choose to prevent the effect by destroying 2 of your cities (if possible non-coastal)',
      name: 'calamityEffectEnlightenmentRegression',
      desc: '',
      args: [],
    );
  }

  /// `The beneficiary selects and replaces 1 additional coastal city`
  String get calamityEffectCartographyPiracy {
    return Intl.message(
      'The beneficiary selects and replaces 1 additional coastal city',
      name: 'calamityEffectCartographyPiracy',
      desc: '',
      args: [],
    );
  }

  /// `The beneficiary selects and replaces 1 less coastal city. You may not be selected as a secondary victim`
  String get calamityEffectNavalWarfarePiracy {
    return Intl.message(
      'The beneficiary selects and replaces 1 less coastal city. You may not be selected as a secondary victim',
      name: 'calamityEffectNavalWarfarePiracy',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Points`
  String get points {
    return Intl.message(
      'Points',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `SPECIAL ABILITY: {specialAbility}`
  String specialAbilityTitle(String specialAbility) {
    return Intl.message(
      'SPECIAL ABILITY: $specialAbility',
      name: 'specialAbilityTitle',
      desc: 'Title used when listing special ability for advances',
      args: [specialAbility],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Discounts`
  String get discounts {
    return Intl.message(
      'Discounts',
      name: 'discounts',
      desc: '',
      args: [],
    );
  }

  /// `{discountAmount} to {advance}`
  String discountAmount(int discountAmount, String advance) {
    return Intl.message(
      '$discountAmount to $advance',
      name: 'discountAmount',
      desc: 'Sentence used to describe the amount of the discount',
      args: [discountAmount, advance],
    );
  }

  /// `Minor`
  String get calamityTypeMinor {
    return Intl.message(
      'Minor',
      name: 'calamityTypeMinor',
      desc: '',
      args: [],
    );
  }

  /// `Tradeable`
  String get calamityTypeTradeable {
    return Intl.message(
      'Tradeable',
      name: 'calamityTypeTradeable',
      desc: '',
      args: [],
    );
  }

  /// `NonTradeable`
  String get calamityTypeNonTradeable {
    return Intl.message(
      'NonTradeable',
      name: 'calamityTypeNonTradeable',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Number of players`
  String get numberOfPlayers {
    return Intl.message(
      'Number of players',
      name: 'numberOfPlayers',
      desc: '',
      args: [],
    );
  }

  /// `Expert Game`
  String get expertGame {
    return Intl.message(
      'Expert Game',
      name: 'expertGame',
      desc: '',
      args: [],
    );
  }

  /// `Short Game`
  String get shortGame {
    return Intl.message(
      'Short Game',
      name: 'shortGame',
      desc: '',
      args: [],
    );
  }

  /// `Eastern Empires`
  String get easternEmpires {
    return Intl.message(
      'Eastern Empires',
      name: 'easternEmpires',
      desc: '',
      args: [],
    );
  }

  /// `Western Empires`
  String get westernEmpires {
    return Intl.message(
      'Western Empires',
      name: 'westernEmpires',
      desc: '',
      args: [],
    );
  }

  /// `Still to pay`
  String get creditsStillToPay {
    return Intl.message(
      'Still to pay',
      name: 'creditsStillToPay',
      desc: '',
      args: [],
    );
  }

  /// `Wasted`
  String get creditsWasted {
    return Intl.message(
      'Wasted',
      name: 'creditsWasted',
      desc: '',
      args: [],
    );
  }

  /// `Make Payment`
  String get makePayment {
    return Intl.message(
      'Make Payment',
      name: 'makePayment',
      desc: '',
      args: [],
    );
  }

  /// `Edit Settings`
  String get editSettings {
    return Intl.message(
      'Edit Settings',
      name: 'editSettings',
      desc: '',
      args: [],
    );
  }

  /// `Games`
  String get games {
    return Intl.message(
      'Games',
      name: 'games',
      desc: '',
      args: [],
    );
  }

  /// `Setup`
  String get setup {
    return Intl.message(
      'Setup',
      name: 'setup',
      desc: '',
      args: [],
    );
  }

  /// `Players: {chosenNumberOfPlayers}`
  String settingsPlayers(int chosenNumberOfPlayers) {
    return Intl.message(
      'Players: $chosenNumberOfPlayers',
      name: 'settingsPlayers',
      desc: 'Title of player selector in settings and new game',
      args: [chosenNumberOfPlayers],
    );
  }

  /// `Note that changing game settings will not reallocate initial advances or credits. This must be done manually.`
  String get settingsWarningAdvancesCredits {
    return Intl.message(
      'Note that changing game settings will not reallocate initial advances or credits. This must be done manually.',
      name: 'settingsWarningAdvancesCredits',
      desc: '',
      args: [],
    );
  }

  /// `You need to discard {cardsToDiscard} trade good cards`
  String paymentDiscardTradeGoods(int cardsToDiscard) {
    return Intl.message(
      'You need to discard $cardsToDiscard trade good cards',
      name: 'paymentDiscardTradeGoods',
      desc: 'Warning when we need to discard additional cards',
      args: [cardsToDiscard],
    );
  }

  /// `Summary`
  String get summary {
    return Intl.message(
      'Summary',
      name: 'summary',
      desc: '',
      args: [],
    );
  }

  /// `Pick Up`
  String get pickUp {
    return Intl.message(
      'Pick Up',
      name: 'pickUp',
      desc: '',
      args: [],
    );
  }

  /// `credits`
  String get credits {
    return Intl.message(
      'credits',
      name: 'credits',
      desc: '',
      args: [],
    );
  }

  /// `Discard`
  String get discard {
    return Intl.message(
      'Discard',
      name: 'discard',
      desc: '',
      args: [],
    );
  }

  /// `Trade Goods`
  String get tradeGoods {
    return Intl.message(
      'Trade Goods',
      name: 'tradeGoods',
      desc: '',
      args: [],
    );
  }

  /// `Value: {totalValue}`
  String tradeGoodValue(Object totalValue) {
    return Intl.message(
      'Value: $totalValue',
      name: 'tradeGoodValue',
      desc: '',
      args: [totalValue],
    );
  }

  /// `(Showing standard information. Not player specific)`
  String get calamityStandardInformation {
    return Intl.message(
      '(Showing standard information. Not player specific)',
      name: 'calamityStandardInformation',
      desc: '',
      args: [],
    );
  }

  /// `(Showing information specific to your game state)`
  String get calamityPlayerSpecific {
    return Intl.message(
      '(Showing information specific to your game state)',
      name: 'calamityPlayerSpecific',
      desc: '',
      args: [],
    );
  }

  /// `Modifiers`
  String get modifiers {
    return Intl.message(
      'Modifiers',
      name: 'modifiers',
      desc: '',
      args: [],
    );
  }

  /// `Coin & Commerce`
  String get scenarioCoinAndCommerce {
    return Intl.message(
      'Coin & Commerce',
      name: 'scenarioCoinAndCommerce',
      desc: '',
      args: [],
    );
  }

  /// `Exploring the Deserts`
  String get scenarioExploringTheDeserts {
    return Intl.message(
      'Exploring the Deserts',
      name: 'scenarioExploringTheDeserts',
      desc: '',
      args: [],
    );
  }

  /// `Mystical Palaces`
  String get scenarioMysticalPalaces {
    return Intl.message(
      'Mystical Palaces',
      name: 'scenarioMysticalPalaces',
      desc: '',
      args: [],
    );
  }

  /// `Sacred Constructors`
  String get scenarioSacredConstructors {
    return Intl.message(
      'Sacred Constructors',
      name: 'scenarioSacredConstructors',
      desc: '',
      args: [],
    );
  }

  /// `Early Merchants`
  String get scenarioEarlyMerchants {
    return Intl.message(
      'Early Merchants',
      name: 'scenarioEarlyMerchants',
      desc: '',
      args: [],
    );
  }

  /// `Cultural Heights`
  String get scenarioCulturalHeights {
    return Intl.message(
      'Cultural Heights',
      name: 'scenarioCulturalHeights',
      desc: '',
      args: [],
    );
  }

  /// `Spreading Knowledge`
  String get scenarioSpreadingKnowledge {
    return Intl.message(
      'Spreading Knowledge',
      name: 'scenarioSpreadingKnowledge',
      desc: '',
      args: [],
    );
  }

  /// `Conquering The Seas`
  String get scenarioConqueringTheSeas {
    return Intl.message(
      'Conquering The Seas',
      name: 'scenarioConqueringTheSeas',
      desc: '',
      args: [],
    );
  }

  /// `Emerging Empire`
  String get scenarioEmergingEmpire {
    return Intl.message(
      'Emerging Empire',
      name: 'scenarioEmergingEmpire',
      desc: '',
      args: [],
    );
  }

  /// `Nothing to discard or pick up. Continue to next round`
  String get summaryNothingToDo {
    return Intl.message(
      'Nothing to discard or pick up. Continue to next round',
      name: 'summaryNothingToDo',
      desc: '',
      args: [],
    );
  }

  /// `Select Scenario`
  String get selectScenario {
    return Intl.message(
      'Select Scenario',
      name: 'selectScenario',
      desc: '',
      args: [],
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
