import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/data/purchased_advance.dart';
import 'package:mega_empires_assistant/screens/trade_goods.dart';

import '../data/advance.dart';
import '../data/advance_colour.dart';
import '../main.dart';


class Discount {
  final int amount;

  Discount({required this.amount});
}
// TODO: rework the discount thing so we get a list of discounts then resolve them - then the list can be presented for reasons

Widget createPopupMenu(
    {
      required Function advancementsPressed,
      required Function creditsPressed,
      required Function calamitiesPressed,
      required Function settingsPressed
    }) {
  return PopupMenuButton(
    icon: Icon(Icons.settings),
    onSelected: (option) {
      if (option == "advancements") {
        advancementsPressed();
      } else if (option == "credits") {
        creditsPressed();
      } else if (option == "calamities") {
        calamitiesPressed();
      } else if (option == "settings") {
        settingsPressed();
      }
    },
    itemBuilder: (BuildContext context) {
      return <PopupMenuEntry>[
        PopupMenuItem<String>(
            value: "advancements",
            child: Text("Edit Advances")
        ),
        PopupMenuItem<String>(
            value: "credits",
            child: Text("Edit Credits")
        ),
        PopupMenuItem<String>(
            value: "calamities",
            child: Text("View Calamities")
        ),
        PopupMenuItem<String>(
            value: "settings",
            child: Text("Settings")
        )
      ];
    },
  );
}

BoxDecoration boxDecorationForAdvance(Advance advance) {
  if (advance.colour2 == null) {
    return new BoxDecoration(color: advance.colour1.colour);
  }

  return new BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 0.49, 0.51, 1.0],
      colors: [
        advance.colour1.colour,
        advance.colour1.colour,
        advance.colour2!.colour,
        advance.colour2!.colour,
      ],
    ),
  );
}

int calculateTotalValueBasic(Map<TradeGood, int> tradeGoodCounts, GameState state) {
  int value = 0;

  for (TradeGood r in allTradeGoods) {
    int thisCount = tradeGoodCounts.containsKey(r) ? tradeGoodCounts[r]! : 0;
    value += r.calculateValue(state, thisCount);
  }

  return value;
}

int calculateTotalValue(Map<TradeGood, int> tradeGoodCounts, GameState state) {
  int value = calculateTotalValueBasic(tradeGoodCounts, state);
  if (!tradeEmpireIsPurchased(state)) {
    return value;
  }

  tradeGoodCounts.forEach((good, count) {
    if (count > 0 && !good.isTreasuryToken) {
      int adjustedValue = calculateAdjustedValue(tradeGoodCounts, good, state);

      if (adjustedValue > value) {
        value = adjustedValue;
      }
    }
  });

  return value;
}

int calculateAdjustedValue(Map<TradeGood, int> tradeGoodCounts, TradeGood good, GameState state) {
  Map<TradeGood, int> counts = Map.of(tradeGoodCounts);
  counts[good] = counts[good]! - 1;

  int maxValue = 0;

  tradeGoodCounts.forEach((tradeGood, count) {
    if (!tradeGood.isTreasuryToken && tradeGood != good && tradeGood.baseValue <= good.baseValue && count > 0 && count < tradeGood.max) {
      counts[tradeGood] = counts[tradeGood]! + 1;

      int adjustedValue = calculateTotalValueBasic(counts, state);

      if (adjustedValue > maxValue) {
        maxValue = adjustedValue;
      }

      counts[tradeGood] = counts[tradeGood]! - 1;
    }
  });

  return maxValue;
}

int calculateModifiedCostBasic(Advance advance, GameState state) {
  var cost = advance.price;
  var discount1 = state.totalCredits[advance.colour1] ?? 0;

  if (advance.colour2 == null) {
    cost = cost - discount1;
  } else {
    var discount2 = state.totalCredits[advance.colour2] ?? 0;
    cost -= max(discount1, discount2);
  }

  for (PurchasedAdvance purchasedAdvance in state.purchasedAdvances) {
    if (purchasedAdvance.advance.specificDiscount?.cardTitle == advance.title) {
      cost -= purchasedAdvance.advance.specificDiscount!.amount;
    }
  }

  return max(cost, 0);
}

