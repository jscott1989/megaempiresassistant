import 'dart:math';

import 'package:flutter/material.dart';

/// [Widget] to be used when allowing a list of items to be searched
final class SearchController<ResultType> extends StatefulWidget {
  final Widget Function(dynamic) itemBuilder;
  final bool Function(dynamic, String) queryFunction;
  final Iterable<ResultType> allItems;

  const SearchController(
      {super.key,
      required this.allItems,
      required this.itemBuilder,
      required this.queryFunction});

  @override
  SearchControllerState createState() => SearchControllerState();
}

final class SearchControllerState<ResultType>
    extends State<SearchController<ResultType>> {
  final TextEditingController searchController = TextEditingController();
  List<ResultType> searchResults = [];
  String query = "";

  void filterSearchResults(String query) {
    setState(() {
      this.query = query;
      searchResults.clear();
      for (var item in widget.allItems) {
        if (widget.queryFunction(item, query.toLowerCase())) {
          searchResults.add(item);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var results = query.isEmpty ? widget.allItems.toList() : searchResults;
    return Expanded(
        child: Column(children: [
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (query) {
              filterSearchResults(query);
            },
            controller: searchController,
            decoration: const InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          )),
      Expanded(
          child: ListView.builder(
        itemCount: max(1, results.length),
        itemBuilder: (context, index) {
          if (results.isEmpty) {
            return const Text("No results");
          }
          return widget.itemBuilder(results[index]);
        },
      ))
    ]));
  }
}
