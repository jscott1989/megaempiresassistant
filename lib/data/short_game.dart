import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/game/advances.dart';
import 'package:mega_empires_assistant/game/game.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';

enum ScenarioKey {
  coinAndCommerce,
  exploringTheDeserts,
  mysticalPlaces,
  sacredConstructors,
  earlyMerchants,
  culturalHeights,
  spreadingKnowledge,
  conqueringTheSeas,
  emergingEmpire
}

final class Scenario {
  final ScenarioKey key;
  final String name;
  Set<AdvanceKey> advances;

  Scenario({required this.key, required this.name, required this.advances});
}

final allScenarios = [
  Scenario(
      key: ScenarioKey.coinAndCommerce,
      name: S.current.scenarioCoinAndCommerce,
      advances: {
        AdvanceKey.cartography,
        AdvanceKey.law,
        AdvanceKey.coinage,
        AdvanceKey.music
      }),
  Scenario(
      key: ScenarioKey.exploringTheDeserts,
      name: S.current.scenarioExploringTheDeserts,
      advances: {
        AdvanceKey.engineering,
        AdvanceKey.universalDoctrine,
        AdvanceKey.deism,
        AdvanceKey.urbanism
      }),
  Scenario(
      key: ScenarioKey.mysticalPlaces,
      name: S.current.scenarioMysticalPalaces,
      advances: {
        AdvanceKey.diplomacy,
        AdvanceKey.literacy,
        AdvanceKey.theocracy,
        AdvanceKey.mythology
      }),
  Scenario(
      key: ScenarioKey.sacredConstructors,
      name: S.current.scenarioSacredConstructors,
      advances: {
        AdvanceKey.enlightenment,
        AdvanceKey.engineering,
        AdvanceKey.theocracy,
        AdvanceKey.empiricism
      }),
  Scenario(
      key: ScenarioKey.earlyMerchants,
      name: S.current.scenarioEarlyMerchants,
      advances: {
        AdvanceKey.tradeRoutes,
        AdvanceKey.calendar,
        AdvanceKey.monarchy,
        AdvanceKey.clothMaking
      }),
  Scenario(
      key: ScenarioKey.culturalHeights,
      name: S.current.scenarioCulturalHeights,
      advances: {
        AdvanceKey.architecture,
        AdvanceKey.law,
        AdvanceKey.dramaAndPoetry,
        AdvanceKey.masonry
      }),
  Scenario(
      key: ScenarioKey.spreadingKnowledge,
      name: S.current.scenarioSpreadingKnowledge,
      advances: {
        AdvanceKey.medicine,
        AdvanceKey.enlightenment,
        AdvanceKey.astronavigation,
        AdvanceKey.pottery
      }),
  Scenario(
      key: ScenarioKey.conqueringTheSeas,
      name: S.current.scenarioConqueringTheSeas,
      advances: {
        AdvanceKey.navalWarfare,
        AdvanceKey.literacy,
        AdvanceKey.astronavigation,
        AdvanceKey.writtenRecord
      }),
  Scenario(
      key: ScenarioKey.emergingEmpire,
      name: S.current.scenarioEmergingEmpire,
      advances: {
        AdvanceKey.military,
        AdvanceKey.literacy,
        AdvanceKey.metalWorking,
        AdvanceKey.mysticism
      }),
];

/// allScenarios indexed by key
final indexedScenarios = {for (var e in allScenarios) e.key: e};

final easternEmpires3Player = [
  ScenarioKey.coinAndCommerce,
  ScenarioKey.exploringTheDeserts,
  ScenarioKey.mysticalPlaces
];

final westernEmpires3Player = [
  ScenarioKey.coinAndCommerce,
  ScenarioKey.earlyMerchants,
  ScenarioKey.mysticalPlaces
];

final easternEmpires4Player = [
  ScenarioKey.coinAndCommerce,
  ScenarioKey.exploringTheDeserts,
  ScenarioKey.mysticalPlaces,
  ScenarioKey.sacredConstructors
];

final westernEmpires4Player = [
  ScenarioKey.coinAndCommerce,
  ScenarioKey.exploringTheDeserts,
  ScenarioKey.earlyMerchants,
  ScenarioKey.sacredConstructors
];

