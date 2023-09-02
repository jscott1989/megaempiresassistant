import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/data/calamity.dart';
import 'package:mega_empires_assistant/data/game_state.dart';
import 'package:mega_empires_assistant/generated/l10n.dart';

/// Screen showing information about a particular [Calamity]
final class ViewCalamityScreen extends StatefulWidget {
  /// Overall [GameState]
  final GameState state;

  /// The [Calamity] being viewed
  final Calamity calamity;

  const ViewCalamityScreen(
      {Key? key, required this.state, required this.calamity})
      : super(key: key);

  @override
  ViewCalamityScreenState createState() => ViewCalamityScreenState();
}

final class ViewCalamityScreenState extends State<ViewCalamityScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              title: Text(
                widget.calamity.title(widget.state),
                style: const TextStyle(color: Colors.white),
              ),
              flexibleSpace: Container(),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.person_off),
                  ),
                  Tab(
                    icon: Icon(Icons.person),
                  ),
                ],
              ),
            ),
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TabBarView(children: [
                  // Not Personalised
                  Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                        const Text(""), // Spacer
                        Text(S.of(context).calamityStandardInformation),
                        const Text(""), // Spacer
                        ViewCalamityWidget(
                            // We look at the calamity with no advances
                            state: widget.state.withAdvances({}),
                            calamity: widget.calamity)
                      ])),

                  // Personalised
                  Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                        const Text(""), // Spacer
                        Text(S.of(context).calamityPlayerSpecific),
                        const Text(""),
                        ViewCalamityWidget(
                            state: widget.state, calamity: widget.calamity)
                      ]))
                ]))));
  }
}

final class ViewCalamityWidget extends StatelessWidget {
  final GameState state;
  final Calamity calamity;

  const ViewCalamityWidget(
      {super.key, required this.state, required this.calamity});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(calamity.type.label.toUpperCase()),
            const Text(""),
            Text(calamity.description(state)),
            const Text(""),
            calamity.modifiers.isEmpty
                ? const Text("")
                : Text("${S.of(context).modifiers}:"),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: calamity.modifiers
                    .map((e) => Text("${e.advance().title}: ${e.description}",
                        style: TextStyle(
                          color: ((e.isPositive ? Colors.green : Colors.red)
                              .withAlpha(state.advanceIsPurchased(e.advanceKey)
                                  ? 255
                                  : 100)),
                        )))
                    .toList())
          ]),
    );
  }
}
