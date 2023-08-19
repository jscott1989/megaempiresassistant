import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/data/purchased_advance.dart';
import 'package:mega_empires_assistant/main.dart';
import 'package:mega_empires_assistant/screens/settings.dart';

import '../util/utils.dart';
import 'advances.dart';
import 'calamities.dart';
import 'edit_advances.dart';
import 'edit_credits.dart';

class TradeGood {
  String title;
  int baseValue;
  int max;
  bool isTreasuryToken = false; // Special case to override value calculation
  Game game = Game.ANY;
  int minPlayers = 0;

  TradeGood(this.game, this.title, this.baseValue, this.max, this.minPlayers);

  TradeGood.treasuryToken(this.title, this.baseValue, this.max) {
    isTreasuryToken = true;
  }

  String values(GameState state) {
    return [for (var i = 1; i <= max; i++) calculateValue(state, i)]
        .join(" -> ");
  }

  int calculateValue(GameState state, int count) {
    if (isTreasuryToken) {
      if (miningIsPurchased(state)) {
        return count * 2;
      }
      return count;
    }
    return (count * count) * baseValue;
  }

  String toString() {
    return title;
  }
}

bool isMining(PurchasedAdvance advance) {
  return advance.advance.title == "Mining";
}

bool miningIsPurchased(GameState state) {
  return state.purchasedAdvances.any(isMining);
}

final List<TradeGood> allTradeGoods = [
  TradeGood.treasuryToken("Treasury Tokens", 1, 55),

  TradeGood(Game.WESTERN, "Ochre", 1, 9, 0),
  TradeGood(Game.EASTERN, "Flax", 1, 9, 0),
  TradeGood(Game.WESTERN, "Clay", 1, 9, 0),
  TradeGood(Game.EASTERN, "Hides", 1, 9, 0),
  TradeGood(Game.WESTERN, "Bone", 1, 8, 9), // (Split between east and west?)

  // ---

  TradeGood(Game.WESTERN, "Papyri", 2, 8, 0),
  TradeGood(Game.EASTERN, "Stone", 2, 8, 0),
  TradeGood(Game.WESTERN, "Iron", 2, 8, 0),
  TradeGood(Game.EASTERN, "Furs", 2, 8, 0),
  TradeGood(Game.WESTERN, "Wax", 2, 8, 9),

  // ---

  TradeGood(Game.WESTERN, "Fish", 3, 8, 0),
  TradeGood(Game.EASTERN, "Timber", 3, 8, 0),
  TradeGood(Game.WESTERN, "Fruit", 3, 9, 0),
  TradeGood(Game.EASTERN, "Salt", 3, 9, 0),
  TradeGood(Game.WESTERN, "Ceramics", 3, 8, 9),

  // ---

  TradeGood(Game.WESTERN, "Wool", 4, 7, 0),
  TradeGood(Game.EASTERN, "Cotton", 4, 7, 0),
  TradeGood(Game.WESTERN, "Oil", 4, 8, 0),
  TradeGood(Game.EASTERN, "Sugar", 4, 8, 0),
  TradeGood(Game.WESTERN, "Grain", 4, 8, 9),

  // ---

  TradeGood(Game.WESTERN, "Wine", 5, 6, 0),
  TradeGood(Game.EASTERN, "Lacquer", 5, 6, 0),
  TradeGood(Game.WESTERN, "Textiles", 5, 7, 0),
  TradeGood(Game.EASTERN, "Livestock", 5, 7, 0),
  TradeGood(Game.WESTERN, "Glass", 5, 6, 9),

  // ---

  TradeGood(Game.WESTERN, "Tin", 6, 5, 0),
  TradeGood(Game.EASTERN, "Silver", 6, 5, 0),
  TradeGood(Game.WESTERN, "Copper", 6, 6, 0),
  TradeGood(Game.EASTERN, "Bronze", 6, 6, 0),
  TradeGood(Game.WESTERN, "Lead", 6, 6, 9),

  // ---

  TradeGood(Game.WESTERN, "Resin", 7, 5, 0),
  TradeGood(Game.EASTERN, "Jade", 7, 5, 0),
  TradeGood(Game.WESTERN, "Incense", 7, 6, 0),
  TradeGood(Game.EASTERN, "Spice", 7, 6, 0),
  TradeGood(Game.WESTERN, "Herbs", 7, 6, 9),

  // ---

  TradeGood(Game.WESTERN, "Marble", 8, 4, 0),
  TradeGood(Game.EASTERN, "Dye", 8, 4, 0),
  TradeGood(Game.WESTERN, "Gemstones", 8, 5, 0),
  TradeGood(Game.EASTERN, "Tea", 8, 5, 0),
  TradeGood(Game.WESTERN, "Obsidian", 8, 4, 9),

  // ---
  TradeGood(Game.WESTERN, "Ivory", 9, 4, 0),
  TradeGood(Game.EASTERN, "Silk", 9, 4, 0),
  TradeGood(Game.WESTERN, "Gold", 9, 5, 0),
  TradeGood(Game.EASTERN, "Pearls", 9, 5, 0),
  TradeGood(Game.WESTERN, "Amber", 9, 4, 9),
];

