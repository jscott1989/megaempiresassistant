import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';
import 'package:mega_empires_assistant/screens/calamities.dart';
import 'package:mega_empires_assistant/screens/edit_advances.dart';
import 'package:mega_empires_assistant/screens/edit_credits.dart';
import 'package:mega_empires_assistant/screens/settings.dart';

/// Create the cog popup menu
Widget createPopupMenu(
    {required BuildContext context,
    required GameState state,
    required Widget Function(GameState) onReturn}) {
  return PopupMenuButton(
    icon: const Icon(Icons.settings),
    onSelected: (option) {
      if (option == "advancements") {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditAdvancesScreen(
                  state: state,
                  update: (state) {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => onReturn(state)));
                  }),
            ));
      } else if (option == "credits") {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditCreditsScreen(
                  state: state,
                  update: (state) {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => onReturn(state)));
                  }),
            ));
      } else if (option == "calamities") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewCalamitiesScreen(state: state)));
      } else if (option == "settings") {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditSettingsScreen(
                  state: state,
                  update: (state) {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => onReturn(state)));
                  }),
            ));
      }
    },
    itemBuilder: (BuildContext context) {
      return <PopupMenuEntry>[
        PopupMenuItem<String>(
            value: "advancements", child: Text(S.of(context).editAdvances)),
        PopupMenuItem<String>(
            value: "credits", child: Text(S.of(context).editCredits)),
        PopupMenuItem<String>(
            value: "calamities", child: Text(S.of(context).viewCalamities)),
        PopupMenuItem<String>(
            value: "settings", child: Text(S.of(context).settings))
      ];
    },
  );
}
