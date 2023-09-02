import 'package:flutter_test/flutter_test.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/data/settings.dart';
import 'package:mega_empires_assistant/game/advances.dart';
import 'package:mega_empires_assistant/game/calamities.dart';
import 'package:mega_empires_assistant/game/game.dart';
import 'package:mega_empires_assistant/game/game_setup.dart';
import 'package:mega_empires_assistant/screens/view_calamity.dart';

import '../utils/test_utils.dart';

void main() {
  initTests();

  // Screenshot test (for every calamity - for every game + player count - for custom plus default)

  for (var calamity in allCalamities) {
    for (var setup in [GameSetup.short, GameSetup.normal]) {
      // Expert doesn't affect this
      for (var numberOfPlayers = 3; numberOfPlayers < 19; numberOfPlayers++) {
        testWidgets(
            "View Calamity ${calamity.key.name} with $numberOfPlayers players/${setup.name} with no advances",
            (tester) async {
          final gameState = GameState(
              additionalCredits: {},
              purchasedAdvances: {},
              tradeGoods: {},
              advancesInCart: {},
              settings: Settings(
                  games: (numberOfPlayers < 10)
                      ? {Game.eastern}
                      : {Game.eastern, Game.western},
                  numberOfPlayers: numberOfPlayers,
                  setup: setup));

          await tester.pumpWidget(prepareWidget(
              ViewCalamityScreen(state: gameState, calamity: calamity)));

          await expectLater(
              find.byType(ViewCalamityScreen),
              matchesGoldenFile(
                  'golden/view_calamity_${calamity.key.name}_${numberOfPlayers}_${setup}_no_advances.png'));
        });

        testWidgets(
            "View Calamity ${calamity.key.name} with $numberOfPlayers players/${setup.name} with advances",
            (tester) async {
          final gameState = GameState(
              additionalCredits: {},
              purchasedAdvances: allAdvances.map((e) => e.purchase()).toSet(),
              tradeGoods: {},
              advancesInCart: {},
              settings: Settings(
                  games: (numberOfPlayers < 10)
                      ? {Game.eastern}
                      : {Game.eastern, Game.western},
                  numberOfPlayers: numberOfPlayers,
                  setup: setup));

          await tester.pumpWidget(prepareWidget(
              ViewCalamityScreen(state: gameState, calamity: calamity)));

          await expectLater(
              find.byType(ViewCalamityScreen),
              matchesGoldenFile(
                  'golden/view_calamity_${calamity.key.name}_${numberOfPlayers}_${setup}_advances.png'));
        });
      }
    }
  }
}
