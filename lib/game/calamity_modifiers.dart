import 'package:mega_empires_assistant/data/calamity.dart';
import 'package:mega_empires_assistant/game/advances.dart';
import 'package:mega_empires_assistant/game/calamities.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';

final allModifiers = <CalamityModifier>[
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.engineering,
      calamityKey: CalamityKey.volcanicEruptionEarthquake,
      description:
          S.current.calamityEffectEngineeringVolcanicEruptionEarthquake),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.diplomacy,
      calamityKey: CalamityKey.treachery,
      description: S.current.calamityEffectBeneficiaryAnnexes1AdditionalCity),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.agriculture,
      calamityKey: CalamityKey.famine,
      description: S.current.calamityEffectPrimaryVictim(
          S.current.calamityEffectTakeAdditionalDamage(5))),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.pottery,
      calamityKey: CalamityKey.famine,
      description: S.current.calamityEffectPreventDamage(5)),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.calendar,
      calamityKey: CalamityKey.famine,
      description: S.current.calamityEffectPreventDamage(5)),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.mythology,
      calamityKey: CalamityKey.slaveRevolt,
      description: S.current
          .yourCitySupportRateIsDecreasedDuringTheResolutionOfSlaveRevolt(1)),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.enlightenment,
      calamityKey: CalamityKey.slaveRevolt,
      description: S.current
          .yourCitySupportRateIsDecreasedDuringTheResolutionOfSlaveRevolt(1)),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.mining,
      calamityKey: CalamityKey.slaveRevolt,
      description: S.current
          .yourCitySupportRateIsIncreasedDuringTheResolutionOfSlaveRevolt(1)),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.engineering,
      calamityKey: CalamityKey.flood,
      description: S.current.calamityEffectPreventDamage(5)),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.mysticism,
      calamityKey: CalamityKey.superstition,
      description: S.current.calamityEffectReduce1LessCity),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.deism,
      calamityKey: CalamityKey.superstition,
      description: S.current.calamityEffectReduce1LessCity),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.enlightenment,
      calamityKey: CalamityKey.superstition,
      description: S.current.calamityEffectReduce1LessCity),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.universalDoctrine,
      calamityKey: CalamityKey.superstition,
      description: S.current.calamityEffectReduce1AdditionalCity),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.music,
      calamityKey: CalamityKey.civilWar,
      description: S.current.calamityEffectSelectLessUnitPoints(5)),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.dramaAndPoetry,
      calamityKey: CalamityKey.civilWar,
      description: S.current.calamityEffectSelectLessUnitPoints(5)),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.democracy,
      calamityKey: CalamityKey.civilWar,
      description: S.current.calamityEffectSelectLessUnitPoints(10)),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.philosophy,
      calamityKey: CalamityKey.civilWar,
      description: S.current.calamityEffectSelectAdditionalUnitPoints(5)),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.military,
      calamityKey: CalamityKey.civilWar,
      description: S.current.calamityEffectSelectAdditionalUnitPoints(5)),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.monarchy,
      calamityKey: CalamityKey.barbarianHordes,
      description: S.current.calamityEffectLessBarbarianTokensAreUsed(5)),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.politics,
      calamityKey: CalamityKey.barbarianHordes,
      description: S.current.calamityEffectAdditionalBarbarianTokensAreUsed(5)),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.provincialEmpire,
      calamityKey: CalamityKey.barbarianHordes,
      description: S.current.calamityEffectAdditionalBarbarianTokensAreUsed(5)),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.tradeEmpire,
      calamityKey: CalamityKey.cyclone,
      description: S.current.calamityEffectSelect1AdditionalCity),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.masonry,
      calamityKey: CalamityKey.cyclone,
      description: S.current.calamityEffectDeselect1SelectedCity),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.calendar,
      calamityKey: CalamityKey.cyclone,
      description: S.current.calamityEffectDeselectSelectedCities(2)),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.medicine,
      calamityKey: CalamityKey.epidemic,
      description: S.current.calamityEffectPreventDamage(5)),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.enlightenment,
      calamityKey: CalamityKey.epidemic,
      description: S.current.calamityEffectPrimaryVictim(
          S.current.calamityEffectPreventDamage(5))),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.anatomy,
      calamityKey: CalamityKey.epidemic,
      description: S.current.calamityEffectSecondaryVictim(
          S.current.calamityEffectPreventDamage(5))),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.roadBuilding,
      calamityKey: CalamityKey.epidemic,
      description: S.current.calamityEffectPrimaryVictim(
          S.current.calamityEffectTakeAdditionalDamage(5))),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.tradeEmpire,
      calamityKey: CalamityKey.epidemic,
      description: S.current.calamityEffectPrimaryVictim(
          S.current.calamityEffectTakeAdditionalDamage(5))),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.sculpture,
      calamityKey: CalamityKey.tyranny,
      description: S.current
          .calamityEffectBeneficiarySelectsAndAnnexesLessUnitPoints(5)),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.law,
      calamityKey: CalamityKey.tyranny,
      description: S.current
          .calamityEffectBeneficiarySelectsAndAnnexesLessUnitPoints(5)),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.monarchy,
      calamityKey: CalamityKey.tyranny,
      description: S.current
          .calamityEffectBeneficiarySelectsAndAnnexesAdditionalUnitPoints(5)),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.provincialEmpire,
      calamityKey: CalamityKey.tyranny,
      description: S.current
          .calamityEffectBeneficiarySelectsAndAnnexesAdditionalUnitPoints(5)),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.music,
      calamityKey: CalamityKey.civilDisorder,
      description: S.current.calamityEffectReduce1LessCity),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.dramaAndPoetry,
      calamityKey: CalamityKey.civilDisorder,
      description: S.current.calamityEffectReduce1LessCity),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.law,
      calamityKey: CalamityKey.civilDisorder,
      description: S.current.calamityEffectReduce1LessCity),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.democracy,
      calamityKey: CalamityKey.civilDisorder,
      description: S.current.calamityEffectReduce1LessCity),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.advancedMilitary,
      calamityKey: CalamityKey.civilDisorder,
      description: S.current.calamityEffectReduce1AdditionalCity),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.navalWarfare,
      calamityKey: CalamityKey.civilDisorder,
      description: S.current.calamityEffectReduce1AdditionalCity),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.law,
      calamityKey: CalamityKey.corruption,
      description: S.current.calamityEffectDiscardLessPointsOfFaceValue(5)),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.coinage,
      calamityKey: CalamityKey.corruption,
      description:
          S.current.calamityEffectDiscardAdditionalPointsOfFaceValue(5)),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.wonderOfTheWorld,
      calamityKey: CalamityKey.corruption,
      description:
          S.current.calamityEffectDiscardAdditionalPointsOfFaceValue(5)),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.philosophy,
      calamityKey: CalamityKey.iconoclasmAndHeresy,
      description: S.current.calamityEffectReduceLessCities(2)),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.theology,
      calamityKey: CalamityKey.iconoclasmAndHeresy,
      description: S.current.calamityEffectReduceLessCities(3)),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.monotheism,
      calamityKey: CalamityKey.iconoclasmAndHeresy,
      description: S.current.calamityEffectReduce1AdditionalCity),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.theocracy,
      calamityKey: CalamityKey.iconoclasmAndHeresy,
      description: S.current.calamityEffectTheocracyIconoclasmAndHeresy),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.fundamentalism,
      calamityKey: CalamityKey.regression,
      description: S.current.calamityEffectFundamentalismRegression),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.library,
      calamityKey: CalamityKey.regression,
      description: S.current.calamityEffectLibraryRegression),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.enlightenment,
      calamityKey: CalamityKey.regression,
      description: S.current.calamityEffectEnlightenmentRegression),
  CalamityModifier(
      isPositive: false,
      advanceKey: AdvanceKey.cartography,
      calamityKey: CalamityKey.piracy,
      description: S.current.calamityEffectCartographyPiracy),
  CalamityModifier(
      isPositive: true,
      advanceKey: AdvanceKey.navalWarfare,
      calamityKey: CalamityKey.piracy,
      description: S.current.calamityEffectNavalWarfarePiracy),
];
