import 'package:mega_empires_assistant/data/purchased_advance.dart';

import 'advance_colour.dart';

/// An advance which can be purchased.
final class Advance {
  /// The name of the advance.
  ///
  /// This is also used as the key when indexing
  // TODO: Split into key and title - title can be localized
  final String title;

  /// The human-readable description of the advance.
  final String description;

  /// Any special abilities enabled by the advance.
  // TODO: Represent these as an object so we can prompt so people don't forget to use them
  final List<String> specialAbilities;

  /// Any additional things to note about this advance.
  final List<String> notes;

  /// The price of the advance.
  final int price;

  /// The colour of the advance.
  final AdvanceColour colour1;

  /// Optional: A second colour for the advance if this advance has two.
  final AdvanceColour? colour2;

  /// The points rewarded for purchasing the advance.
  final int points;

  /// Discounts given in each colour for purchasing the advance.
  final Map<AdvanceColour, int> discounts;

  /// Discounts to specific future advances given by purchasing the advance.
  final SpecificDiscount? specificDiscount;

  /// Positive effects on calamities enabled by purchasing the advance.
  final List<CalamityEffect> positiveEffects;

  /// Negative effects on calamities enabled by purchasing the advance.
  final List<CalamityEffect> negativeEffects;

  Advance(
      {required this.colour1,
      this.colour2,
      required this.price,
      required this.title,
      this.description = "",
      List<String>? specialAbilities,
      List<String>? notes,
      List<CalamityEffect>? positiveEffects,
      List<CalamityEffect>? negativeEffects,
      required this.points,
      required this.discounts,
      this.specificDiscount})
      : specialAbilities = specialAbilities ?? [],
        notes = notes ?? [],
        positiveEffects = positiveEffects ?? [],
        negativeEffects = negativeEffects ?? [];

  PurchasedAdvance purchase() {
    return PurchasedAdvance.of(this);
  }

  PurchasedAdvance purchasedAdvance(Map<AdvanceColour, int> additionalCredits) {
    return PurchasedAdvance.withAdditional(this, additionalCredits);
  }
}

/// A discount for a specific future advance.
final class SpecificDiscount {
  /// The title of the advance to be discounted.
  final String cardTitle;

  /// The discount to apply.
  final int amount;

  SpecificDiscount(this.cardTitle, this.amount);
}

/// A calamity effect modifier.
// TODO: We should be able to make these more powerful instead of strings - then we won't need to hard-code inside each calamity
final class CalamityEffect {
  /// The name of the calamity effected.
  final String calamityName;

  /// The change to the calamity rules enabled.
  final String effect;

  CalamityEffect(this.calamityName, this.effect);
}