final Map<String, TradeGood> INDEXED_TRADEGOODS =
    Map.fromIterable(allTradeGoods, key: (e) => e.title, value: (e) => e);

class TradeGoods extends StatefulWidget {
  GameState state;

  TradeGoods({Key? key, required this.state}) : super(key: key);

  @override
  _TradeGoodsState createState() => _TradeGoodsState();
}

class _TradeGoodsState extends State<TradeGoods> {
  List<TradeGood> activeTradeGoods = [];
  var tradeGoodCounts = Map<TradeGood, int>();

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    tradeGoodCounts = Map.of(widget.state.tradeGoods);
    filterSearchResults("");
    super.initState();
  }

  void filterSearchResults(String query) {
    List<TradeGood> searchResults = [];
    allTradeGoods.forEach((item) {
      if (!item.title.toLowerCase().contains(query.toLowerCase())) {
        return;
      }
      if (!widget.state.settings.games.contains(item.game)) {
        return;
      }
      if (widget.state.settings.numberOfPlayers > 9 &&
          widget.state.settings.numberOfPlayers < 12) {
        if (widget.state.settings.games.contains(Game.WESTERN)) {
          if (item.game != Game.WESTERN) {
            // Special case: Mega Empires with 11 or 12 players always uses western set
            return;
          }
        }
      }

      if (widget.state.settings.numberOfPlayers < item.minPlayers) {
        return;
      } else if (widget.state.settings.numberOfPlayers > 11 &&
          widget.state.settings.numberOfPlayers < 15) {
        if (item.minPlayers == 9) {
          // Special case: 12-14 players doesn't use the 9-only cards
          return;
        }
      }

      searchResults.add(item);
    });
    setState(() {
      activeTradeGoods.clear();
      activeTradeGoods.addAll(searchResults);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Trade Goods"),
          actions: <Widget>[
            createPopupMenu(advancementsPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditAdvances(
                        state: widget.state.withTradeGoods(tradeGoodCounts),
                        update: (state) {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TradeGoods(state: state)));
                        }),
                  ));
            }, creditsPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditCredits(
                        state: widget.state.withTradeGoods(tradeGoodCounts),
                        update: (state) {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TradeGoods(state: state)));
                        }),
                  ));
            }, calamitiesPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Calamities(state: widget.state)));
            }, settingsPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditSettings(
                        state: widget.state.withTradeGoods(tradeGoodCounts),
                        update: (state) {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TradeGoods(state: state)));
                        }),
                  ));
            })
          ],
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
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: activeTradeGoods.length,
                itemBuilder: (context, index) {
                  return TradeGoodListTile(
                      state: widget.state,
                      tradeGood: activeTradeGoods[index],
                      itemCount:
                          tradeGoodCounts.containsKey(activeTradeGoods[index])
                              ? tradeGoodCounts[activeTradeGoods[index]]!
                              : 0,
                      increment: () {
                        setState(() {
                          tradeGoodCounts.putIfAbsent(activeTradeGoods[index],
                              () {
                            return 0;
                          });
                          tradeGoodCounts[activeTradeGoods[index]] =
                              tradeGoodCounts[activeTradeGoods[index]]! + 1;
                        });
                      },
                      decrement: () {
                        setState(() {
                          tradeGoodCounts.putIfAbsent(activeTradeGoods[index],
                              () {
                            return 0;
                          });
                          tradeGoodCounts[activeTradeGoods[index]] =
                              tradeGoodCounts[activeTradeGoods[index]]! - 1;
                        });
                      });
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                        child: Text("Value: " +
                            calculateTotalValue(tradeGoodCounts, widget.state)
                                .toString()),
                        padding: const EdgeInsets.only(right: 40)),
                    ButtonBar(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new OutlinedButton(
                          child: new Text('Continue'),
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
          ]),
        ));
  }
}

class TradeGoodListTile extends StatelessWidget {
  final int itemCount;
  final GameState state;
  TradeGood tradeGood;

  VoidCallback increment;
  VoidCallback decrement;

  TradeGoodListTile(
      {required this.state,
      required this.tradeGood,
      required this.itemCount,
      required this.increment,
      required this.decrement})
      : super(key: Key(tradeGood.title));

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        //new Tooltip(message: tradeGood.values(state), child:
        title: new Text(tradeGood.baseValue.toString() + " " + tradeGood.title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            itemCount != 0
                ? new IconButton(
                    icon: new Icon(Icons.remove), onPressed: decrement)
                : new Container(),
            Text(itemCount.toString()),
            itemCount < tradeGood.max
                ? new IconButton(
                    icon: new Icon(Icons.add), onPressed: increment)
                : new Container(height: 10, width: 48)
          ],
        ));
  }
}
