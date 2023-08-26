import 'package:mega_empires_assistant/data/trade_goods.dart';
import 'package:mega_empires_assistant/game/game.dart';

final List<TradeGood> allTradeGoods = [
  TradeGood.treasuryToken,

  TradeGood(title: "Water", baseValue: 0, max: 99999),

  TradeGood(game: Game.western, title: "Ochre", baseValue: 1, max: 9),
  TradeGood(game: Game.eastern, title: "Flax", baseValue: 1, max: 9),
  TradeGood(game: Game.western, title: "Clay", baseValue: 1, max: 9),
  TradeGood(game: Game.eastern, title: "Hides", baseValue: 1, max: 9),
  TradeGood(
      game: Game.western,
      title: "Bone",
      baseValue: 1,
      max: 8,
      minPlayers: 9),

  // ---

  TradeGood(game: Game.western, title: "Papyri", baseValue: 2, max: 8),
  TradeGood(game: Game.eastern, title: "Stone", baseValue: 2, max: 8),
  TradeGood(game: Game.western, title: "Iron", baseValue: 2, max: 8),
  TradeGood(game: Game.eastern, title: "Furs", baseValue: 2, max: 8),
  TradeGood(
      game: Game.western,
      title: "Wax",
      baseValue: 2,
      max: 8,
      minPlayers: 9),

  // ---

  TradeGood(game: Game.western, title: "Fish", baseValue: 3, max: 8),
  TradeGood(game: Game.eastern, title: "Timber", baseValue: 3, max: 8),
  TradeGood(game: Game.western, title: "Fruit", baseValue: 3, max: 9),
  TradeGood(game: Game.eastern, title: "Salt", baseValue: 3, max: 9),
  TradeGood(
      game: Game.western,
      title: "Ceramics",
      baseValue: 3,
      max: 8,
      minPlayers: 9),

  // ---

  TradeGood(game: Game.western, title: "Wool", baseValue: 4, max: 7),
  TradeGood(game: Game.eastern, title: "Cotton", baseValue: 4, max: 7),
  TradeGood(game: Game.western, title: "Oil", baseValue: 4, max: 8),
  TradeGood(game: Game.eastern, title: "Sugar", baseValue: 4, max: 8),
  TradeGood(
      game: Game.western,
      title: "Grain",
      baseValue: 4,
      max: 8,
      minPlayers: 9),

  // ---

  TradeGood(game: Game.western, title: "Wine", baseValue: 5, max: 6),
  TradeGood(game: Game.eastern, title: "Lacquer", baseValue: 5, max: 6),
  TradeGood(game: Game.western, title: "Textiles", baseValue: 5, max: 7),
  TradeGood(game: Game.eastern, title: "Livestock", baseValue: 5, max: 7),
  TradeGood(
      game: Game.western,
      title: "Glass",
      baseValue: 5,
      max: 6,
      minPlayers: 9),

  // ---

  TradeGood(game: Game.western, title: "Tin", baseValue: 6, max: 5),
  TradeGood(game: Game.eastern, title: "Silver", baseValue: 6, max: 5),
  TradeGood(game: Game.western, title: "Copper", baseValue: 6, max: 6),
  TradeGood(game: Game.eastern, title: "Bronze", baseValue: 6, max: 6),
  TradeGood(
      game: Game.western,
      title: "Lead",
      baseValue: 6,
      max: 6,
      minPlayers: 9),

  // ---

  TradeGood(game: Game.western, title: "Resin", baseValue: 7, max: 5),
  TradeGood(game: Game.eastern, title: "Jade", baseValue: 7, max: 5),
  TradeGood(game: Game.western, title: "Incense", baseValue: 7, max: 6),
  TradeGood(game: Game.eastern, title: "Spice", baseValue: 7, max: 6),
  TradeGood(
      game: Game.western,
      title: "Herbs",
      baseValue: 7,
      max: 6,
      minPlayers: 9),

  // ---

  TradeGood(game: Game.western, title: "Marble", baseValue: 8, max: 4),
  TradeGood(game: Game.eastern, title: "Dye", baseValue: 8, max: 4),
  TradeGood(game: Game.western, title: "Gemstones", baseValue: 8, max: 5),
  TradeGood(game: Game.eastern, title: "Tea", baseValue: 8, max: 5),
  TradeGood(
      game: Game.western,
      title: "Obsidian",
      baseValue: 8,
      max: 4,
      minPlayers: 9),

  // ---
  TradeGood(game: Game.western, title: "Ivory", baseValue: 9, max: 4),
  TradeGood(game: Game.eastern, title: "Silk", baseValue: 9, max: 4),
  TradeGood(game: Game.western, title: "Gold", baseValue: 9, max: 5),
  TradeGood(game: Game.eastern, title: "Pearls", baseValue: 9, max: 5),
  TradeGood(
      game: Game.western,
      title: "Amber",
      baseValue: 9,
      max: 4,
      minPlayers: 9),
];

final Map<String, TradeGood> indexedTradeGoods = {
  for (var e in allTradeGoods) e.title: e
};
