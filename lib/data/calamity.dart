import 'package:intl/intl.dart';
import 'package:mega_empires_assistant/data/advance.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/game/advances.dart';
import 'package:mega_empires_assistant/game/calamities.dart';
import 'package:mega_empires_assistant/game/calamity_modifiers.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';

/// The type of [Calamity]
enum CalamityType {
  minor(labelKey: "calamityTypeMinor"),
  tradeable(labelKey: "calamityTypeTradeable"),
  nonTradeable(labelKey: "calamityTypeNonTradeable");

  final String labelKey;

  const CalamityType({required this.labelKey});

  String get label {
    S.current.calamityTypeMinor;
    return Intl.message(
      '',
      name: labelKey,
      desc: '',
      args: [],
    );
  }
}

/// A modifier applied by an [Advance] to a [Calamity]
final class CalamityModifier {
  /// True if the effect is beneficial to the holder of the [Advance]
  final bool isPositive;

  /// The [Advance] applying the modifier
  final AdvanceKey advanceKey;

  /// The [Calamity] the modifier applies to
  final CalamityKey calamityKey;

  /// The description of the effect
  final String description;

  CalamityModifier(
      {required this.isPositive,
      required this.advanceKey,
      required this.calamityKey,
      required this.description});

  Advance advance() {
    return allAdvances.firstWhere((element) => element.key == advanceKey);
  }

  Calamity calamity() {
    return allCalamities.firstWhere((element) => element.key == calamityKey);
  }
}

/// A Calamity which has some effect on the game state of the primary or
/// secondary victim, and possible a beneficiary
final class Calamity {
  /// The stack which contains this calamity
  final int value;

  /// The key of the calamity
  final CalamityKey key;

  /// The title of the [Calamity], which can change due to player count
  final Function(GameState) title;

  /// The type of the Calamity
  final CalamityType type;

  /// The effective description of the [Calamity] for the given [GameState]
  final Function(GameState) description;

  /// Modifiers which apply to the Calamity
  final List<CalamityModifier> modifiers;

  Calamity(
      {required this.value,
      required this.key,
      required this.title,
      required this.type,
      required this.description})
      : modifiers = allModifiers
            .where((element) => element.calamityKey == key)
            .toList();
}
