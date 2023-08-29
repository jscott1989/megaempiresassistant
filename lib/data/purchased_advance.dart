import 'package:flutter/foundation.dart';
import 'package:mega_empires_assistant/data/advance_colour.dart';
import 'package:mega_empires_assistant/game/advances.dart';

import 'advance.dart';

/// An advance which has been purchased
///
/// This potentially has additional credits if the advance allows for that.
final class PurchasedAdvance {
  final Advance advance;
  final Map<AdvanceColour, int> additionalCredits;

  @override
  bool operator ==(o) =>
      o is PurchasedAdvance &&
      advance.key == o.advance.key &&
      mapEquals(additionalCredits, o.additionalCredits);

  @override
  int get hashCode => advance.key.hashCode;

  @override
  String toString() {
    return "PurchasedAdvance{advance=$advance, additionalCredits=$additionalCredits}";
  }

  /// Create a PurchasedAdvance for a particular advance
  PurchasedAdvance.of(this.advance) : additionalCredits = {};

  /// Create a PurchasedAdvance for a particular advance with specified
  /// additional credits.
  PurchasedAdvance.withAdditional(this.advance, this.additionalCredits);

  /// The complete set of credits from this purchased advance, including
  /// mandatory and "additional".
  Map<AdvanceColour, int> credits() {
    final credits = {for (var e in AdvanceColour.values) e: 0};

    additionalCredits.forEach((key, value) {
      credits[key] = credits[key]! + value;
    });

    advance.discounts.forEach((colour, value) {
      if (!credits.containsKey(colour)) {
        credits[colour] = 0;
      }
      credits[colour] = credits[colour]! + value;
    });

    return credits;
  }

  factory PurchasedAdvance.fromJson(Map<String, dynamic> data) =>
      PurchasedAdvance.withAdditional(
        indexedAdvances[AdvanceKey.values.byName(data["advance"]!)]!,
        data["additionalCredits"].map<AdvanceColour, int>(
                (String key, dynamic value) =>
                    MapEntry(advanceColourFromEnColourName(key), value as int))
            as Map<AdvanceColour, int>,
      );

  Map<String, dynamic> toJson() => {
        'advance': advance.key.name,
        'additionalCredits': additionalCredits
            .map((key, value) => MapEntry(key.enColourName, value)),
      };
}
