import 'package:mega_empires_assistant/data/trade_goods.dart';
import 'package:mega_empires_assistant/game/game.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';

final List<TradeGood> allTradeGoods = [
  TradeGood.treasuryToken,

  TradeGood(
      key: TradeGoodKey.water,
      title: S.current.tradeGoodWater,
      baseValue: 0,
      max: 99999),

  TradeGood(
      key: TradeGoodKey.ochre,
      game: Game.western,
      title: S.current.tradeGoodOchre,
      baseValue: 1,
      max: 9),
  TradeGood(
      key: TradeGoodKey.flax,
      game: Game.eastern,
      title: S.current.tradeGoodFlax,
      baseValue: 1,
      max: 9),
  TradeGood(
      key: TradeGoodKey.clay,
      game: Game.western,
      title: S.current.tradeGoodClay,
      baseValue: 1,
      max: 9),
  TradeGood(
      key: TradeGoodKey.hides,
      game: Game.eastern,
      title: S.current.tradeGoodHides,
      baseValue: 1,
      max: 9),
  TradeGood(
      key: TradeGoodKey.bone,
      game: Game.western,
      title: S.current.tradeGoodBone,
      baseValue: 1,
      max: 8,
      minPlayers: 9),

  // ---

  TradeGood(
      key: TradeGoodKey.papyri,
      game: Game.western,
      title: S.current.tradeGoodPapyri,
      baseValue: 2,
      max: 8),
  TradeGood(
      key: TradeGoodKey.stone,
      game: Game.eastern,
      title: S.current.tradeGoodStone,
      baseValue: 2,
      max: 8),
  TradeGood(
      key: TradeGoodKey.iron,
      game: Game.western,
      title: S.current.tradeGoodIron,
      baseValue: 2,
      max: 8),
  TradeGood(
      key: TradeGoodKey.furs,
      game: Game.eastern,
      title: S.current.tradeGoodFurs,
      baseValue: 2,
      max: 8),
  TradeGood(
      key: TradeGoodKey.wax,
      game: Game.western,
      title: S.current.tradeGoodWax,
      baseValue: 2,
      max: 8,
      minPlayers: 9),

  // ---

  TradeGood(
      key: TradeGoodKey.fish,
      game: Game.western,
      title: S.current.tradeGoodFish,
      baseValue: 3,
      max: 8),
  TradeGood(
      key: TradeGoodKey.timber,
      game: Game.eastern,
      title: S.current.tradeGoodTimber,
      baseValue: 3,
      max: 8),
  TradeGood(
      key: TradeGoodKey.fruit,
      game: Game.western,
      title: S.current.tradeGoodFruit,
      baseValue: 3,
      max: 9),
  TradeGood(
      key: TradeGoodKey.salt,
      game: Game.eastern,
      title: S.current.tradeGoodSalt,
      baseValue: 3,
      max: 9),
  TradeGood(
      key: TradeGoodKey.ceramics,
      game: Game.western,
      title: S.current.tradeGoodCeramics,
      baseValue: 3,
      max: 8,
      minPlayers: 9),

  // ---

  TradeGood(
      key: TradeGoodKey.wool,
      game: Game.western,
      title: S.current.tradeGoodWool,
      baseValue: 4,
      max: 7),
  TradeGood(
      key: TradeGoodKey.cotton,
      game: Game.eastern,
      title: S.current.tradeGoodCotton,
      baseValue: 4,
      max: 7),
  TradeGood(
      key: TradeGoodKey.oil,
      game: Game.western,
      title: S.current.tradeGoodOil,
      baseValue: 4,
      max: 8),
  TradeGood(
      key: TradeGoodKey.sugar,
      game: Game.eastern,
      title: S.current.tradeGoodSugar,
      baseValue: 4,
      max: 8),
  TradeGood(
      key: TradeGoodKey.grain,
      game: Game.western,
      title: S.current.tradeGoodGrain,
      baseValue: 4,
      max: 8,
      minPlayers: 9),

  // ---

  TradeGood(
      key: TradeGoodKey.wine,
      game: Game.western,
      title: S.current.tradeGoodWine,
      baseValue: 5,
      max: 6),
  TradeGood(
      key: TradeGoodKey.lacquer,
      game: Game.eastern,
      title: S.current.tradeGoodLacquer,
      baseValue: 5,
      max: 6),
  TradeGood(
      key: TradeGoodKey.textiles,
      game: Game.western,
      title: S.current.tradeGoodTextiles,
      baseValue: 5,
      max: 7),
  TradeGood(
      key: TradeGoodKey.livestock,
      game: Game.eastern,
      title: S.current.tradeGoodLivestock,
      baseValue: 5,
      max: 7),
  TradeGood(
      key: TradeGoodKey.glass,
      game: Game.western,
      title: S.current.tradeGoodGlass,
      baseValue: 5,
      max: 6,
      minPlayers: 9),

  // ---

  TradeGood(
      key: TradeGoodKey.tin,
      game: Game.western,
      title: S.current.tradeGoodTin,
      baseValue: 6,
      max: 5),
  TradeGood(
      key: TradeGoodKey.silver,
      game: Game.eastern,
      title: S.current.tradeGoodSilver,
      baseValue: 6,
      max: 5),
  TradeGood(
      key: TradeGoodKey.copper,
      game: Game.western,
      title: S.current.tradeGoodCopper,
      baseValue: 6,
      max: 6),
  TradeGood(
      key: TradeGoodKey.bronze,
      game: Game.eastern,
      title: S.current.tradeGoodBronze,
      baseValue: 6,
      max: 6),
  TradeGood(
      key: TradeGoodKey.lead,
      game: Game.western,
      title: S.current.tradeGoodLead,
      baseValue: 6,
      max: 6,
      minPlayers: 9),

  // ---

  TradeGood(
      key: TradeGoodKey.resin,
      game: Game.western,
      title: S.current.tradeGoodResin,
      baseValue: 7,
      max: 5),
  TradeGood(
      key: TradeGoodKey.jade,
      game: Game.eastern,
      title: S.current.tradeGoodJade,
      baseValue: 7,
      max: 5),
  TradeGood(
      key: TradeGoodKey.incense,
      game: Game.western,
      title: S.current.tradeGoodIncense,
      baseValue: 7,
      max: 6),
  TradeGood(
      key: TradeGoodKey.spice,
      game: Game.eastern,
      title: S.current.tradeGoodSpice,
      baseValue: 7,
      max: 6),
  TradeGood(
      key: TradeGoodKey.herbs,
      game: Game.western,
      title: S.current.tradeGoodHerbs,
      baseValue: 7,
      max: 6,
      minPlayers: 9),

  // ---

  TradeGood(
      key: TradeGoodKey.marble,
      game: Game.western,
      title: S.current.tradeGoodMarble,
      baseValue: 8,
      max: 4),
  TradeGood(
      key: TradeGoodKey.dye,
      game: Game.eastern,
      title: S.current.tradeGoodDye,
      baseValue: 8,
      max: 4),
  TradeGood(
      key: TradeGoodKey.gemstones,
      game: Game.western,
      title: S.current.tradeGoodGemstones,
      baseValue: 8,
      max: 5),
  TradeGood(
      key: TradeGoodKey.tea,
      game: Game.eastern,
      title: S.current.tradeGoodTea,
      baseValue: 8,
      max: 5),
  TradeGood(
      key: TradeGoodKey.obsidian,
      game: Game.western,
      title: S.current.tradeGoodObsidian,
      baseValue: 8,
      max: 4,
      minPlayers: 9),

  // ---
  TradeGood(
      key: TradeGoodKey.ivory,
      game: Game.western,
      title: S.current.tradeGoodIvory,
      baseValue: 9,
      max: 4),
  TradeGood(
      key: TradeGoodKey.silk,
      game: Game.eastern,
      title: S.current.tradeGoodSilk,
      baseValue: 9,
      max: 4),
  TradeGood(
      key: TradeGoodKey.gold,
      game: Game.western,
      title: S.current.tradeGoodGold,
      baseValue: 9,
      max: 5),
  TradeGood(
      key: TradeGoodKey.pearls,
      game: Game.eastern,
      title: S.current.tradeGoodPearls,
      baseValue: 9,
      max: 5),
  TradeGood(
      key: TradeGoodKey.amber,
      game: Game.western,
      title: S.current.tradeGoodAmber,
      baseValue: 9,
      max: 4,
      minPlayers: 9),
];

final Map<TradeGoodKey, TradeGood> indexedTradeGoods = {
  for (var e in allTradeGoods) e.key: e
};