final easternEmpires5Player = [
  ScenarioKey.coinAndCommerce,
  ScenarioKey.sacredConstructors,
  ScenarioKey.exploringTheDeserts,
  ScenarioKey.earlyMerchants,
  ScenarioKey.mysticalPlaces,
];

final westernEmpires5Player = [
  ScenarioKey.conqueringTheSeas,
  ScenarioKey.sacredConstructors,
  ScenarioKey.coinAndCommerce,
  ScenarioKey.exploringTheDeserts,
  ScenarioKey.mysticalPlaces
];

final easternEmpires6Player = [
  ScenarioKey.coinAndCommerce,
  ScenarioKey.exploringTheDeserts,
  ScenarioKey.mysticalPlaces,
  ScenarioKey.sacredConstructors,
  ScenarioKey.earlyMerchants,
  ScenarioKey.culturalHeights
];

final westernEmpires6Player = [
  ScenarioKey.conqueringTheSeas,
  ScenarioKey.sacredConstructors,
  ScenarioKey.coinAndCommerce,
  ScenarioKey.exploringTheDeserts,
  ScenarioKey.mysticalPlaces,
  ScenarioKey.earlyMerchants
];

final easternEmpires7Player = [
  ScenarioKey.coinAndCommerce,
  ScenarioKey.exploringTheDeserts,
  ScenarioKey.mysticalPlaces,
  ScenarioKey.sacredConstructors,
  ScenarioKey.earlyMerchants,
  ScenarioKey.culturalHeights,
  ScenarioKey.spreadingKnowledge
];

final westernEmpires7Player = [
  ScenarioKey.conqueringTheSeas,
  ScenarioKey.sacredConstructors,
  ScenarioKey.coinAndCommerce,
  ScenarioKey.exploringTheDeserts,
  ScenarioKey.mysticalPlaces,
  ScenarioKey.earlyMerchants,
  ScenarioKey.spreadingKnowledge
];

final easternEmpires8Player = [
  ScenarioKey.conqueringTheSeas,
  ScenarioKey.sacredConstructors,
  ScenarioKey.exploringTheDeserts,
  ScenarioKey.mysticalPlaces,
  ScenarioKey.earlyMerchants,
  ScenarioKey.spreadingKnowledge,
  ScenarioKey.culturalHeights,
  ScenarioKey.coinAndCommerce
];

final westernEmpires8Player = [
  ScenarioKey.conqueringTheSeas,
  ScenarioKey.sacredConstructors,
  ScenarioKey.exploringTheDeserts,
  ScenarioKey.mysticalPlaces,
  ScenarioKey.earlyMerchants,
  ScenarioKey.spreadingKnowledge,
  ScenarioKey.emergingEmpire,
  ScenarioKey.culturalHeights
];

final any9PlayerPlus = [
  ScenarioKey.conqueringTheSeas,
  ScenarioKey.sacredConstructors,
  ScenarioKey.coinAndCommerce,
  ScenarioKey.exploringTheDeserts,
  ScenarioKey.earlyMerchants,
  ScenarioKey.spreadingKnowledge,
  ScenarioKey.culturalHeights,
  ScenarioKey.emergingEmpire,
  ScenarioKey.mysticalPlaces,
];

final scenarios = {
  3: {Game.eastern: easternEmpires3Player, Game.western: westernEmpires3Player},
  4: {Game.eastern: easternEmpires4Player, Game.western: westernEmpires4Player},
  5: {Game.eastern: easternEmpires5Player, Game.western: westernEmpires5Player},
  6: {Game.eastern: easternEmpires6Player, Game.western: westernEmpires6Player},
  7: {Game.eastern: easternEmpires7Player, Game.western: westernEmpires7Player},
  8: {Game.eastern: easternEmpires8Player, Game.western: westernEmpires8Player},
  9: {Game.eastern: any9PlayerPlus, Game.western: any9PlayerPlus}
};

List<Scenario> scenariosForState(GameState state) {
  final k = scenarios.containsKey(state.settings.numberOfPlayers)
      ? scenarios[state.settings.numberOfPlayers]
      : scenarios[9];

  return k![state.settings.games.first]!
      .map((e) => indexedScenarios[e]!)
      .toList();
}
