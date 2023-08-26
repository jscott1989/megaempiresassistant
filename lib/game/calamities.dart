import 'package:mega_empires_assistant/data/calamity.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/game/advances.dart';
import 'package:mega_empires_assistant/game/game.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';

enum CalamityKey {
  slaveRevolt,
  superstition,
  regression,
  epidemic,
  iconoclasmAndHeresy,
  corruption,
  civilWar,
  piracy,
  famine,
  cyclone,
  barbarianHordes,
  tyranny,
  civilDisorder,
  treachery,
  volcanicEruptionEarthquake,
  flood,
  tempest,
  squanderedWealth,
  cityRiots,
  cityInFlames,
  tribalConflict,
  minorUprising,
  banditry,
  coastalMigration
}

final allCalamities = [
  Calamity(
      value: 2,
      key: CalamityKey.tempest,
      title: (GameState state) {
        return S.current.calamityNameTempest;
      },
      type: CalamityType.minor,
      description: (GameState state) {
        return S.current.calamityDescriptionTempest;
      }),
  Calamity(
      value: 2,
      key: CalamityKey.volcanicEruptionEarthquake,
      title: (GameState state) {
        return S.current.calamityNameVolcanicEruptionEarthquake;
      },
      type: CalamityType.nonTradeable,
      description: (GameState state) {
        final hasPurchasedEngineering =
            state.advanceIsPurchased(AdvanceKey.engineering);

        final cityAction = hasPurchasedEngineering
            ? S.current.reduceCity
            : S.current.destroyCity;

        return S.current
            .calamityDescriptionVolcanicEruptionEarthquake(cityAction);
      }),
  Calamity(
      value: 2,
      key: CalamityKey.treachery,
      title: (GameState state) {
        return S.current.calamityNameTreachery;
      },
      type: CalamityType.tradeable,
      description: (GameState state) {
        final hasPurchasedDiplomacy =
            state.advanceIsPurchased(AdvanceKey.diplomacy);

        final cities = hasPurchasedDiplomacy ? 2 : 1;

        return S.current.calamityDescriptionTreachery(cities);
      }),

  // ---

  Calamity(
      value: 3,
      key: CalamityKey.squanderedWealth,
      title: (GameState state) {
        return S.current.calamityNameSquanderedWealth;
      },
      type: CalamityType.minor,
      description: (GameState state) {
        return S.current.calamityDescriptionSquanderedWealth;
      }),
  Calamity(
      value: 3,
      key: CalamityKey.famine,
      title: (GameState state) {
        return S.current.calamityNameFamine;
      },
      type: CalamityType.nonTradeable,
      description: (GameState state) {
        final hasPurchasedAgriculture =
            state.advanceIsPurchased(AdvanceKey.agriculture);
        final hasPurchasedPottery =
            state.advanceIsPurchased(AdvanceKey.pottery);
        final hasPurchasedCalendar =
            state.advanceIsPurchased(AdvanceKey.calendar);

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

        final player = (state.settings.numberOfPlayers < 5)
            ? S.current.calamityDescriptionFamineAnotherPlayer
            : S.current.calamityDescriptionFamineEachOf3Players;

        return S.current
            .calamityDescriptionFamine(primaryDamage, secondaryDamage, player);
      }),
  Calamity(
      value: 3,
      key: CalamityKey.slaveRevolt,
      title: (GameState state) {
        return S.current.calamityNameSlaveRevolt;
      },
      type: CalamityType.tradeable,
      description: (GameState state) {
        final hasPurchasedMythology =
            state.advanceIsPurchased(AdvanceKey.mythology);
        final hasPurchasedEnlightenment =
            state.advanceIsPurchased(AdvanceKey.enlightenment);
        final hasPurchasedMining = state.advanceIsPurchased(AdvanceKey.mining);
        final hasPurchasedCulturalAscendancy =
            state.advanceIsPurchased(AdvanceKey.culturalAscendancy);

        int supportRate = hasPurchasedCulturalAscendancy ? 3 : 2;

        supportRate += 2;

        if (hasPurchasedMythology) supportRate -= 1;
        if (hasPurchasedEnlightenment) supportRate -= 1;
        if (hasPurchasedMining) supportRate += 1;

        return S.current.calamityDescriptionSlaveRevolt(supportRate);
      }),

  // ---

  Calamity(
      value: 4,
      key: CalamityKey.cityRiots,
      title: (GameState state) {
        return S.current.calamityNameCityRiots;
      },
      type: CalamityType.minor,
      description: (GameState state) {
        return S.current.calamityDescriptionCityRiots;
      }),
  Calamity(
      value: 4,
      key: CalamityKey.flood,
      title: (GameState state) {
        if (state.settings.numberOfPlayers < 5 &&
            state.settings.games.contains(Game.eastern)) {
          return S.current.calamityNameFloodAvalanche;
        } else {
          return S.current.calamityNameFlood;
        }
      },
      type: CalamityType.nonTradeable,
      description: (GameState state) {
        final hasPurchasedEngineering =
            state.advanceIsPurchased(AdvanceKey.engineering);

        final primaryDamage = hasPurchasedEngineering ? 10 : 15;
        final secondaryDamage = hasPurchasedEngineering ? 0 : 5;

        final target = (state.settings.numberOfPlayers < 5 &&
                state.settings.games.contains(Game.eastern))
            ? S.current.calamityDescriptionFloodAvalancheTarget
            : S.current.calamityDescriptionFloodTarget;

        return S.current
            .calamityDescriptionFlood(primaryDamage, secondaryDamage, target);
      }),
  Calamity(
      value: 4,
      key: CalamityKey.superstition,
      title: (GameState state) {
        return S.current.calamityNameSuperstition;
      },
      type: CalamityType.tradeable,
      description: (GameState state) {
        final hasPurchasedMysticism =
            state.advanceIsPurchased(AdvanceKey.mysticism);
        final hasPurchasedDeism = state.advanceIsPurchased(AdvanceKey.deism);
        final hasPurchasedEnlightenment =
            state.advanceIsPurchased(AdvanceKey.enlightenment);
        final hasPurchasedUniversalDoctrine =
            state.advanceIsPurchased(AdvanceKey.universalDoctrine);

        int cities = 3;

        if (hasPurchasedMysticism) cities--;
        if (hasPurchasedDeism) cities--;
        if (hasPurchasedEnlightenment) cities--;
        if (hasPurchasedUniversalDoctrine) cities++;

        return S.current.calamityDescriptionSuperstition(cities);
      }),

  // ---

  Calamity(
      value: 5,
      key: CalamityKey.cityInFlames,
      title: (GameState state) {
        return S.current.calamityNameCityInFlames;
      },
      type: CalamityType.minor,
      description: (GameState state) {
        return S.current.calamityDescriptionCityInFlames;
      }),
  Calamity(
      value: 5,
      key: CalamityKey.civilWar,
      title: (GameState state) {
        return S.current.calamityNameCivilWar;
      },
      type: CalamityType.nonTradeable,
      description: (GameState state) {
        final hasPurchasedMusic = state.advanceIsPurchased(AdvanceKey.music);
        final hasPurchasedDramaAndPoetry =
            state.advanceIsPurchased(AdvanceKey.dramaAndPoetry);
        final hasPurchasedDemocracy =
            state.advanceIsPurchased(AdvanceKey.democracy);
        final hasPurchasedPhilosophy =
            state.advanceIsPurchased(AdvanceKey.philosophy);
        final hasPurchasedMilitary =
            state.advanceIsPurchased(AdvanceKey.military);

        int allBut = 35;

        if (hasPurchasedMusic) allBut += 5;
        if (hasPurchasedDramaAndPoetry) allBut += 5;
        if (hasPurchasedDemocracy) allBut += 10;
        if (hasPurchasedPhilosophy) allBut -= 5;
        if (hasPurchasedMilitary) allBut -= 5;

        return S.current.calamityDescriptionCivilWar(allBut);
      }),
  Calamity(
      value: 5,
      key: CalamityKey.barbarianHordes,
      title: (GameState state) {
        return S.current.calamityNameBarbarianHordes;
      },
      type: CalamityType.tradeable,
      description: (GameState state) {
        final hasPurchasedMonarchy =
            state.advanceIsPurchased(AdvanceKey.monarchy);
        final hasPurchasedPolitics =
            state.advanceIsPurchased(AdvanceKey.politics);
        final hasPurchasedProvincialEmpire =
            state.advanceIsPurchased(AdvanceKey.provincialEmpire);

        int barbarianTokens = 15;

        if (hasPurchasedMonarchy) barbarianTokens -= 5;
        if (hasPurchasedPolitics) barbarianTokens += 5;
        if (hasPurchasedProvincialEmpire) barbarianTokens += 5;

        return S.current.calamityDescriptionBarbarianHordes(barbarianTokens);
      }),

  // ---

  Calamity(
      value: 6,
      key: CalamityKey.tribalConflict,
      title: (GameState state) {
        return S.current.calamityNameTribalConflict;
      },
      type: CalamityType.minor,
      description: (GameState state) {
        return S.current.calamityDescriptionTribalConflict;
      }),
  Calamity(
      value: 6,
      key: CalamityKey.cyclone,
      title: (GameState state) {
        if (state.settings.numberOfPlayers < 5 &&
            state.settings.games.contains(Game.eastern)) {
          return S.current.calamityNameCycloneBlizzard;
        } else {
          return S.current.calamityNameCyclone;
        }
      },
      type: CalamityType.nonTradeable,
      description: (GameState state) {
        final hasPurchasedTradeEmpire =
            state.advanceIsPurchased(AdvanceKey.tradeEmpire);
        final hasPurchasedMasonry =
            state.advanceIsPurchased(AdvanceKey.masonry);
        final hasPurchasedCalendar =
            state.advanceIsPurchased(AdvanceKey.calendar);

        int citiesToSelect = 3;

        String potentialAreas =
            S.current.calamityDescriptionCyclonePotentialAreas;

        if (state.settings.numberOfPlayers < 5) {
          citiesToSelect -= 1;

          if (state.settings.games.contains(Game.eastern)) {
            potentialAreas =
                S.current.calamityDescriptionCycloneBlizzardPotentialAreas;
          }
        }

        if (hasPurchasedTradeEmpire) citiesToSelect++;
        if (hasPurchasedMasonry) citiesToSelect--;
        if (hasPurchasedCalendar) citiesToSelect -= 2;

        final secondaryCitiesToSelect = citiesToSelect - 1;

        String desc = S.current.calamityDescriptionCyclone(
            potentialAreas, citiesToSelect, secondaryCitiesToSelect);

        if (state.settings.numberOfPlayers < 5 &&
            state.settings.games.contains(Game.eastern)) {
          desc += S.current.calamityDescriptionCycloneBlizzard;
        }

        return desc;
      }),
  Calamity(
      value: 6,
      key: CalamityKey.epidemic,
      title: (GameState state) {
        return S.current.calamityNameEpidemic;
      },
      type: CalamityType.tradeable,
      description: (GameState state) {
        final hasPurchasedMedicine =
            state.advanceIsPurchased(AdvanceKey.medicine);
        final hasPurchasedEnlightenment =
            state.advanceIsPurchased(AdvanceKey.enlightenment);
        final hasPurchasedAnatomy =
            state.advanceIsPurchased(AdvanceKey.anatomy);
        final hasPurchasedRoadBuilding =
            state.advanceIsPurchased(AdvanceKey.roadBuilding);
        final hasPurchasedTradeEmpire =
            state.advanceIsPurchased(AdvanceKey.tradeEmpire);

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

        final secondaryVictims = (state.settings.numberOfPlayers < 5)
            ? S.current.calamityDescriptionEpidemicSecondaryVictims1
            : S.current.calamityDescriptionEpidemicSecondaryVictims2;

        return S.current.calamityDescriptionEpidemic(
            primaryDamage, secondaryVictims, secondaryDamage);
      }),

  // ---

  Calamity(
      value: 7,
      key: CalamityKey.minorUprising,
      title: (GameState state) {
        return S.current.calamityNameMinorUprising;
      },
      type: CalamityType.minor,
      description: (GameState state) {
        return S.current.calamityDescriptionMinorUprising;
      }),
  Calamity(
      value: 7,
      key: CalamityKey.tyranny,
      title: (GameState state) {
        return S.current.calamityNameTyranny;
      },
      type: CalamityType.nonTradeable,
      description: (GameState state) {
        final hasPurchasedSculpture =
            state.advanceIsPurchased(AdvanceKey.sculpture);
        final hasPurchasedLaw = state.advanceIsPurchased(AdvanceKey.law);
        final hasPurchasedMonarchy =
            state.advanceIsPurchased(AdvanceKey.monarchy);
        final hasPurchasedProvincialEmpire =
            state.advanceIsPurchased(AdvanceKey.provincialEmpire);

        int unitPoints = 15;

        if (hasPurchasedSculpture) unitPoints -= 5;
        if (hasPurchasedLaw) unitPoints -= 5;
        if (hasPurchasedMonarchy) unitPoints += 5;
        if (hasPurchasedProvincialEmpire) unitPoints += 5;

        return S.current.calamityDescriptionTyranny(unitPoints);
      }),
  Calamity(
      value: 7,
      key: CalamityKey.civilDisorder,
      title: (GameState state) {
        return S.current.calamityNameCivilDisorder;
      },
      type: CalamityType.tradeable,
      description: (GameState state) {
        final hasPurchasedMusic = state.advanceIsPurchased(AdvanceKey.music);
        final hasPurchasedDramaAndPoetry =
            state.advanceIsPurchased(AdvanceKey.dramaAndPoetry);
        final hasPurchasedLaw = state.advanceIsPurchased(AdvanceKey.law);
        final hasPurchasedDemocracy =
            state.advanceIsPurchased(AdvanceKey.democracy);
        final hasPurchasedAdvancedMilitary =
            state.advanceIsPurchased(AdvanceKey.advancedMilitary);
        final hasPurchasedNavalWarfare =
            state.advanceIsPurchased(AdvanceKey.navalWarfare);

        int citiesExemptFromReduction = 3;

        if (hasPurchasedMusic) citiesExemptFromReduction += 1;
        if (hasPurchasedDramaAndPoetry) citiesExemptFromReduction += 1;
        if (hasPurchasedLaw) citiesExemptFromReduction += 1;
        if (hasPurchasedDemocracy) citiesExemptFromReduction += 1;
        if (hasPurchasedAdvancedMilitary) citiesExemptFromReduction -= 1;
        if (hasPurchasedNavalWarfare) citiesExemptFromReduction -= 1;

        return S.current
            .calamityDescriptionCivilDisorder(citiesExemptFromReduction);
      }),

  // ---

  Calamity(
      value: 8,
      key: CalamityKey.banditry,
      title: (GameState state) {
        return S.current.calamityNameBanditry;
      },
      type: CalamityType.minor,
      description: (GameState state) {
        return S.current.calamityDescriptionBanditry;
      }),
  Calamity(
      value: 8,
      key: CalamityKey.corruption,
      title: (GameState state) {
        return S.current.calamityNameCorruption;
      },
      type: CalamityType.nonTradeable,
      description: (GameState state) {
        final hasPurchasedLaw = state.advanceIsPurchased(AdvanceKey.law);
        final hasPurchasedCoinage =
            state.advanceIsPurchased(AdvanceKey.coinage);
        final hasPurchasedWonderOfTheWorld =
            state.advanceIsPurchased(AdvanceKey.wonderOfTheWorld);

        int targetValue = 10;

        if (hasPurchasedLaw) targetValue -= 5;
        if (hasPurchasedCoinage) targetValue += 5;
        if (hasPurchasedWonderOfTheWorld) targetValue += 5;

        return S.current.calamityDescriptionCorruption(targetValue);
      }),
  Calamity(
      value: 8,
      key: CalamityKey.iconoclasmAndHeresy,
      title: (GameState state) {
        return S.current.calamityNameIconoclasmAndHeresy;
      },
      type: CalamityType.tradeable,
      description: (GameState state) {
        final hasPurchasedPhilosophy =
            state.advanceIsPurchased(AdvanceKey.philosophy);
        final hasPurchasedTheology =
            state.advanceIsPurchased(AdvanceKey.theology);
        final hasPurchasedMonotheism =
            state.advanceIsPurchased(AdvanceKey.monotheism);
        final hasPurchasedTheocracy =
            state.advanceIsPurchased(AdvanceKey.theocracy);

        int primaryCitiesToReduce = 4;
        int secondaryCitiesToReduce = 1;

        if (hasPurchasedPhilosophy) primaryCitiesToReduce -= 2;
        if (hasPurchasedTheology) primaryCitiesToReduce -= 3;
        if (hasPurchasedMonotheism) {
          primaryCitiesToReduce += 1;
          secondaryCitiesToReduce += 1;
        }

        final secondaryVictims = (state.settings.numberOfPlayers < 5)
            ? S.current.calamityDescriptionIconoclasmAndHeresySecondaryVictims1
            : S.current.calamityDescriptionIconoclasmAndHeresySecondaryVictims2;

        String desc = S.current.calamityDescriptionIconoclasmAndHeresy(
            primaryCitiesToReduce, secondaryVictims);

        if (hasPurchasedTheocracy) {
          desc += S.current.calamityDescriptionIconoclasmAndHeresyTheocracy;
        }

        desc += "\n\n";

        desc += S.current.calamityDescriptionIconoclasmAndHeresySecondary(
            secondaryCitiesToReduce);
        return desc;
      }),

  // ---

  Calamity(
      value: 9,
      key: CalamityKey.coastalMigration,
      title: (GameState state) {
        return S.current.calamityNameCoastalMigration;
      },
      type: CalamityType.minor,
      description: (GameState state) {
        return S.current.calamityDescriptionCoastalMigration;
      }),
  Calamity(
      value: 9,
      key: CalamityKey.regression,
      title: (GameState state) {
        return S.current.calamityNameRegression;
      },
      type: CalamityType.nonTradeable,
      description: (GameState state) {
        final hasPurchasedFundamentalism =
            state.advanceIsPurchased(AdvanceKey.fundamentalism);
        final hasPurchasedLibrary =
            state.advanceIsPurchased(AdvanceKey.library);
        final hasPurchasedEnlightenment =
            state.advanceIsPurchased(AdvanceKey.enlightenment);

        int stepsToRegress = 1;

        if (hasPurchasedFundamentalism) stepsToRegress += 1;
        if (hasPurchasedLibrary) stepsToRegress -= 1;

        String desc = S.current.calamityDescriptionRegression(stepsToRegress);
        if (hasPurchasedEnlightenment) {
          desc += S.current.calamityDescriptionRegressionEnlightenment;
        }
        return desc;
      }),
  Calamity(
      value: 9,
      key: CalamityKey.piracy,
      title: (GameState state) {
        if (state.settings.numberOfPlayers < 5 &&
            state.settings.games.contains(Game.eastern)) {
          return S.current.calamityNamePiracyRaid;
        } else {
          return S.current.calamityNamePiracy;
        }
      },
      type: CalamityType.tradeable,
      description: (GameState state) {
        final hasPurchasedCartography =
            state.advanceIsPurchased(AdvanceKey.cartography);
        final hasPurchasedNavalWarfare =
            state.advanceIsPurchased(AdvanceKey.navalWarfare);

        int coastalCities = 2;

        if (hasPurchasedCartography) coastalCities += 1;
        if (hasPurchasedNavalWarfare) coastalCities -= 1;

        final target = (state.settings.numberOfPlayers < 5 &&
                state.settings.games.contains(Game.eastern))
            ? S.current.calamityDescriptionPiracyRaidTarget
            : S.current.calamityDescriptionPiracyTarget;
        final secondaryVictims = (state.settings.numberOfPlayers < 5)
            ? S.current.calamityDescriptionPiracySecondaryVictims1
            : S.current.calamityDescriptionPiracySecondaryVictims2;

        String desc = S.current
            .calamityDescriptionPiracy(coastalCities, target, secondaryVictims);
        if (hasPurchasedNavalWarfare) {
          desc += S.current.calamityDescriptionPiracyNavalWarfare;
        }
        return desc;
      }),
];