int calculateModifiedCostAnatomy(Advance advance, GameState state) {
  int basicCost = calculateModifiedCostBasic(advance, state);

  if (!anatomyIsInCart(state)) {
    if (advance.title == "Anatomy") {
      Advance? mostExpensiveAdvance = mostExpensiveUnmodifiedGreenAdvanceInCartUnder100(state);
      if (mostExpensiveAdvance == null) {
        return basicCost;
      }

      return basicCost - calculateModifiedCostBasic(mostExpensiveAdvance, state);
    }
    return basicCost;
  }

  if (advance.colour1 != AdvanceColour.green && advance.colour2 != AdvanceColour.green || advance.price >= 100) {
    return basicCost;
  }

  Advance? mostExpensiveAdvance = mostExpensiveUnmodifiedGreenAdvanceInCartUnder100(state);

  if (advanceIsInCart(advance, state)) {
    if (advance == mostExpensiveAdvance) {
      return 0;
    }

    return basicCost;
  } else {
    // Advance is not in cart
    if (mostExpensiveAdvance == null) {
      return 0;
    }

    // This will allow me to pay for the most expensive on i have to get this one
    return min(basicCost, max(0, calculateModifiedCostBasic(mostExpensiveAdvance, state)));
  }
}

int calculateModifiedCostLibrary(Advance advance, GameState state) {
  int basicCost = calculateModifiedCostAnatomy(advance, state);

  if (!libraryIsInCart(state)) {
    if (advance.title == "Library" && state.advancesInCart.isNotEmpty) {
      Advance mostExpensiveAdvance = mostExpensiveAdvanceInCartExceptLibrary(state)!;
      return max(0, basicCost - min(40, calculateModifiedCostAnatomy(mostExpensiveAdvance, state)));
    }

    return basicCost;
  }

  Advance? mostExpensiveAdvance = mostExpensiveAdvanceInCartExceptLibrary(state);

  if (advanceIsInCart(advance, state)) {
    if (mostExpensiveAdvance == advance) {
      return max(0, basicCost - 40);
    }
    return basicCost;
  } else {
    // Advance is not in cart
    if (mostExpensiveAdvance == null) {
      return max(0, basicCost - 40);
    }
    var remainingDiscount = 40 - min(40, calculateModifiedCostAnatomy(mostExpensiveAdvance, state));
    return max(0, basicCost - remainingDiscount as int);
  }
}

int calculateModifiedCost(Advance advance, GameState state) {
  return calculateModifiedCostLibrary(advance, state);
}

bool isLibrary(PurchasedAdvance advance) {
  return advance.advance.title == "Library";
}

bool isAnatomy(PurchasedAdvance advance) {
  return advance.advance.title == "Anatomy";
}

bool isTradeEmpire(PurchasedAdvance advance) {
  return advance.advance.title == "Trade Empire";
}

bool libraryIsInCart(GameState state) {
  return state.advancesInCart.any(isLibrary);
}

bool anatomyIsInCart(GameState state) {
  return state.advancesInCart.any(isAnatomy);
}

bool advanceIsInCart(Advance advance, GameState state) {
  return state.advancesInCart.any((advanceInCart) {
    return advanceInCart.advance == advance;
  });
}

bool tradeEmpireIsPurchased(GameState state) {
  return state.purchasedAdvances.any(isTradeEmpire);
}

Advance? mostExpensiveAdvanceInCartExceptLibrary(GameState state) {
  if (state.advancesInCart.isEmpty || (state.advancesInCart.length == 1 && state.advancesInCart.any(isLibrary))) {
    return null;
  }

  return state.advancesInCart.reduce((a1, a2) {
    if (a1.advance.title == "Library") {
      return a2;
    }
    if (a2.advance.title == "Library") {
      return a1;
    }

    if (calculateModifiedCostAnatomy(a1.advance, state) > calculateModifiedCostAnatomy(a2.advance, state)) {
      return a1;
    }
    return a2;
  }).advance;
}

Advance? mostExpensiveUnmodifiedGreenAdvanceInCartUnder100(GameState state) {
  if (state.advancesInCart.isEmpty) {
    return null;
  }

  PurchasedAdvance advance = state.advancesInCart.reduce((a1, a2) {
    if ((a1.advance.colour1 != AdvanceColour.green && a1.advance.colour2 != AdvanceColour.green) || (a1.advance.price >= 100)) {
      return a2;
    }
    if ((a2.advance.colour1 != AdvanceColour.green && a2.advance.colour2 != AdvanceColour.green) || (a2.advance.price >= 100)) {
      return a1;
    }

    if (a1.advance.price > a2.advance.price) {
      return a1;
    }
    return a2;
  });

  if ((advance.advance.colour1 != AdvanceColour.green && advance.advance.colour2 != AdvanceColour.green) || (advance.advance.price >= 100)) {
    return null;
  }

  return advance.advance;
}

int calculateTotalCost(GameState state) {
  return state.advancesInCart.fold(0, (a, b) => a + calculateModifiedCost(b.advance, state));
}