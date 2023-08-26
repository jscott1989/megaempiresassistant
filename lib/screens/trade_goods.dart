import 'package:flutter/material.dart' hide SearchController;
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/data/trade_goods.dart';
import 'package:mega_empires_assistant/game/game.dart';
import 'package:mega_empires_assistant/game/trade_goods.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';
import 'package:mega_empires_assistant/screens/widgets/popup_menu.dart';
import 'package:mega_empires_assistant/screens/widgets/search_controller.dart';

import 'advances.dart';

/// Screen for selecting the trade goods we have after trading
final class SelectTradeGoodsScreen extends StatefulWidget {
  final GameState state;

  const SelectTradeGoodsScreen({Key? key, required this.state})
      : super(key: key);

  @override
  SelectTradeGoodsScreenState createState() => SelectTradeGoodsScreenState();
}

final class SelectTradeGoodsScreenState extends State<SelectTradeGoodsScreen> {
  /// The selected trade goods
  var tradeGoodCounts = <TradeGood, int>{};

  @override
  void initState() {
    tradeGoodCounts = Map.of(widget.state.tradeGoods);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).tradeGoods), actions: [
          createPopupMenu(
              context: context,
              state: widget.state.withTradeGoods(tradeGoodCounts),
              onReturn: (state) => SelectTradeGoodsScreen(state: state))
        ]),
        body: Column(children: [
          SearchController<TradeGood>(
            allItems: allTradeGoods,
            queryFunction: (tradeGood, query) {
              if (!tradeGood.title
                  .toLowerCase()
                  .contains(query.toLowerCase())) {
                return false;
              }
              if (!widget.state.settings.games.contains(tradeGood.game)) {
                return false;
              }
              if (widget.state.settings.numberOfPlayers > 9 &&
                  widget.state.settings.numberOfPlayers < 12) {
                if (widget.state.settings.games.contains(Game.western)) {
                  if (tradeGood.game != Game.western) {
                    // Special case: Mega Empires with 11 or 12 players always uses western set
                    return false;
                  }
                }
              }

              if (widget.state.settings.numberOfPlayers <
                  tradeGood.minPlayers) {
                return false;
              } else if (widget.state.settings.numberOfPlayers > 11 &&
                  widget.state.settings.numberOfPlayers < 15) {
                if (tradeGood.minPlayers == 9) {
                  // Special case: 12-14 players doesn't use the 9-only cards
                  return false;
                }
              }

              return true;
            },
            itemBuilder: (tradeGood) {
              return TradeGoodListTile(
                  state: widget.state,
                  tradeGood: tradeGood,
                  itemCount: tradeGoodCounts.containsKey(tradeGood)
                      ? tradeGoodCounts[tradeGood]!
                      : 0,
                  increment: () {
                    setState(() {
                      tradeGoodCounts.putIfAbsent(tradeGood, () {
                        return 0;
                      });
                      tradeGoodCounts[tradeGood] =
                          tradeGoodCounts[tradeGood]! + 1;
                    });
                  },
                  decrement: () {
                    setState(() {
                      tradeGoodCounts.putIfAbsent(tradeGood, () {
                        return 0;
                      });
                      tradeGoodCounts[tradeGood] =
                          tradeGoodCounts[tradeGood]! - 1;
                    });
                  });
            },
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(S.of(context).tradeGoodValue(
                          calculateTotalValue(tradeGoodCounts, widget.state)
                              .toString()))),
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OutlinedButton(
                        child: Text(S.of(context).cont),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PurchaseAdvancesScreen(
                                    state: widget.state
                                        .withTradeGoods(tradeGoodCounts))),
                          );
                        },
                      )
                    ],
                  )
                ],
              )),
        ]));
  }
}

/// A single trade good in the list
final class TradeGoodListTile extends StatelessWidget {
  /// The current number of the trade good we have
  final int itemCount;

  /// Overall game state
  final GameState state;

  /// The trade good we are displaying
  final TradeGood tradeGood;

  /// Callback when we increment the count
  final VoidCallback increment;

  /// Callback when we decrement the count
  final VoidCallback decrement;

  TradeGoodListTile(
      {required this.state,
      required this.tradeGood,
      required this.itemCount,
      required this.increment,
      required this.decrement})
      : super(key: Key(tradeGood.title));

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text("${tradeGood.baseValue} ${tradeGood.title}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            itemCount != 0
                ? IconButton(
                    icon: const Icon(Icons.remove), onPressed: decrement)
                : Container(),
            Text(itemCount.toString()),
            itemCount < tradeGood.max
                ? IconButton(icon: const Icon(Icons.add), onPressed: increment)
                : const SizedBox(height: 10, width: 48)
          ],
        ));
  }
}
