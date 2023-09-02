import 'package:flutter/material.dart' hide SearchController;
import 'package:mega_empires_assistant/data/calamity.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/game/calamities.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';
import 'package:mega_empires_assistant/screens/view_calamity.dart';
import 'package:mega_empires_assistant/screens/widgets/search_controller.dart';

/// Screen to preview calamities at any point (e.g. during trading)
final class ViewCalamitiesScreen extends StatefulWidget {
  final GameState state;

  const ViewCalamitiesScreen({Key? key, required this.state}) : super(key: key);

  @override
  ViewCalamitiesScreenState createState() => ViewCalamitiesScreenState();
}

class ViewCalamitiesScreenState extends State<ViewCalamitiesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).calamities)),
      body: Column(children: [
        SearchController<Calamity>(
          allItems: allCalamities,
          queryFunction: (calamity, query) {
            if (calamity.type == CalamityType.minor) {
              if (widget.state.settings.numberOfPlayers < 9) {
                return false;
              }

              if (widget.state.settings.numberOfPlayers > 11 &&
                  widget.state.settings.numberOfPlayers < 15) {
                return false;
              }
            }

            return calamity.title(widget.state).toLowerCase().contains(query);
          },
          itemBuilder: (calamity) {
            return CalamityListTile(calamity: calamity, state: widget.state);
          },
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextButton(
                      child: Text(S.of(context).cont),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                )
              ],
            )),
      ]),
    );
  }
}

final class CalamityListTile extends StatelessWidget {
  final Calamity calamity;
  final GameState state;

  CalamityListTile({required this.calamity, required this.state})
      : super(key: Key(calamity.title(state)));

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Colors.blueGrey),
        child: ListTile(
            title: Row(children: [
              TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, minimumSize: const Size(0, 30)),
                child: const Icon(Icons.info_outline, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewCalamityScreen(
                              state: state, calamity: calamity)));
                },
              ),
              Text("${calamity.value.toString()} ${calamity.title(state)}")
            ]),
            subtitle: Text(calamity.type.label.toUpperCase())));
  }
}
