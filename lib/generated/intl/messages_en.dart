// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(remainingCredits) => "Remaining: ${remainingCredits}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "additionalCredits":
            MessageLookupByLibrary.simpleMessage("Additional Credits"),
        "advanceColourBlue": MessageLookupByLibrary.simpleMessage("Blue"),
        "advanceColourGreen": MessageLookupByLibrary.simpleMessage("Green"),
        "advanceColourNameBlue": MessageLookupByLibrary.simpleMessage("Arts"),
        "advanceColourNameGreen":
            MessageLookupByLibrary.simpleMessage("Science"),
        "advanceColourNameOrange":
            MessageLookupByLibrary.simpleMessage("Crafts"),
        "advanceColourNameRed": MessageLookupByLibrary.simpleMessage("Civics"),
        "advanceColourNameYellow":
            MessageLookupByLibrary.simpleMessage("Religion"),
        "advanceColourOrange": MessageLookupByLibrary.simpleMessage("Orange"),
        "advanceColourRed": MessageLookupByLibrary.simpleMessage("Red"),
        "advanceColourYellow": MessageLookupByLibrary.simpleMessage("Yellow"),
        "appName":
            MessageLookupByLibrary.simpleMessage("Mega Empires Assistant"),
        "cont": MessageLookupByLibrary.simpleMessage("Continue"),
        "instructions": MessageLookupByLibrary.simpleMessage(
            "The assistant is created to make your Mega Empires games go smoother.\n\nAt any point, you can use the menu in the top right corner to modify the advancements and credits you have, and the game settings.\n\nThe assistant understands the impact of the advancements and will apply them. For example, if you hold the \'Mining\' advance then the value of your treasury tokens is automatically counted as double, you don\'t need to do anything manual to make this happen.\n\nMandatory credits are automatically applied and are visible on the credits screen. You may edit the credits on top of that for your own purposes.\n\nYou can use the \'Calamities\' menu to show the effect of each calamity on you given the current state of your advances. Again, this will automatically account for advances which make calamities better or worse for you.\n\n\n\n\n"),
        "newGame": MessageLookupByLibrary.simpleMessage("New Game"),
        "noAdvancesMatchYourQuery": MessageLookupByLibrary.simpleMessage(
            "No advances match your query"),
        "purchaseAdvances":
            MessageLookupByLibrary.simpleMessage("Purchase Advances"),
        "remainingCredits": m0
      };
}
