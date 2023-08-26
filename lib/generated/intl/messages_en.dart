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

  static String m0(barbarianTokens) =>
      "The beneficiary selects 1 of your cities (if possible a wilderness city), which is attacked by ${barbarianTokens} barbarian tokens.";

  static String m1(citiesExemptFromReduction) =>
      "Reduce all but ${citiesExemptFromReduction} of your cities";

  static String m2(allBut) =>
      "Select all but ${allBut} of your unit points. The beneficiary anexes all selected units.";

  static String m3(targetValue) =>
      "Discard commodity cards with a total face value (not set value) of at least ${targetValue} points";

  static String m4(potentialAreas, citiesToSelect, secondaryCitiesToSelect) =>
      "Primary: Select ${potentialAreas} that has the largest number of your cities in areas directly adjacent to it. Select and reduce ${citiesToSelect} of these cities.\n\nSecondary: Select and reduce ${secondaryCitiesToSelect} cities adjacent to the selected area.";

  static String m5(primaryDamage, secondaryVictims, secondaryDamage) =>
      "Primary: Take ${primaryDamage} damage and select ${secondaryVictims} that must take 10 damage as well\n\nSecondary: Take ${secondaryDamage} damage";

  static String m6(primaryDamage, secondaryDamage, player) =>
      "Primary victim: Take ${primaryDamage} damage and assign 5 damage to ${player} of your choice\n\nSecondary victim: Take ${secondaryDamage} damage.";

  static String m7(primaryDamage, secondaryDamage, target) =>
      "Primary victim: If you have any units on a flood plain: take ${primaryDamage} damage on the flood plain. Select the flood plain where most of your units would be affected. All other players on the flood plain take 5 damage on that flood plain.\nIf you have no units on a flood plain, take 5 damage in total from ${target} instead.\n\nSecondary victim: Take ${secondaryDamage} damage on the flood plain.";

  static String m8(primaryCitiesToReduce, secondaryVictims) =>
      "Primary: Reduce ${primaryCitiesToReduce} of your cities and select ${secondaryVictims} to reduce 1 of their cities as well. The beneficiary may not be selected as a secondary victim.";

  static String m9(secondaryCitiesToReduce) =>
      "Secondary: Reduce ${secondaryCitiesToReduce} of your cities";

  static String m10(coastalCities, target, secondaryVictims) =>
      "The beneficiary selects ${coastalCities} of your cities in ${target} and you select 1 city in ${target} from ${secondaryVictims}. All selected cities are replaced with pirate cities. The beneficiary may not be selected as a secondary victim.";

  static String m11(stepsToRegress) =>
      "Your succession marker on the A.S.T. is moved ${stepsToRegress} steps backward";

  static String m12(supportRate) =>
      "Your city support rate is ${supportRate} during the resolution of Slave Revolt. Perform a check for city support and reduce cities until you have sufficient support.";

  static String m13(cities) => "Reduce ${cities} of your cities.";

  static String m14(cities) =>
      "The beneficiary selects and annexes ${cities} of your cities.";

  static String m15(unitPoints) =>
      "The beneficiary selects and annexes ${unitPoints} of your unit points";

  static String m16(cityAction) =>
      "If you have a city in an area with a volcano: destroy all units (irrespective of ownership) in the area(s) touched by the volcano. If you have cities in more than 1 area with a volcano, select 1 volcano that would affect the most of your unit points.\n\nOtherwise: select and ${cityAction} 1 of your cities and select and reduce 1 city adjacent by land or water (irrespective of ownership)";

  static String m17(tokens) => "${tokens} additional barbarian tokens are used";

  static String m18(unitPoints) =>
      "The beneficiary selects and annexes ${unitPoints} additional unit points";

  static String m19(unitPoints) =>
      "The beneficiary selects and annexes ${unitPoints} less unit points";

  static String m20(cities) => "Deselect ${cities} selected cities";

  static String m21(points) =>
      "Discard ${points} additional points of face value";

  static String m22(points) => "Discard ${points} less points of face value";

  static String m23(tokens) => "${tokens} less barbarian tokens are used";

  static String m24(damage) => "prevent ${damage} damage";

  static String m25(effect) => "Primary victim: ${effect}";

  static String m26(cities) => "Reduce ${cities} less cities";

  static String m27(effect) => "Secondary victim: ${effect}";

  static String m28(unitPoints) =>
      "select ${unitPoints} additional unit points";

  static String m29(unitPoints) => "select ${unitPoints} less unit points";

  static String m30(additionalDamage) =>
      "take ${additionalDamage} additional damage";

  static String m31(discountAmount, advance) =>
      "${discountAmount} to ${advance}";

  static String m32(cardsToDiscard) =>
      "You need to discard ${cardsToDiscard} trade good cards";

  static String m33(remainingCredits) => "Remaining: ${remainingCredits}";

  static String m34(chosenNumberOfPlayers) =>
      "Players: ${chosenNumberOfPlayers}";

  static String m35(specialAbility) => "SPECIAL ABILITY: ${specialAbility}";

  static String m36(totalValue) => "Value: ${totalValue}";

  static String m37(supportRate) =>
      "Your city support rate is decreased by ${supportRate} during the resolution of Slave Revolt";

  static String m38(supportRate) =>
      "Your city support rate is increased by ${supportRate} during the resolution of Slave Revolt";

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
        "advanceDescriptionAdvancedMilitary": MessageLookupByLibrary.simpleMessage(
            "In conflicts, you may choose to remove tokens from areas adjacent by land. After each round of token removal a new check for token majority must be made. You may decide to wait for other token conflicts to be resolved first.\n\nYou are allowed to cause conflict in areas containing units belonging to players holding Cultural Ascendancy."),
        "advanceDescriptionAgriculture": MessageLookupByLibrary.simpleMessage(
            "The population limit of ‘0’, ‘1’ and ‘2’ areas on the board is increased by 1 for you as long as these areas do not contain any other player’s units or barbarian tokens."),
        "advanceDescriptionAnatomy": MessageLookupByLibrary.simpleMessage(
            "Upon purchase, you may choose to acquire 1 science card with an undiscounted cost price of less than 100 for free."),
        "advanceDescriptionArchitecture": MessageLookupByLibrary.simpleMessage(
            "Once per turn, when constructing a city, you may choose to pay up to half of the required number of tokens from treasury."),
        "advanceDescriptionAstronavigation":
            MessageLookupByLibrary.simpleMessage(
                "Your ships are allowed to move through open sea areas."),
        "advanceDescriptionCartography": MessageLookupByLibrary.simpleMessage(
            "During the Trade cards acquisition phase, you may acquire additional trade cards from stack 2 for 5 treasury tokens and/or from stack 7 for 13 treasury tokens per card."),
        "advanceDescriptionClothMaking": MessageLookupByLibrary.simpleMessage(
            "Your ships are allowed to move 5 steps."),
        "advanceDescriptionCoinage": MessageLookupByLibrary.simpleMessage(
            "You may choose to increase or decrease your tax rate by 1."),
        "advanceDescriptionCulturalAscendancy":
            MessageLookupByLibrary.simpleMessage(
                "Players are not allowed to cause conflict in areas containing your units, except for areas where a conflict situation already occurs. This does not count for players holding Cultural Ascendancy or Advanced Military.\n\nYour units are protected against the effect of Politics.\n\nYour default city support rate is increased by 1."),
        "advanceDescriptionDemocracy": MessageLookupByLibrary.simpleMessage(
            "During the Tax collection phase you collect tax as usual but your cities do not revolt as a result of a shortage in tax collection."),
        "advanceDescriptionDiplomacy": MessageLookupByLibrary.simpleMessage(
            "Players are not allowed to move tokens into areas containing your cities, except for areas where a conflict situation already occurs. This does not count for players holding Diplomacy or Military."),
        "advanceDescriptionEngineering": MessageLookupByLibrary.simpleMessage(
            "Other players or barbarians require 8 tokens to successfully attack your cities. Your cities are then replaced with 7 tokens. This does not apply when the attacking player also holds Engineering.\n\nYou require 6 tokens to successfully attack other player’s cities or pirate cities. Their cities are then replaced with 5 tokens. This does not apply when the defending player also holds Engineering."),
        "advanceDescriptionLibrary": MessageLookupByLibrary.simpleMessage(
            "You may discount the cost of 1 other Civilization Advance that you purchase in the same turn as Library by 40 points."),
        "advanceDescriptionMetalworking": MessageLookupByLibrary.simpleMessage(
            "In conflicts, for each round of token removal all other players not holding Metalworking must remove their token first."),
        "advanceDescriptionMilitary": MessageLookupByLibrary.simpleMessage(
            "Your movement phase is after all other players not holding Military have moved. You are allowed to move tokens into areas containing cities belonging to players holding Diplomacy."),
        "advanceDescriptionMining": MessageLookupByLibrary.simpleMessage(
            "During the Trade cards acquisition phase, you may acquire additional trade cards from stack 6 and/or stack 8 for 13 treasury tokens per card.\n\nTreasury tokens are worth 2 points when purchasing Civilization Advances."),
        "advanceDescriptionMonarchy": MessageLookupByLibrary.simpleMessage(
            "You may choose to increase your tax rate by 1."),
        "advanceDescriptionMonument": MessageLookupByLibrary.simpleMessage(
            "Acquire 20 additional points of credit tokens in any combination of colors."),
        "advanceDescriptionNavalWarfare": MessageLookupByLibrary.simpleMessage(
            "Your ships are allowed to carry 6 tokens. In conflicts, you may choose to remove ships from the conflict area instead of tokens. After each round of token removal a new check for token majority must be made."),
        "advanceDescriptionPhilosophy": MessageLookupByLibrary.simpleMessage(
            "Your units are protected against the effect of Fundamentalism."),
        "advanceDescriptionPublicWorks": MessageLookupByLibrary.simpleMessage(
            "Areas containing your cities may also contain 1 of your tokens.\n\nYou are protected against the effect of Provincial Empire."),
        "advanceDescriptionRhetoric": MessageLookupByLibrary.simpleMessage(
            "During the Trade cards acquisition phase, you may acquire additional trade cards from stack 3 for 9 treasury tokens per card."),
        "advanceDescriptionRoadbuilding": MessageLookupByLibrary.simpleMessage(
            "When moving over land, your tokens may move 2 areas. Tokens that are in a conflict situation after 1 step are not allowed to move any further. Your hand limit of trade cards is increased by 1."),
        "advanceDescriptionTheology": MessageLookupByLibrary.simpleMessage(
            "Your units are protected against the effect of Monotheism."),
        "advanceDescriptionTradeEmpire": MessageLookupByLibrary.simpleMessage(
            "Once per turn, you may choose to use 1 substitute commodity card of at least the same face value when turning in an incomplete set of commodity cards."),
        "advanceDescriptionUrbanism": MessageLookupByLibrary.simpleMessage(
            "Once per turn, when constructing a wilderness city you may choose to use up to 4 tokens from areas adjacent by land."),
        "advanceDescriptionWonderOfTheWorld": MessageLookupByLibrary.simpleMessage(
            "During the Trade cards acquisition phase, you may acquire 1 additional trade card for free from a stack number that is higher than your number of cities in play. Wonder of the World counts as a city during the A.S.T.-alteration phase."),
        "advanceDescriptionWrittenRecord": MessageLookupByLibrary.simpleMessage(
            "Acquire 10 additional points of credit tokens in any combination of colors."),
        "advanceNameAdvancedMilitary":
            MessageLookupByLibrary.simpleMessage("Advanced Military"),
        "advanceNameAgriculture":
            MessageLookupByLibrary.simpleMessage("Agriculture"),
        "advanceNameAnatomy": MessageLookupByLibrary.simpleMessage("Anatomy"),
        "advanceNameArchitecture":
            MessageLookupByLibrary.simpleMessage("Architecture"),
        "advanceNameAstronavigation":
            MessageLookupByLibrary.simpleMessage("Astronavigation"),
        "advanceNameCalendar": MessageLookupByLibrary.simpleMessage("Calendar"),
        "advanceNameCartography":
            MessageLookupByLibrary.simpleMessage("Cartography"),
        "advanceNameClothMaking":
            MessageLookupByLibrary.simpleMessage("Cloth Making"),
        "advanceNameCoinage": MessageLookupByLibrary.simpleMessage("Coinage"),
        "advanceNameCulturalAscendancy":
            MessageLookupByLibrary.simpleMessage("Cultural Ascendancy"),
        "advanceNameDeism": MessageLookupByLibrary.simpleMessage("Deism"),
        "advanceNameDemocracy":
            MessageLookupByLibrary.simpleMessage("Democracy"),
        "advanceNameDiaspora": MessageLookupByLibrary.simpleMessage("Diaspora"),
        "advanceNameDiplomacy":
            MessageLookupByLibrary.simpleMessage("Diplomacy"),
        "advanceNameDramaAndPoetry":
            MessageLookupByLibrary.simpleMessage("Drama And Poetry"),
        "advanceNameEmpiricism":
            MessageLookupByLibrary.simpleMessage("Empiricism"),
        "advanceNameEngineering":
            MessageLookupByLibrary.simpleMessage("Engineering"),
        "advanceNameEnlightenment":
            MessageLookupByLibrary.simpleMessage("Enlightenment"),
        "advanceNameFundamentalism":
            MessageLookupByLibrary.simpleMessage("Fundamentalism"),
        "advanceNameLaw": MessageLookupByLibrary.simpleMessage("Law"),
        "advanceNameLibrary": MessageLookupByLibrary.simpleMessage("Library"),
        "advanceNameLiteracy": MessageLookupByLibrary.simpleMessage("Literacy"),
        "advanceNameMasonry": MessageLookupByLibrary.simpleMessage("Masonry"),
        "advanceNameMathematics":
            MessageLookupByLibrary.simpleMessage("Mathematics"),
        "advanceNameMedicine": MessageLookupByLibrary.simpleMessage("Medicine"),
        "advanceNameMetalworking":
            MessageLookupByLibrary.simpleMessage("Metalworking"),
        "advanceNameMilitary": MessageLookupByLibrary.simpleMessage("Military"),
        "advanceNameMining": MessageLookupByLibrary.simpleMessage("Mining"),
        "advanceNameMonarchy": MessageLookupByLibrary.simpleMessage("Monarchy"),
        "advanceNameMonotheism":
            MessageLookupByLibrary.simpleMessage("Monotheism"),
        "advanceNameMonument": MessageLookupByLibrary.simpleMessage("Monument"),
        "advanceNameMusic": MessageLookupByLibrary.simpleMessage("Music"),
        "advanceNameMysticism":
            MessageLookupByLibrary.simpleMessage("Mysticism"),
        "advanceNameMythology":
            MessageLookupByLibrary.simpleMessage("Mythology"),
        "advanceNameNavalWarfare":
            MessageLookupByLibrary.simpleMessage("Naval Warfare"),
        "advanceNamePhilosophy":
            MessageLookupByLibrary.simpleMessage("Philosophy"),
        "advanceNamePolitics": MessageLookupByLibrary.simpleMessage("Politics"),
        "advanceNamePottery": MessageLookupByLibrary.simpleMessage("Pottery"),
        "advanceNameProvincialEmpire":
            MessageLookupByLibrary.simpleMessage("Provincial Empire"),
        "advanceNamePublicWorks":
            MessageLookupByLibrary.simpleMessage("Public Works"),
        "advanceNameRhetoric": MessageLookupByLibrary.simpleMessage("Rhetoric"),
        "advanceNameRoadbuilding":
            MessageLookupByLibrary.simpleMessage("Roadbuilding"),
        "advanceNameSculpture":
            MessageLookupByLibrary.simpleMessage("Sculpture"),
        "advanceNameTheocracy":
            MessageLookupByLibrary.simpleMessage("Theocracy"),
        "advanceNameTheology": MessageLookupByLibrary.simpleMessage("Theology"),
        "advanceNameTradeEmpire":
            MessageLookupByLibrary.simpleMessage("Trade Empire"),
        "advanceNameTradeRoutes":
            MessageLookupByLibrary.simpleMessage("Trade Routes"),
        "advanceNameUniversalDoctrine":
            MessageLookupByLibrary.simpleMessage("Universal Doctrine"),
        "advanceNameUrbanism": MessageLookupByLibrary.simpleMessage("Urbanism"),
        "advanceNameWonderOfTheWorld":
            MessageLookupByLibrary.simpleMessage("Wonder Of The World"),
        "advanceNameWrittenRecord":
            MessageLookupByLibrary.simpleMessage("Written Record"),
        "advanceNoteFundamentalism": MessageLookupByLibrary.simpleMessage(
            "You may choose to destroy all units in an area adjacent by land to your units. Barbarian tokens, pirate cities and units belonging to players holding Fundamentalism or Philosophy are unaffected."),
        "advanceNoteUniversalDoctrine": MessageLookupByLibrary.simpleMessage(
            "The barbarian tokens may be selected from more than 1 area."),
        "advanceNotesAdvancedMilitary1": MessageLookupByLibrary.simpleMessage(
            "In conflict the token balance may change after every round of removal as you can remove tokens from different areas instead of the conflict area. A new check for token majority must be made each round."),
        "advanceNotesAdvancedMilitary2": MessageLookupByLibrary.simpleMessage(
            "A player holding \'Advanced Military\' may wait before resolving token conflicts in which he is involved, in order to choose where to remove his tokens (or ships, if he also holds ‘Naval Warfare’). If more than 1 player involved holds \'Advanced Military\', the player with the lowest A.S.T.-ranking (highest Civilization #) order may wait for players with a higher order (lowest #)."),
        "advanceNotesAdvancedMilitary3": MessageLookupByLibrary.simpleMessage(
            "Players are not allowed to reduce a city in order to provide themselves with more tokens in conflict."),
        "advanceNotesAdvancedMilitary4": MessageLookupByLibrary.simpleMessage(
            "If you unsuccessfully attack a city, the tokens that are destroyed from the area may not be removed from an adjacent area instead."),
        "advanceNotesAgriculture1": MessageLookupByLibrary.simpleMessage(
            "\'Agriculture\' does not allow you to build a city in an area with population limit \'0\'."),
        "advanceNotesAgriculture2": MessageLookupByLibrary.simpleMessage(
            "When reducing a city,you may immediately use the effect and thus place the additional token."),
        "advanceNotesAgriculture3": MessageLookupByLibrary.simpleMessage(
            "In conflict, as soon as you are the only player occupying the area (and the conflict ends), you may immediately use the effect and thus keep the additional token if present"),
        "advanceNotesAgriculture4": MessageLookupByLibrary.simpleMessage(
            "The effect of \'Agriculture\' does not apply to areas containing cities in combination with the effect of \'Public Works\'."),
        "advanceNotesArchitecture": MessageLookupByLibrary.simpleMessage(
            "You are allowed to use the ability when building a wilderness city."),
        "advanceNotesAstronavigation": MessageLookupByLibrary.simpleMessage(
            "Your ships may not end in an open sea area."),
        "advanceNotesCalendar": MessageLookupByLibrary.simpleMessage(
            "If you are a victim of Cyclone, you must first select the required number of affected cities by flipping the cities (either 1, 2 or 3). If you hold \'Trade Empire\' this number is increased by 1. If you have insufficient cities directly adjacent to the affected open sea area, you select all of those cities. Calendar subsequently permits you to deselect up to 2 of your selected cities. Then you must reduce all your remaining selected cities (if any)."),
        "advanceNotesCoinage1": MessageLookupByLibrary.simpleMessage(
            "You may only set a single tax rate for all of your cities."),
        "advanceNotesCoinage2": MessageLookupByLibrary.simpleMessage(
            "The tax rate effects of \'Coinage\' and \'Monarchy\' are cumulative."),
        "advanceNotesCoinage3": MessageLookupByLibrary.simpleMessage(
            "If an increase in tax rate would result in a tax revolt, you may still choose to do so."),
        "advanceNotesCulturalAscendancy1": MessageLookupByLibrary.simpleMessage(
            "Barbarian tokens are unaffected by \'Cultural Ascendancy\'."),
        "advanceNotesCulturalAscendancy2": MessageLookupByLibrary.simpleMessage(
            "Placing tokens during population expansion, annexation, Special abilities phase or moving ships in an area without disembarking tokens is not considered attacking or causing conflict."),
        "advanceNotesCulturalAscendancy3": MessageLookupByLibrary.simpleMessage(
            "An opponent moving a single token in an area that would result in conflict if it stays there is considered \'causing a conflict\', even if in case of a city attack the attack would be unsuccessful."),
        "advanceNotesCulturalAscendancy4": MessageLookupByLibrary.simpleMessage(
            "Attacking a city is considered \'causing conflict\', even if the attack is performed by a single token."),
        "advanceNotesCulturalAscendancy5": MessageLookupByLibrary.simpleMessage(
            "If a player holding \'Advanced Military\' moves a single token into an area containing your city, this is considered \'attacking the city\'. After he moved (and the token stays there), other players may move tokens into this area, even if they don’t hold \'Advanced Military\', because at this point a \'conflict situation\' already occurs in this area."),
        "advanceNotesCulturalAscendancy6": MessageLookupByLibrary.simpleMessage(
            "At any moment a check is made for city support (including the resolution of Slave Revolt) you must have an additional token on the map board for each of your cities. When you purchase \'Cultural Ascendancy\' there is no check for city support. The first time a check is made is during the City construction phase."),
        "advanceNotesDemocracy": MessageLookupByLibrary.simpleMessage(
            "If an increase in tax rate would result in a tax revolt, you may still choose to do so. If this would happen you can still become the beneficiary of another player’s tax revolt that turn."),
        "advanceNotesDiaspora1": MessageLookupByLibrary.simpleMessage(
            "Placing a token in an area containing a city is not allowed, except for your own city if you hold \'Public Works\'."),
        "advanceNotesDiaspora2": MessageLookupByLibrary.simpleMessage(
            "In areas that only contain your tokens the effect of \'Agriculture\' may be used."),
        "advanceNotesDiplomacy1": MessageLookupByLibrary.simpleMessage(
            "Barbarian tokens are unaffected by \'Diplomacy\'."),
        "advanceNotesDiplomacy2": MessageLookupByLibrary.simpleMessage(
            "Placing tokens during population expansion, annexation, Special abilities phase or moving ships into an area without disembarking tokens is not considered attacking or causing conflict."),
        "advanceNotesDiplomacy3": MessageLookupByLibrary.simpleMessage(
            "If a player holding ‘Military’ moves a single token into an area containing your city, this is considered \'attacking the city\'. After he moved (and the token stays there), other players may move tokens into this area, even if they don’t hold \'Military\', because at this point a \'conflict situation\' already occurs in this area."),
        "advanceNotesMasonry": MessageLookupByLibrary.simpleMessage(
            "If you are a victim of Cyclone, you must first select the required number of affected cities by flipping the cities (either 1, 2 or 3). If you hold \'Trade Empire\' this number is increased by 1. If you have insufficient cities directly adjacent to the affected open sea area, you select all of those cities. \'Masonry\' subsequently permits you to deselect 1 of your selected cities. Then you must reduce all your remaining selected cities (if any)."),
        "advanceNotesMetalworking": MessageLookupByLibrary.simpleMessage(
            "If more than 1 player holds \'Metalworking\', their mutual order is again the normal minority/majority order."),
        "advanceNotesMilitary": MessageLookupByLibrary.simpleMessage(
            "If more than 1 player holds \'Military\', for these players their mutual order is again defined by their census."),
        "advanceNotesMining": MessageLookupByLibrary.simpleMessage(
            "When using treasury tokens to purchase Civilization Advances you may exceed the purchase price by exactly 1 this way."),
        "advanceNotesMonarchy1": MessageLookupByLibrary.simpleMessage(
            "You may only set a single tax rate for all of your cities."),
        "advanceNotesMonarchy2": MessageLookupByLibrary.simpleMessage(
            "The tax rate effects of \'Monarchy\' and \'Coinage\' are cumulative."),
        "advanceNotesMonarchy3": MessageLookupByLibrary.simpleMessage(
            "If an increase in tax rate would result in a tax revolt, you may still choose to do so."),
        "advanceNotesMonotheism1": MessageLookupByLibrary.simpleMessage(
            "If you have insufficient units in stock to annex all units in the area to start with, you cannot select this area."),
        "advanceNotesMonotheism2": MessageLookupByLibrary.simpleMessage(
            "If you annex an area containing a city and a token (due to \'Public Works\') or more tokens than the population limit allows (due to \'Agriculture\'), the extra token must also be annexed, even if you don\'t also hold any of these advances. In this case it will be destroyed during the next \'Remove surplus population\' phase."),
        "advanceNotesMonument": MessageLookupByLibrary.simpleMessage(
            "You gain and choose the color(s) of the additional credit tokens at the time \'Monument\' is purchased. Your decision cannot be changed at a later stage."),
        "advanceNotesNavalWarfare1": MessageLookupByLibrary.simpleMessage(
            "In conflict, while checking for token majority, your ships are not counted. Because you can remove a ship rather than a token each round, this token balance may change every round of removal. Therefore a new check for majority has to be made each round."),
        "advanceNotesNavalWarfare2": MessageLookupByLibrary.simpleMessage(
            "Even if you hold ‘Naval Warfare’, moving your ships into an area (with or without tokens), is not considered to be causing conflict or attacking, while disembarking tokens may actually be. In an area containing only your ship and 1 or more enemy tokens or a city, your ship itself does not cause conflict."),
        "advanceNotesNavalWarfare3": MessageLookupByLibrary.simpleMessage(
            "An enemy token in an area containing only your ship (none of your tokens) is not causing conflict here due to your ship."),
        "advanceNotesNavalWarfare4": MessageLookupByLibrary.simpleMessage(
            "When attacking a city, a ship does not count for the minimum of 7 tokens; you still require sufficient tokens. However, during conflict resolution you may remove your ships as losses if the attack is successful."),
        "advanceNotesNavalWarfare5": MessageLookupByLibrary.simpleMessage(
            "If your city attack is unsuccessful, all of your ships in this area are destroyed as well."),
        "advanceNotesNavalWarfare6": MessageLookupByLibrary.simpleMessage(
            "If you hold both ‘Advanced Military’ and ‘Naval Warfare’, you cannot remove ships from areas adjacent to the conflict area."),
        "advanceNotesPolitics1": MessageLookupByLibrary.simpleMessage(
            "If you have insufficient units in stock or treasury to annex all units in the area to start with, you cannot select this area."),
        "advanceNotesPolitics2": MessageLookupByLibrary.simpleMessage(
            "If you annex an area containing a city and a token (due to \'Public Works\') or more tokens than the population limit allows (due to \'Agriculture\'), the extra token must also be annexed (and be paid for), even if you do not also hold any of these advances. In this case it will be destroyed during the next \'Remove surplus population\' phase."),
        "advanceNotesPolitics3": MessageLookupByLibrary.simpleMessage(
            "The treasury tokens paid are put into your own stock. The treasury of the victim is unaffected."),
        "advanceNotesProvincialEmpire": MessageLookupByLibrary.simpleMessage(
            "The victims may choose whether they give their cards face up or down. You may choose whether you reveal them."),
        "advanceNotesPublicWorks1": MessageLookupByLibrary.simpleMessage(
            "Tokens in areas with a city expand as normal."),
        "advanceNotesPublicWorks2": MessageLookupByLibrary.simpleMessage(
            "If your city is annexed or destroyed due to a tax revolt or calamity the additional token is destroyed."),
        "advanceNotesPublicWorks3": MessageLookupByLibrary.simpleMessage(
            "When building a city, only if you use more than the required tokens from the map board, you may leave 1 token in the area."),
        "advanceNotesPublicWorks4": MessageLookupByLibrary.simpleMessage(
            "If you reduce a city containing the additional token you must immediately count the extra token as population and thus replace the city with 1 token less than normal."),
        "advanceNotesPublicWorks5": MessageLookupByLibrary.simpleMessage(
            "\'Agriculture\' does not allow you to keep more than 1 token in an area containing your city."),
        "advanceNotesPublicWorks6": MessageLookupByLibrary.simpleMessage(
            "If a special ability mentions destroying or annexing all units in an area containing your city, the additional token must also be annexed or destroyed."),
        "advanceNotesRoadbuilding1": MessageLookupByLibrary.simpleMessage(
            "For each of your tokens, if you choose to move 2 steps, you must do so in one go and then flip the token. This second step may not be made before or after embarking a ship. If a token is in a \'conflict situation\' after the first of 2 steps, you may not move this token a second step.This second step may end in a \'conflict situation\'."),
        "advanceNotesRoadbuilding2": MessageLookupByLibrary.simpleMessage(
            "Attacking a city is considered \'causing conflict\' or being in a \'conflict situation\', even if the attack is performed by a single token."),
        "advanceNotesTheocracy1": MessageLookupByLibrary.simpleMessage(
            "Using this ability prevents your cities from being reduced, but does not cancel the secondary effects of Iconoclasm and Heresy if you are the primary victim."),
        "advanceNotesTheocracy2": MessageLookupByLibrary.simpleMessage(
            "Water commodity cards may be used."),
        "advanceNotesTradeRoutes": MessageLookupByLibrary.simpleMessage(
            "You cannot gain less treasury than exactly twice the face value of a commodity card. If you have insufficient tokens in stock you cannot discard this card."),
        "advanceNotesUrbanism": MessageLookupByLibrary.simpleMessage(
            "In combination with \'Architecture\' this means a wilderness city can be built in an area containing 2 tokens, using 4 tokens from adjacent areas and 6 tokens from treasury."),
        "advanceNotesWonderOfTheWorld1": MessageLookupByLibrary.simpleMessage(
            "Acquiring this additional card is considered purchasing for 0 treasury tokens during additional purchases."),
        "advanceNotesWonderOfTheWorld2": MessageLookupByLibrary.simpleMessage(
            "Players cannot acquire the additional card while having 9 cities in play."),
        "advanceNotesWrittenRecord": MessageLookupByLibrary.simpleMessage(
            "You gain and choose the color(s) of the additional credit tokens at the time \'Written Record\' is purchased. Your decision cannot be changed at a later stage."),
        "advanceSpecialAbilitiesDiaspora": MessageLookupByLibrary.simpleMessage(
            "You may choose to take up to 5 of your tokens from the board and place them anywhere else on the board, providing that no population limits are exceeded."),
        "advanceSpecialAbilitiesMonotheism": MessageLookupByLibrary.simpleMessage(
            "You may choose to annex all units in an area adjacent by land to your units. Barbarian tokens, pirate cities and units belonging to players holding Monotheism or Theology are unaffected."),
        "advanceSpecialAbilitiesPolitics": MessageLookupByLibrary.simpleMessage(
            "You may choose 1 of 2 options: 1) Gain up to 5 treasury tokens from stock. 2) Annex all units in an area adjacent by land to your units. Pay treasury tokens equal to the number of unit points annexed, or the effect is canceled. Barbarian tokens, pirate cities and units belonging to players holding Politics or Cultural Ascendancy are unaffected."),
        "advanceSpecialAbilitiesProvincialEmpire":
            MessageLookupByLibrary.simpleMessage(
                "You may choose to select up to 5 players that have units adjacent by land or water to your units. These players must choose and give you a commodity card with a face value of at least 2. Players holding Provincial Empire or Public Works may not be selected."),
        "advanceSpecialAbilitiesTradeRoutes": MessageLookupByLibrary.simpleMessage(
            "You may choose to discard any number of commodity cards to gain treasury tokens at twice the face value of the commodity cards discarded this way."),
        "advanceSpecialAbilityUniversalDoctrine":
            MessageLookupByLibrary.simpleMessage(
                "You may choose to annex 1 pirate city or up to 5 barbarian tokens anywhere on the board."),
        "appName":
            MessageLookupByLibrary.simpleMessage("Mega Empires Assistant"),
        "calamities": MessageLookupByLibrary.simpleMessage("Calamities"),
        "calamityDescriptionBanditry": MessageLookupByLibrary.simpleMessage(
            "Discard 2 commodity cards of your choice. For each card you must discard, you may choose to pay 4 treasury tokens to prevent it."),
        "calamityDescriptionBarbarianHordes": m0,
        "calamityDescriptionCityInFlames": MessageLookupByLibrary.simpleMessage(
            "Destroy 1 of your cities. You may choose to pay 10 treasury tokens to prevent this."),
        "calamityDescriptionCityRiots": MessageLookupByLibrary.simpleMessage(
            "Reduce 1 of your cities and lose 5 treasury tokens."),
        "calamityDescriptionCivilDisorder": m1,
        "calamityDescriptionCivilWar": m2,
        "calamityDescriptionCoastalMigration":
            MessageLookupByLibrary.simpleMessage(
                "Destroy 1 of your coastal cities and lose 5 treasury tokens"),
        "calamityDescriptionCorruption": m3,
        "calamityDescriptionCyclone": m4,
        "calamityDescriptionCycloneBlizzard": MessageLookupByLibrary.simpleMessage(
            "\n\nAny population tokens on Western Himalaya are unaffected by Cyclone/Blizzard."),
        "calamityDescriptionCycloneBlizzardPotentialAreas":
            MessageLookupByLibrary.simpleMessage(
                "the open sea area or Western Himalaya"),
        "calamityDescriptionCyclonePotentialAreas":
            MessageLookupByLibrary.simpleMessage("the open sea area"),
        "calamityDescriptionEpidemic": m5,
        "calamityDescriptionEpidemicSecondaryVictims1":
            MessageLookupByLibrary.simpleMessage("1 other player"),
        "calamityDescriptionEpidemicSecondaryVictims2":
            MessageLookupByLibrary.simpleMessage("2 other players"),
        "calamityDescriptionFamine": m6,
        "calamityDescriptionFamineAnotherPlayer":
            MessageLookupByLibrary.simpleMessage("another player"),
        "calamityDescriptionFamineEachOf3Players":
            MessageLookupByLibrary.simpleMessage("each of 3 players"),
        "calamityDescriptionFlood": m7,
        "calamityDescriptionFloodAvalancheTarget":
            MessageLookupByLibrary.simpleMessage(
                "coastal areas or areas in or adjacent to Western Himalaya"),
        "calamityDescriptionFloodTarget": MessageLookupByLibrary.simpleMessage(
            "coastal areas of your choice"),
        "calamityDescriptionIconoclasmAndHeresy": m8,
        "calamityDescriptionIconoclasmAndHeresySecondary": m9,
        "calamityDescriptionIconoclasmAndHeresySecondaryVictims1":
            MessageLookupByLibrary.simpleMessage("1 other player"),
        "calamityDescriptionIconoclasmAndHeresySecondaryVictims2":
            MessageLookupByLibrary.simpleMessage("2 other players"),
        "calamityDescriptionIconoclasmAndHeresyTheocracy":
            MessageLookupByLibrary.simpleMessage(
                "You may choose to discard 2 commodity cards to prevent the city reduction effect for you."),
        "calamityDescriptionMinorUprising":
            MessageLookupByLibrary.simpleMessage("Destroy 1 of your cities."),
        "calamityDescriptionPiracy": m10,
        "calamityDescriptionPiracyNavalWarfare":
            MessageLookupByLibrary.simpleMessage(
                ". You may not be selected as a secondary victim"),
        "calamityDescriptionPiracyRaidTarget":
            MessageLookupByLibrary.simpleMessage(
                "coastal areas or areas adjacent to Western Himalaya"),
        "calamityDescriptionPiracySecondaryVictims1":
            MessageLookupByLibrary.simpleMessage("another player"),
        "calamityDescriptionPiracySecondaryVictims2":
            MessageLookupByLibrary.simpleMessage("each of 2 other players"),
        "calamityDescriptionPiracyTarget":
            MessageLookupByLibrary.simpleMessage("coastal areas"),
        "calamityDescriptionRegression": m11,
        "calamityDescriptionRegressionEnlightenment":
            MessageLookupByLibrary.simpleMessage(
                ". For each step backward, you may choose to prevent the effect by destroying 2 of your cities (if possible non-coastal)"),
        "calamityDescriptionSlaveRevolt": m12,
        "calamityDescriptionSquanderedWealth":
            MessageLookupByLibrary.simpleMessage("Lose 10 treasury tokens."),
        "calamityDescriptionSuperstition": m13,
        "calamityDescriptionTempest": MessageLookupByLibrary.simpleMessage(
            "Take 2 damage in total from coastal areas of your choice and lose 5 treasury tokens."),
        "calamityDescriptionTreachery": m14,
        "calamityDescriptionTribalConflict":
            MessageLookupByLibrary.simpleMessage("Take 5 damage."),
        "calamityDescriptionTyranny": m15,
        "calamityDescriptionVolcanicEruptionEarthquake": m16,
        "calamityEffectAdditionalBarbarianTokensAreUsed": m17,
        "calamityEffectBeneficiaryAnnexes1AdditionalCity":
            MessageLookupByLibrary.simpleMessage(
                "The beneficiary selects and annexes 1 additional city."),
        "calamityEffectBeneficiarySelectsAndAnnexesAdditionalUnitPoints": m18,
        "calamityEffectBeneficiarySelectsAndAnnexesLessUnitPoints": m19,
        "calamityEffectCartographyPiracy": MessageLookupByLibrary.simpleMessage(
            "The beneficiary selects and replaces 1 additional coastal city"),
        "calamityEffectDeselect1SelectedCity":
            MessageLookupByLibrary.simpleMessage("Deselect 1 selected city"),
        "calamityEffectDeselectSelectedCities": m20,
        "calamityEffectDiscardAdditionalPointsOfFaceValue": m21,
        "calamityEffectDiscardLessPointsOfFaceValue": m22,
        "calamityEffectEngineeringVolcanicEruptionEarthquake":
            MessageLookupByLibrary.simpleMessage(
                "In the case of an Earthquake, your city is reduced rather than destroyed."),
        "calamityEffectEnlightenmentRegression":
            MessageLookupByLibrary.simpleMessage(
                "For each step backward, you may choose to prevent the effect by destroying 2 of your cities (if possible non-coastal)"),
        "calamityEffectFundamentalismRegression":
            MessageLookupByLibrary.simpleMessage(
                "Your marker is moved backward 1 additional step"),
        "calamityEffectLessBarbarianTokensAreUsed": m23,
        "calamityEffectLibraryRegression": MessageLookupByLibrary.simpleMessage(
            "Your marker is moved backward 1 less step"),
        "calamityEffectNavalWarfarePiracy": MessageLookupByLibrary.simpleMessage(
            "The beneficiary selects and replaces 1 less coastal city. You may not be selected as a secondary victim"),
        "calamityEffectPreventDamage": m24,
        "calamityEffectPrimaryVictim": m25,
        "calamityEffectReduce1AdditionalCity":
            MessageLookupByLibrary.simpleMessage("Reduce 1 additional city"),
        "calamityEffectReduce1LessCity":
            MessageLookupByLibrary.simpleMessage("Reduce 1 less city"),
        "calamityEffectReduceLessCities": m26,
        "calamityEffectSecondaryVictim": m27,
        "calamityEffectSelect1AdditionalCity":
            MessageLookupByLibrary.simpleMessage("Select 1 additional city"),
        "calamityEffectSelectAdditionalUnitPoints": m28,
        "calamityEffectSelectLessUnitPoints": m29,
        "calamityEffectTakeAdditionalDamage": m30,
        "calamityEffectTheocracyIconoclasmAndHeresy":
            MessageLookupByLibrary.simpleMessage(
                "You may choose to discard 2 commodity cards to prevent the city reduction effect for you"),
        "calamityNameBanditry":
            MessageLookupByLibrary.simpleMessage("Banditry"),
        "calamityNameBarbarianHordes":
            MessageLookupByLibrary.simpleMessage("Barbarian Hordes"),
        "calamityNameCityInFlames":
            MessageLookupByLibrary.simpleMessage("City In Flames"),
        "calamityNameCityRiots":
            MessageLookupByLibrary.simpleMessage("City Riots"),
        "calamityNameCivilDisorder":
            MessageLookupByLibrary.simpleMessage("Civil Disorder"),
        "calamityNameCivilWar":
            MessageLookupByLibrary.simpleMessage("Civil War"),
        "calamityNameCoastalMigration":
            MessageLookupByLibrary.simpleMessage("Coastal Migration"),
        "calamityNameCorruption":
            MessageLookupByLibrary.simpleMessage("Corruption"),
        "calamityNameCyclone": MessageLookupByLibrary.simpleMessage("Cyclone"),
        "calamityNameCycloneBlizzard":
            MessageLookupByLibrary.simpleMessage("Cyclone/Blizzard"),
        "calamityNameEpidemic":
            MessageLookupByLibrary.simpleMessage("Epidemic"),
        "calamityNameFamine": MessageLookupByLibrary.simpleMessage("Famine"),
        "calamityNameFlood": MessageLookupByLibrary.simpleMessage("Flood"),
        "calamityNameFloodAvalanche":
            MessageLookupByLibrary.simpleMessage("Flood/Avalanche"),
        "calamityNameIconoclasmAndHeresy":
            MessageLookupByLibrary.simpleMessage("Iconoclasm And Heresy"),
        "calamityNameMinorUprising":
            MessageLookupByLibrary.simpleMessage("Minor Uprising"),
        "calamityNamePiracy": MessageLookupByLibrary.simpleMessage("Piracy"),
        "calamityNamePiracyRaid":
            MessageLookupByLibrary.simpleMessage("Piracy/Raid"),
        "calamityNameRegression":
            MessageLookupByLibrary.simpleMessage("Regression"),
        "calamityNameSlaveRevolt":
            MessageLookupByLibrary.simpleMessage("Slave Revolt"),
        "calamityNameSquanderedWealth":
            MessageLookupByLibrary.simpleMessage("Squandered Wealth"),
        "calamityNameSuperstition":
            MessageLookupByLibrary.simpleMessage("Superstition"),
        "calamityNameTempest": MessageLookupByLibrary.simpleMessage("Tempest"),
        "calamityNameTreachery":
            MessageLookupByLibrary.simpleMessage("Treachery"),
        "calamityNameTribalConflict":
            MessageLookupByLibrary.simpleMessage("Tribal Conflict"),
        "calamityNameTyranny": MessageLookupByLibrary.simpleMessage("Tyranny"),
        "calamityNameVolcanicEruptionEarthquake":
            MessageLookupByLibrary.simpleMessage(
                "Volcanic Eruption/Earthquake"),
        "calamityPlayerSpecific": MessageLookupByLibrary.simpleMessage(
            "(Showing information specific to your game state)"),
        "calamityStandardInformation": MessageLookupByLibrary.simpleMessage(
            "(Showing standard information. Not player specific)"),
        "calamityTypeMinor": MessageLookupByLibrary.simpleMessage("Minor"),
        "calamityTypeNonTradeable":
            MessageLookupByLibrary.simpleMessage("NonTradeable"),
        "calamityTypeTradeable":
            MessageLookupByLibrary.simpleMessage("Tradeable"),
        "cont": MessageLookupByLibrary.simpleMessage("Continue"),
        "credits": MessageLookupByLibrary.simpleMessage("credits"),
        "creditsStillToPay":
            MessageLookupByLibrary.simpleMessage("Still to pay"),
        "creditsWasted": MessageLookupByLibrary.simpleMessage("Wasted"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "destroyCity": MessageLookupByLibrary.simpleMessage("destroy"),
        "discard": MessageLookupByLibrary.simpleMessage("Discard"),
        "discountAmount": m31,
        "discounts": MessageLookupByLibrary.simpleMessage("Discounts"),
        "easternEmpires":
            MessageLookupByLibrary.simpleMessage("Eastern Empires"),
        "editAdvances": MessageLookupByLibrary.simpleMessage("Edit Advances"),
        "editCredits": MessageLookupByLibrary.simpleMessage("Edit Credits"),
        "editSettings": MessageLookupByLibrary.simpleMessage("Edit Settings"),
        "expertGame": MessageLookupByLibrary.simpleMessage("Expert Game"),
        "games": MessageLookupByLibrary.simpleMessage("Games"),
        "instructions": MessageLookupByLibrary.simpleMessage(
            "The assistant is created to make your Mega Empires games go smoother.\n\nAt any point, you can use the menu in the top right corner to modify the advancements and credits you have, and the game settings.\n\nThe assistant understands the impact of the advancements and will apply them. For example, if you hold the \'Mining\' advance then the value of your treasury tokens is automatically counted as double, you don\'t need to do anything manual to make this happen.\n\nMandatory credits are automatically applied and are visible on the credits screen. You may edit the credits on top of that for your own purposes.\n\nYou can use the \'Calamities\' menu to show the effect of each calamity on you given the current state of your advances. Again, this will automatically account for advances which make calamities better or worse for you.\n\n\n\n\n"),
        "makePayment": MessageLookupByLibrary.simpleMessage("Make Payment"),
        "modifiers": MessageLookupByLibrary.simpleMessage("Modifiers"),
        "newGame": MessageLookupByLibrary.simpleMessage("New Game"),
        "notes": MessageLookupByLibrary.simpleMessage("Notes"),
        "numberOfPlayers":
            MessageLookupByLibrary.simpleMessage("Number of players"),
        "paymentDiscardTradeGoods": m32,
        "pickUp": MessageLookupByLibrary.simpleMessage("Pick Up"),
        "points": MessageLookupByLibrary.simpleMessage("Points"),
        "price": MessageLookupByLibrary.simpleMessage("Price"),
        "purchaseAdvances":
            MessageLookupByLibrary.simpleMessage("Purchase Advances"),
        "purchased": MessageLookupByLibrary.simpleMessage("PURCHASED"),
        "reduceCity": MessageLookupByLibrary.simpleMessage("reduce"),
        "remainingCredits": m33,
        "scenarioCoinAndCommerce":
            MessageLookupByLibrary.simpleMessage("Coin & Commerce"),
        "scenarioConqueringTheSeas":
            MessageLookupByLibrary.simpleMessage("Conquering The Seas"),
        "scenarioCulturalHeights":
            MessageLookupByLibrary.simpleMessage("Cultural Heights"),
        "scenarioEarlyMerchants":
            MessageLookupByLibrary.simpleMessage("Early Merchants"),
        "scenarioEmergingEmpire":
            MessageLookupByLibrary.simpleMessage("Emerging Empire"),
        "scenarioExploringTheDeserts":
            MessageLookupByLibrary.simpleMessage("Exploring the Deserts"),
        "scenarioMysticalPalaces":
            MessageLookupByLibrary.simpleMessage("Mystical Palaces"),
        "scenarioSacredConstructors":
            MessageLookupByLibrary.simpleMessage("Sacred Constructors"),
        "scenarioSpreadingKnowledge":
            MessageLookupByLibrary.simpleMessage("Spreading Knowledge"),
        "selectScenario":
            MessageLookupByLibrary.simpleMessage("Select Scenario"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "settingsPlayers": m34,
        "settingsWarningAdvancesCredits": MessageLookupByLibrary.simpleMessage(
            "Note that changing game settings will not reallocate initial advances or credits. This must be done manually."),
        "setup": MessageLookupByLibrary.simpleMessage("Setup"),
        "shortGame": MessageLookupByLibrary.simpleMessage("Short Game"),
        "specialAbilityTitle": m35,
        "start": MessageLookupByLibrary.simpleMessage("Start"),
        "summary": MessageLookupByLibrary.simpleMessage("Summary"),
        "summaryNothingToDo": MessageLookupByLibrary.simpleMessage(
            "Nothing to discard or pick up. Continue to next round"),
        "tradeGoodValue": m36,
        "tradeGoods": MessageLookupByLibrary.simpleMessage("Trade Goods"),
        "viewCalamities":
            MessageLookupByLibrary.simpleMessage("View Calamities"),
        "westernEmpires":
            MessageLookupByLibrary.simpleMessage("Western Empires"),
        "yourCitySupportRateIsDecreasedDuringTheResolutionOfSlaveRevolt": m37,
        "yourCitySupportRateIsIncreasedDuringTheResolutionOfSlaveRevolt": m38
      };
}
