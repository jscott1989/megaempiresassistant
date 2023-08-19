import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/main.dart';

// TODO: When playing mega empires - for non tradeables: calamity beneficiaries + secondaries must be from their own block - maybe add that to the text?

//Players cannot be selected as a secondary victim of a calamity if, during the same game turn, they:
// • are also the primary victim of a calamity of the same name;
// • have been selected as the secondary victim of a calamity of the same name;
// • are the beneficiary of a calamity with the same name.

enum CalamityType {
  MINOR, TRADEABLE, NONTRADEABLE
}

class CalamityModifier {
  bool isPositive;
  String advance;
  String description;

  CalamityModifier(this.isPositive, this.advance, this.description);
}

class Calamity {
  int value;
  Function title;
  CalamityType type;
  Function description;
  List<CalamityModifier> modifiers;

  Calamity(this.value, this.title, this.type, this.description, this.modifiers);
}

var ALL_CALAMITIES = [
  Calamity(2, (GameState state) { return "Tempest"; }, CalamityType.MINOR, (GameState state){ return "Take 2 damage in total from coastal areas of your choice and lose 5 treasury tokens.";}, []),
  Calamity(2, (GameState state) { return "Volcanic Eruption/Earthquake"; }, CalamityType.NONTRADEABLE, (GameState state){
    var hasPurchasedEngineering = false;

    String cityAction = hasPurchasedEngineering ? "reduce" : "destroy";

    String desc = "If you have a city in an area with a volcano: destroy all units (irrespective of ownership) in the area(s) touched by the volcano. If you have cities in more than 1 area with a volcano, select 1 volcano that would affect the most of your unit points.\n\n";
    desc += "Otherwise: select and " + cityAction + " 1 of your cities and select and reduce 1 city adjacent by land or water (irrespective of ownership)";
    return desc;
  }, [
    CalamityModifier(true, "Engineering", "In the case of an Earthquake, your city is reduced rather than destroyed")
  ]),
  Calamity(2, (GameState state) { return "Treachery"; }, CalamityType.TRADEABLE, (GameState state){
    var hasPurchasedDiplomacy = false;

    int cities = hasPurchasedDiplomacy ? 2 : 1;

    String desc = "The beneficiary selects and annexes " + cities.toString() + " of your cities.";
    return desc;
  }, [
    CalamityModifier(false, "Diplomacy", "The beneficiary selects and annexes 1 additional city")
  ]),

  // ---

  Calamity(3, (GameState state) { return "Squandered Wealth"; }, CalamityType.MINOR, (GameState state){ return "Lose 10 treasury tokens.";}, []),
  Calamity(3, (GameState state) { return "Famine"; }, CalamityType.NONTRADEABLE, (GameState state){
    var hasPurchasedAgriculture = false;
    var hasPurchasedPottery = false;
    var hasPurchasedCalendar = false;

    int primaryDamage = 10;
    int secondaryDamage = 5;
    if (hasPurchasedAgriculture) primaryDamage += 5;
    if (hasPurchasedPottery) {
      primaryDamage -= 5;
      secondaryDamage -= 5;
    }
    if (hasPurchasedCalendar) {
      primaryDamage -= 5;
      secondaryDamage -= 5;
    }

    String player = (state.settings.numberOfPlayers < 5) ? "another player" : "each of 3 players";

    String desc = "Primary victim: Take " + primaryDamage.toString() + " damage and assign 5 damage to " + player + " of your choice\n\n";
    desc += "Secondary victim: Take " + secondaryDamage.toString() + " damage.";
    return desc;
  }, [
    CalamityModifier(false, "Agriculture", "Primary victim: take 5 additional damage"),
    CalamityModifier(true, "Pottery", "prevent 5 damage"),
    CalamityModifier(true, "Calendar", "prevent 5 damage"),
  ]),
  Calamity(3, (GameState state) { return "Slave Revolt"; }, CalamityType.TRADEABLE, (GameState state){
    var hasPurchasedMythology = false;
    var hasPurchasedEnlightenment = false;
    var hasPurchasedMining = false;
    var hasPurchasedCulturalAscendancy = false;

    int supportRate = hasPurchasedCulturalAscendancy ? 3 : 2;

    supportRate += 2;

    if (hasPurchasedMythology) supportRate -= 1;
    if (hasPurchasedEnlightenment) supportRate -= 1;
    if (hasPurchasedMining) supportRate += 1;

    String desc = "Your city support rate is " + supportRate.toString() + " during the resolution of Slave Revolt. Perform a check for city support and reduce cities until you have sufficient support.";
    return desc;
  }, [
    CalamityModifier(true, "Mythology", "Your city support rate is decreased by 1 during the resolution of Slave Revolt"),
    CalamityModifier(true, "Enlightenment", "Your city support rate is decreased by 1 during the resolution of Slave Revolt"),
    CalamityModifier(false, "Mining", "Your city support rate is increased by 1 during the resolution of Slave Revolt"),
  ]),

  // ---

  Calamity(4, (GameState state) { return "City Riots"; }, CalamityType.MINOR, (GameState state){ return "Reduce 1 of your cities and lose 5 treasury tokens.";}, []),
  Calamity(4, (GameState state) {
      if (state.settings.numberOfPlayers < 5 && state.settings.games.contains(Game.EASTERN)) {
        return "Flood/Avalanche";
      } else {
        return "Flood";
      }
  }, CalamityType.NONTRADEABLE, (GameState state){
    var hasPurchasedEngineering = false;

    int primaryDamage = hasPurchasedEngineering ? 10 : 15;
    int secondaryDamage = hasPurchasedEngineering ? 0 : 5;

    String target = (state.settings.numberOfPlayers < 5 && state.settings.games.contains(Game.EASTERN)) ? "coastal areas or areas in or adjacent to Western Himalaya": "coastal areas of your choice";

    String desc = "Primary victim: If you have any units on a flood plain: take " + primaryDamage.toString() + " damage on the flood plain. Select the flood plain where most of your units would be affected. All other players on the flood plain take 5 damage on that flood plain.\nIf you have no units on a flood plain, take 5 damage in total from " + target + " instead.\n\n";
    desc += "Secondary victim: Take " + secondaryDamage.toString() + " damage on the flood plain.";
    return desc;
  }, [
    CalamityModifier(true, "Engineering", "Prevent 5 damage"),
  ]),
  Calamity(4, (GameState state) { return "Superstition"; }, CalamityType.TRADEABLE, (GameState state){
    var hasPurchasedMysticism = false;
    var hasPurchasedDeism = false;
    var hasPurchasedEnlightenment = false;
    var hasPurchasedUniversalDoctrine = false;

    int cities = 3;

    if (hasPurchasedMysticism) cities--;
    if (hasPurchasedDeism) cities--;
    if (hasPurchasedEnlightenment) cities--;
    if (hasPurchasedUniversalDoctrine) cities++;

    String desc = "Reduce " + cities.toString() + " of your cities.";
    return desc;
  }, [
    CalamityModifier(true, "Mysticism", "Reduce 1 less city"),
    CalamityModifier(true, "Deism", "Reduce 1 less city"),
    CalamityModifier(true, "Enlightenment", "Reduce 1 less city"),
    CalamityModifier(false, "Universal Doctrine", "Reduce 1 additional city"),
  ]),

  // ---

  Calamity(5, (GameState state) { return "City In Flames"; }, CalamityType.MINOR, (GameState state){ return "Destroy 1 of your cities. You may choose to pay 10 treasury tokens to prevent this.";}, []),
  Calamity(5, (GameState state) { return "Civil War"; }, CalamityType.NONTRADEABLE, (GameState state){
    var hasPurchasedMusic = false;
    var hasPurchasedDramaAndPoetry = false;
    var hasPurchasedDemocracy = false;
    var hasPurchasedPhilosophy = false;
    var hasPurchasedMilitary = false;

    int allBut = 35;

    if (hasPurchasedMusic) allBut += 5;
    if (hasPurchasedDramaAndPoetry) allBut += 5;
    if (hasPurchasedDemocracy) allBut += 10;
    if (hasPurchasedPhilosophy) allBut -= 5;
    if (hasPurchasedMilitary) allBut -= 5;

    String desc = "Select all but " + allBut.toString() + " of your unit points. The beneficiary anexes all selected units.";
    return desc;
  }, [
    CalamityModifier(true, "Music", "Select 5 less unit points"),
    CalamityModifier(true, "Drama And Poetry", "Select 5 less unit points"),
    CalamityModifier(true, "Democracy", "Select 10 less unit points"),
    CalamityModifier(false, "Philosophy", "Select 5 additional unit points"),
    CalamityModifier(false, "Military", "Select 5 additional unit points"),
  ]),
  Calamity(5, (GameState state) { return "Barbarian Hordes"; }, CalamityType.TRADEABLE, (GameState state){
    var hasPurchasedMonarchy = false;
    var hasPurchasedPolitics = false;
    var hasPurchasedProvincialEmpire = false;

    int barbarianTokens = 15;

    if (hasPurchasedMonarchy) barbarianTokens -= 5;
    if (hasPurchasedPolitics) barbarianTokens += 5;
    if (hasPurchasedProvincialEmpire) barbarianTokens += 5;

    String desc = "The beneficiary selects 1 of your cities (if possible a wilderness city), which is attacked by " + barbarianTokens.toString() + " barbarian tokens.";
    return desc;
  }, [
    CalamityModifier(true, "Monarchy", "5 less barbarian tokens are used"),
    CalamityModifier(false, "Politics", "5 additional barbarian tokens are used"),
    CalamityModifier(false, "Provincial Empire", "5 additional barbarian tokens are used"),
  ]),

  // ---

  Calamity(6, (GameState state) { return "Tribal Conflict"; }, CalamityType.MINOR, (GameState state){ return "Take 5 damage.";}, []),
  Calamity(6, (GameState state) {
    if (state.settings.numberOfPlayers < 5 && state.settings.games.contains(Game.EASTERN)) {
      return "Cyclone/Blizzard";
    } else {
      return "Cyclone";
    }}, CalamityType.NONTRADEABLE, (GameState state){
    var hasPurchasedTradeEmpire = false;
    var hasPurchasedMasonry = false;
    var hasPurchasedCalendar = false;

    int citiesToSelect = 3;

    String potentialAreas = "the open sea area";

    if (state.settings.numberOfPlayers < 5) {
      citiesToSelect -= 1;

      if (state.settings.games.contains(Game.EASTERN)) {
        potentialAreas = "the open sea area or Western Himalaya";
      }
    }

    if (hasPurchasedTradeEmpire) citiesToSelect++;
    if (hasPurchasedMasonry) citiesToSelect--;
    if (hasPurchasedCalendar) citiesToSelect-= 2;

    String desc = "Primary: Select " + potentialAreas + " that has the largest number of your cities in areas directly adjacent to it. Select and reduce " + citiesToSelect.toString() + " of these cities.\n\n";
    desc += "Secondary: Select and reduce " + (citiesToSelect - 1).toString() + " cities adjacent to the selected area";

    if (state.settings.numberOfPlayers < 5 && state.settings.games.contains(Game.EASTERN)) {
      desc += "\n\nAny population tokens on Western Himalaya are unaffected by Cyclone/Blizzard.";
    }

    return desc;
  }, [
    CalamityModifier(false, "Trade Empire", "Select 1 additional city"),
    CalamityModifier(true, "Masonry", "Deselect 1 selected city"),
    CalamityModifier(true, "Calendar", "Deselect 2 selected cities"),
  ]),
  Calamity(6, (GameState state) { return "Epidemic"; }, CalamityType.TRADEABLE, (GameState state){
    var hasPurchasedMedicine = false;
    var hasPurchasedEnlightenment = false;
    var hasPurchasedAnatomy = false;
    var hasPurchasedRoadBuilding = false;
    var hasPurchasedTradeEmpire = false;

    int primaryDamage = 15;
    int secondaryDamage = 10;

    if (hasPurchasedMedicine) {
      primaryDamage -= 5;
      secondaryDamage -= 5;
    }
    if (hasPurchasedEnlightenment) {
      primaryDamage -= 5;
    }
    if (hasPurchasedAnatomy) {
      secondaryDamage -= 5;
    }
    if (hasPurchasedRoadBuilding) {
      primaryDamage += 5;
    }
    if (hasPurchasedTradeEmpire) {
      primaryDamage += 5;
    }

    String secondaryVictims = (state.settings.numberOfPlayers < 5) ? "1 other player" : "2 other players";

    String desc = "Primary: Take " + primaryDamage.toString() + " damage and select " + secondaryVictims + " that must take 10 damage as well\n\n";
    desc += "Secondary: Take " + secondaryDamage.toString() + " damage";
    return desc;
  }, [
    CalamityModifier(true, "Medicine", "Prevent 5 damage"),
    CalamityModifier(true, "Enlightenment", "If you are the primary victim, prevent 5 damage"),
    CalamityModifier(true, "Anatomy", "If you are the secondary victim, prevent 5 damage"),
    CalamityModifier(false, "Roadbuilding", "If you are the primary victim, take 5 additional damage"),
    CalamityModifier(false, "Trade Empire", "If you are the primary victim, take 5 additional damage"),
  ]),

  // ---

  Calamity(7, (GameState state) { return "Minor Uprising"; }, CalamityType.MINOR, (GameState state){ return "Destroy 1 of your cities.";}, []),
  Calamity(7, (GameState state) { return "Tyranny"; }, CalamityType.NONTRADEABLE, (GameState state){
    var hasPurchasedSculpture = false;
    var hasPurchasedLaw = false;
    var hasPurchasedMonarchy = false;
    var hasPurchasedProvincialEmpire = false;

    int unitPoints = 15;

    if (hasPurchasedSculpture) unitPoints -= 5;
    if (hasPurchasedLaw) unitPoints -= 5;
    if (hasPurchasedMonarchy) unitPoints += 5;
    if (hasPurchasedProvincialEmpire) unitPoints += 5;

    String desc = "The beneficiary selects and annexes " + unitPoints.toString() + " of your unit points";
    return desc;
  }, [
    CalamityModifier(true, "Sculpture", "The beneficiary selects and annexes 5 less unit points"),
    CalamityModifier(true, "Law", "The beneficiary selects and annexes 5 less unit points"),
    CalamityModifier(false, "Monarchy", "The beneficiary selects and annexes 5 additional unit points"),
    CalamityModifier(false, "Provincial Empire", "The beneficiary selects and annexes 5 additional unit points"),
  ]),
  Calamity(7, (GameState state) { return "Civil Disorder"; }, CalamityType.TRADEABLE, (GameState state){
    var hasPurchasedMusic = false;
    var hasPurchasedDramaAndPoetry = false;
    var hasPurchasedLaw = false;
    var hasPurchasedDemocracy = false;
    var hasPurchasedAdvancedMilitary = false;
    var hasPurchasedNavalWarfare = false;

    int citiesExemptFromReduction = 3;

    if (hasPurchasedMusic) citiesExemptFromReduction += 1;
    if (hasPurchasedDramaAndPoetry) citiesExemptFromReduction += 1;
    if (hasPurchasedLaw) citiesExemptFromReduction += 1;
    if (hasPurchasedDemocracy) citiesExemptFromReduction += 1;
    if (hasPurchasedAdvancedMilitary) citiesExemptFromReduction -= 1;
    if (hasPurchasedNavalWarfare) citiesExemptFromReduction -= 1;

    String desc = "Reduce all but " + citiesExemptFromReduction.toString() + " of your cities";
    return desc;
  }, [
    CalamityModifier(true, "Music", "Reduce 1 less city"),
    CalamityModifier(true, "Drama And Poetry", "Reduce 1 less city"),
    CalamityModifier(true, "Law", "Reduce 1 less city"),
    CalamityModifier(true, "Democracy", "Reduce 1 less city"),
    CalamityModifier(false, "Advanced Military", "Reduce 1 additional city"),
    CalamityModifier(false, "Naval Warfare", "Reduce 1 additional city"),
  ]),

  // ---

  Calamity(8, (GameState state) { return "Banditry"; }, CalamityType.MINOR, (GameState state){ return "Discard 2 commodity cards of your choice. For each card you must discard, you may choose to pay 4 treasury tokens to prevent it.";}, []),
  Calamity(8, (GameState state) { return "Corruption"; }, CalamityType.NONTRADEABLE, (GameState state){
    var hasPurchasedLaw = false;
    var hasPurchasedCoinage = false;
    var hasPurchasedWonderOfTheWorld = false;

    int targetValue = 10;

    if (hasPurchasedLaw) targetValue -= 5;
    if (hasPurchasedCoinage) targetValue += 5;
    if (hasPurchasedWonderOfTheWorld) targetValue += 5;

    String desc = "Discard commodity cards with a total face value (not set value) of at least " + targetValue.toString() + " points";
    return desc;
  }, [
    CalamityModifier(true, "Law", "Discard 5 less points of face value"),
    CalamityModifier(false, "Coinage", "Discard 5 additional points of face value"),
    CalamityModifier(false, "Wonder Of the World", "Discard 5 additional points of face value"),
  ]),
  Calamity(8, (GameState state) { return "Iconoclasm And Heresy"; }, CalamityType.TRADEABLE, (GameState state){
    var hasPurchasedPhilosophy = false;
    var hasPurchasedTheology = false;
    var hasPurchasedMonotheism = false;
    var hasPurchasedTheocracy = false;

    int primaryCitiesToReduce = 4;
    int secondaryCitiesToReduce = 1;

    if (hasPurchasedPhilosophy) primaryCitiesToReduce -= 2;
    if (hasPurchasedTheology) primaryCitiesToReduce -= 3;
    if (hasPurchasedMonotheism) {
      primaryCitiesToReduce += 1;
      secondaryCitiesToReduce += 1;
    }

    String secondaryVictims = (state.settings.numberOfPlayers < 5) ? "1 other player" : "2 other players";

    String desc = "Primary: Reduce " + primaryCitiesToReduce.toString() + " of your cities and select " + secondaryVictims + " to reduce 1 of their cities as well. The beneficiary may not be selected as a secondary victim";
    if (hasPurchasedTheocracy) {
      desc += ". you may choose to discard 2 commodity cards to prevent the city reduction effect for you";
    }

    desc += "\n\n";

    desc += "Secondary: Reduce " + secondaryCitiesToReduce.toString() + " of your cities";
    return desc;
  }, [
    CalamityModifier(true, "Philosophy", "Reduce 2 less cities"),
    CalamityModifier(true, "Theology", "Reduce 3 less cities"),
    CalamityModifier(false, "Monotheism", "Reduce 1 additional city"),
    CalamityModifier(true, "Theocracy", "You may choose to discard 2 commodity cards to prevent the city reduction effect for you"),
  ]),

  // ---

  Calamity(9, (GameState state) { return "Coastal Migration"; }, CalamityType.MINOR, (GameState state){ return "Destroy 1 of your coastal cities and lose 5 treasury tokens";}, []),
  Calamity(9, (GameState state) { return "Regression"; }, CalamityType.NONTRADEABLE, (GameState state){
    var hasPurchasedFundamentalism = false;
    var hasPurchasedLibrary = false;
    var hasPurchasedEnlightenment = false;

    int stepsToRegress = 1;

    if (hasPurchasedFundamentalism) stepsToRegress += 1;
    if (hasPurchasedLibrary) stepsToRegress -= 1;

    String desc = "Your succession marker on the A.S.T. is moved " + stepsToRegress.toString() + " steps backward";
    if (hasPurchasedEnlightenment) {
      desc += ". For each step backward, you may choose to prevent the effect by destroying 2 of your cities (if possible non-coastal)";
    }
    return desc;
  }, [
    CalamityModifier(false, "Fundamentalism", "Your marker is moved backward 1 additional step"),
    CalamityModifier(true, "Library", "Your marker is moved backward 1 less step"),
    CalamityModifier(true, "Enlightenment", "For each step backward, you may choose to prevent the effect by destroying 2 of your cities (if possible non-coastal)"),
  ]),
  Calamity(9, (GameState state) {
    if (state.settings.numberOfPlayers < 5 && state.settings.games.contains(Game.EASTERN)) {
      return "Piracy/Raid";
    } else {
      return "Piracy";
    }
     }, CalamityType.TRADEABLE, (GameState state){
    var hasPurchasedCartography = false;
    var hasPurchasedNavalWarfare = false;

    int coastalCities = 2;

    if (hasPurchasedCartography) coastalCities += 1;
    if (hasPurchasedNavalWarfare) coastalCities -= 1;

    String target = (state.settings.numberOfPlayers < 5 && state.settings.games.contains(Game.EASTERN)) ? "coastal areas or areas adjacent to Western Himalaya": "coastal areas";
    String secondaryVictims = (state.settings.numberOfPlayers < 5) ? "another player" : "each of 2 other players";

    String desc = "The beneficiary selects " + coastalCities.toString() + " of your cities in " + target + " and you select 1 city in " + target + " from " + secondaryVictims + ". All selected cities are replaced with pirate cities. The beneficiary may not be selected as a secondary victim";
    if (hasPurchasedNavalWarfare) {
      desc += ". You may not be selected as a secondary victim";
    }
    return desc;
  }, [
    CalamityModifier(false, "Cartography", "The beneficiary selects and replaces 1 additional coastal city"),
    CalamityModifier(true, "Naval Warfare", "The beneficiary selects and replaces 1 less coastal city. You may not be selected as a secondary victim"),
  ]),
];

