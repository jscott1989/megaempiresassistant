import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/game/advances.dart';
import 'package:mega_empires_assistant/game/game.dart';
import 'package:mega_empires_assistant/game/trade_goods.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';

enum TradeGoodKey {
  treasuryToken,
  water,
  ochre,
  flax,
  clay,
  hides,
  bone,
  papyri,
  stone,
  iron,
  furs,
  wax,
  fish,
  timber,
  fruit,
  salt,
  ceramics,
  wool,
  cotton,
  oil,
  sugar,
  grain,
  wine,
  lacquer,
  textiles,
  livestock,
  glass,
  tin,
  silver,
  copper,
  bronze,
  lead,
  resin,
  jade,
  incense,
  spice,
  herbs,
  marble,
  dye,
  gemstones,
  tea,
  obsidian,
  ivory,
  silk,
  gold,
  pearls,
  amber
}

/// A trade good card
final class TradeGood {
  final Game game;

  final TradeGoodKey key;

  /// The title of the card
  final String title;
  final int baseValue;
  final int max;
  final int minPlayers;

  TradeGood(
      {this.game = Game.any,
      required this.key,
      required this.title,
      required this.baseValue,
      required this.max,
      this.minPlayers = 0});

  static TradeGood treasuryToken = TradeGood(
      key: TradeGoodKey.treasuryToken,
      title: S.current.treasuryToken,
      baseValue: 1,
      max: 9999);

  /// The value of the [TradeGood] in a particular count.
  int calculateValue(GameState state, int count) {
    if (this == treasuryToken) {
      if (miningIsPurchased(state)) {
        return count * 2;
      }
      return count;
    }
    return (count * count) * baseValue;
  }

  @override
  String toString() {
    return title;
  }
}

/// Calculate the total value not accounting for trade empire
int calculateTotalValueBasic(
    Map<TradeGood, int> tradeGoodCounts, GameState state) {
  int value = 0;

  for (TradeGood r in allTradeGoods) {
    int thisCount = tradeGoodCounts.containsKey(r) ? tradeGoodCounts[r]! : 0;
    value += r.calculateValue(state, thisCount);
  }

  return value;
}

/// Calculate the total value of all trade goods given game state
int calculateTotalValue(Map<TradeGood, int> tradeGoodCounts, GameState state) {
  int value = calculateTotalValueBasic(tradeGoodCounts, state);
  if (!tradeEmpireIsPurchased(state)) {
    return value;
  }

  tradeGoodCounts.forEach((good, count) {
    if (count > 0 && !(good == TradeGood.treasuryToken)) {
      int adjustedValue = calculateAdjustedValueWhenUsingTradeEmpire(
          tradeGoodCounts, good, state);

      if (adjustedValue > value) {
        value = adjustedValue;
      }
    }
  });

  return value;
}

/// Calculate the highest value of the given [tradeGoodCounts] if we use [good]
/// as another trade good type
int calculateAdjustedValueWhenUsingTradeEmpire(
    Map<TradeGood, int> tradeGoodCounts, TradeGood good, GameState state) {
  Map<TradeGood, int> counts = Map.of(tradeGoodCounts);
  counts[good] = counts[good]! - 1;

  int maxValue = 0;

  tradeGoodCounts.forEach((tradeGood, count) {
    if ((tradeGood != TradeGood.treasuryToken) &&
        tradeGood != good &&
        tradeGood.baseValue <= good.baseValue &&
        count > 0 &&
        count < tradeGood.max) {
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

/// True if Mining has been purchased
bool miningIsPurchased(GameState state) {
  return state.purchasedAdvances.any((e) => e.advance.key == AdvanceKey.mining);
}

/// True if Trade Empire has been purchased
bool tradeEmpireIsPurchased(GameState state) {
  return state.purchasedAdvances
      .any((e) => e.advance.key == AdvanceKey.tradeEmpire);
}
