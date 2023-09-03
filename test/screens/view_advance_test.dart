import 'package:flutter_test/flutter_test.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/data/settings.dart';
import 'package:mega_empires_assistant/game/advances.dart';
import 'package:mega_empires_assistant/game/game.dart';
import 'package:mega_empires_assistant/game/game_setup.dart';
import 'package:mega_empires_assistant/screens/view_advance.dart';

import '../utils/test_utils.dart';

void main() {
  initTests();

  // Screenshot test (for every advance)

  for (var advance in allAdvances) {
    testWidgets("View Advance ${advance.key.name}", (tester) async {
      final gameState = GameState(
          additionalCredits: {},
          purchasedAdvances: {},
          tradeGoods: {},
          advancesInCart: {},
          settings: Settings(
              games: {Game.eastern},
              numberOfPlayers: 6,
              setup: GameSetup.normal));

      await tester.pumpWidget(
          prepareWidget(ViewAdvanceScreen(state: gameState, advance: advance)));

      await expectLater(find.byType(ViewAdvanceScreen),
          matchesGoldenFile('golden/view_advance_${advance.key.name}.png'));
    });
  }
}
