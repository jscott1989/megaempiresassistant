import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/data/calamity.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/data/purchased_advance.dart';
import 'package:mega_empires_assistant/game/advances.dart';
import 'package:mega_empires_assistant/game/calamity_modifiers.dart';

import 'advance_colour.dart';

/// An advance which can be purchased.
final class Advance {
  /// The name of the advance. Not localized so can be used as index.
  final AdvanceKey key;

  /// The name of the advance.
  final String title;

  /// The human-readable description of the advance.
  final String description;

  /// Any special abilities enabled by the advance.
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
  final List<CalamityModifier> positiveEffects;

  /// Negative effects on calamities enabled by purchasing the advance.
  final List<CalamityModifier> negativeEffects;

  /// A number of credits which can be distributed by the purchaser however they like
  final int optionalCredits;

  /// The number of cards you hand limit increases by by holding this advance
  final int handLimitModifier;

  Advance(
      {required this.colour1,
      this.colour2,
      required this.price,
      required this.key,
      required this.title,
      this.description = "",
      List<String>? specialAbilities,
      List<String>? notes,
      required this.points,
      required this.discounts,
      this.optionalCredits = 0,
      this.specificDiscount,
      this.handLimitModifier = 0})
      : specialAbilities = specialAbilities ?? [],
        notes = notes ?? [],
        positiveEffects = allModifiers
            .where((element) => element.advanceKey == key && element.isPositive)
            .toList(),
        negativeEffects = allModifiers
            .where(
                (element) => element.advanceKey == key && !element.isPositive)
            .toList();

  PurchasedAdvance purchase() {
    return PurchasedAdvance.of(this);
  }

  PurchasedAdvance purchasedAdvance(Map<AdvanceColour, int> additionalCredits) {
    return PurchasedAdvance.withAdditional(this, additionalCredits);
  }

  /// Generate a [BoxDecoration] showing the colour(s) of this [Advance]
  BoxDecoration boxDecoration() {
    if (colour2 == null) {
      return BoxDecoration(color: colour1.colour);
    }

    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [0.0, 0.49, 0.51, 1.0],
        colors: [
          colour1.colour,
          colour1.colour,
          colour2!.colour,
          colour2!.colour,
        ],
      ),
    );
  }

  /// Calculate the cost of the Advance given the current [GameState] not
  /// taking into account complex Advance effects.
  ///
  /// This only accounts for credits and specific discounts
  int calculateBasicModifiedCost(GameState state) {
    var cost = price;
    var discount1 = state.totalCredits[colour1] ?? 0;

    if (colour2 == null) {
      cost = cost - discount1;
    } else {
      var discount2 = state.totalCredits[colour2] ?? 0;
      cost -= max(discount1, discount2);
    }

    for (PurchasedAdvance purchasedAdvance in state.purchasedAdvances) {
      if (purchasedAdvance.advance.specificDiscount?.advanceKey == key) {
        cost -= purchasedAdvance.advance.specificDiscount!.amount;
      }
    }

    return max(cost, 0);
  }

  int calculateModifiedCostAccountingForAnatomy(GameState state) {
    final basicCost = calculateBasicModifiedCost(state);

    if (!state.advanceIsInCart(AdvanceKey.anatomy)) {
      if (key == AdvanceKey.anatomy) {
        Advance? mostExpensiveAdvance =
            state.mostExpensiveUnmodifiedGreenAdvanceInCartUnder100();
        if (mostExpensiveAdvance == null) {
          return basicCost;
        }

        return basicCost -
            mostExpensiveAdvance.calculateBasicModifiedCost(state);
      }
      return basicCost;
    }

    if (colour1 != AdvanceColour.green && colour2 != AdvanceColour.green ||
        price >= 100) {
      return basicCost;
    }

    Advance? mostExpensiveAdvance =
        state.mostExpensiveUnmodifiedGreenAdvanceInCartUnder100();

    if (state.advanceIsInCart(key)) {
      if (this == mostExpensiveAdvance) {
        return 0;
      }

      return basicCost;
    } else {
      // Advance is not in cart
      if (mostExpensiveAdvance == null) {
        return 0;
      }

      // This will allow me to pay for the most expensive on i have to get this one
      return min(basicCost,
          max(0, mostExpensiveAdvance.calculateBasicModifiedCost(state)));
    }
  }

  /// Calculate the cost of this Advance given the current [GameState]
  int calculateModifiedCost(GameState state) {
    // Starts with the calculation for Anatomy and applies Library
    int basicCost = calculateModifiedCostAccountingForAnatomy(state);

    if (!state.advanceIsInCart(AdvanceKey.library)) {
      if (key == AdvanceKey.library && state.advancesInCart.isNotEmpty) {
        Advance mostExpensiveAdvance =
            state.mostExpensiveAdvanceInCartExceptLibrary()!;
        return max(
            0,
            basicCost -
                min(
                    40,
                    mostExpensiveAdvance
                        .calculateModifiedCostAccountingForAnatomy(state)));
      }

      return basicCost;
    }

    Advance? mostExpensiveAdvance =
        state.mostExpensiveAdvanceInCartExceptLibrary();

    if (state.advanceIsInCart(key)) {
      if (mostExpensiveAdvance == this) {
        return max(0, basicCost - 40);
      }
      return basicCost;
    } else {
      // Advance is not in cart
      if (mostExpensiveAdvance == null) {
        return max(0, basicCost - 40);
      }
      var remainingDiscount = 40 -
          min(
              40,
              mostExpensiveAdvance
                  .calculateModifiedCostAccountingForAnatomy(state));
      return max(0, basicCost - remainingDiscount as int);
    }
  }
}

/// A discount for a specific future advance.
final class SpecificDiscount {
  /// The title of the advance to be discounted.
  final AdvanceKey advanceKey;

  /// The discount to apply.
  final int amount;

  SpecificDiscount(this.advanceKey, this.amount);

  Advance advance() {
    return allAdvances.firstWhere((element) => element.key == advanceKey);
  }
}
