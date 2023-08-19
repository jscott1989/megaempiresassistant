// TODO: Add support for this file...
final class Scenario {
  final String name;
  Set<String> advances;

  Scenario({required this.name, required this.advances}) {}
}

// We should show a selector for this if the short game is picked - it'll just preselect a group of advancements before starting
// the game - note that this is different for east + west and for the short game
// this is also different for expert scenario - find it in the rulebook
List<Scenario> allScenarios = [
  Scenario(
      name: "Coin & Commerce",
      advances: {"Cartography", "Law", "Coinage", "Music"}),
  Scenario(
      name: "Exploring the Deserts",
      advances: {"Engineering", "Universal Doctrine", "Deism", "Urbanism"}),
  Scenario(
      name: "Mystical Palaces",
      advances: {"Diplomacy", "Literacy", "Theocracy", "Mythology"}),
  Scenario(
      name: "Sacred Constructors",
      advances: {"Enlightenment", "Engineering", "Theocracy", "Empiricism"}),
  Scenario(
      name: "Early Merchants",
      advances: {"Trade Routes", "Calendar", "Monarchy", "Cloth Making"}),
  Scenario(
      name: "Cultural Heights",
      advances: {"Architecture", "Law", "Drama and Poetry", "Masonry"}),
  Scenario(
      name: "Spreading Knowledge",
      advances: {"Medicine", "Enlightenment", "Astronavigation", "Pottery"}),
  Scenario(name: "Conquering The Seas", advances: {
    "Naval Warfare",
    "Literacy",
    "Astronavigation",
    "Written Record"
  }),
  Scenario(
      name: "Emerging Empire",
      advances: {"Military", "Literacy", "Metal Working", "Mysticism"}),
];