class Calamities extends StatefulWidget {

  final GameState state;

  Calamities({Key? key, required this.state}) : super(key: key);

  @override
  _CalamitiesState createState() => _CalamitiesState();
}

class _CalamitiesState extends State<Calamities> {
  TextEditingController searchController = TextEditingController();

  List<Calamity> activeCalamities = [];
  var query = "";

  @override
  void initState() {
    super.initState();
    filterSearchResults("");
  }

  void refresh() {
    List<Calamity> searchResults = [];
    ALL_CALAMITIES.forEach((item) {
      if (!item.title(widget.state).toLowerCase().contains(query.toLowerCase())) {
        return;
      }
      if (item.type == CalamityType.MINOR) {
        if (widget.state.settings.numberOfPlayers < 9) {
          return;
        }

        if (widget.state.settings.numberOfPlayers > 11 && widget.state.settings.numberOfPlayers < 15) {
          return;
        }

      }

      searchResults.add(item);
    });

    setState(() {
      activeCalamities.clear();
      activeCalamities.addAll(searchResults);
    });
    return;
  }

  void filterSearchResults(String query) {
    this.query = query;
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text("Calamities")
            ),
            body: Container(
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      filterSearchResults(value);
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                        labelText: "Search",
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25.0)))),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: max(1, activeCalamities.length),
                    itemBuilder: (context, index) {
                      if (activeCalamities.isEmpty) {
                        return Text("No calamities match your query");
                      }
                      Calamity calamity = activeCalamities[index];
                      return CalamityListTile(
                          calamity: calamity,
                          state: widget.state
                      );
                    },
                  )
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ButtonBar(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new TextButton(
                              child: new Text('Continue'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        )
                      ],
                    )),
              ]),
            ));
  }
}

class CalamityListTile extends StatelessWidget {
  Calamity calamity;
  GameState state;

  CalamityListTile({required this.calamity, required this.state})
      : super(key: Key(calamity.title(state)));

  @override
  Widget build(BuildContext context) {
      return new Container(
          decoration: new BoxDecoration(color: Colors.blueGrey),
          child: new ListTile(
              title: new Text(calamity.value.toString() + " " + calamity.title(state)),
              subtitle: Text(calamity.type.name)));
  }
}
