import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// The colour of advances available in the game.
enum AdvanceColour {
  yellow(colour: Colors.yellow, enColourName: "Yellow", enName: "Religion"),
  green(colour: Colors.green, enColourName: "Green", enName: "Science"),
  blue(colour: Colors.blue, enColourName: "Blue", enName: "Arts"),
  red(colour: Colors.red, enColourName: "Red", enName: "Civics"),
  orange(colour: Colors.orange, enColourName: "Orange", enName: "Crafts");

  final Color colour;
  final String enColourName;
  final String enName;

  const AdvanceColour(
      {required this.colour, required this.enColourName, required this.enName});

  String get colourName {
    return Intl.message(
      enColourName,
      name: 'advance_colour_${enColourName.toLowerCase()}',
      desc: '',
      args: [],
    );
  }

  String get name {
    return Intl.message(
      enName,
      name: 'advance_colour_name_${enName.toLowerCase()}',
      desc: '',
      args: [],
    );
  }

  String get displayName {
    return "$name ($colourName)";
  }
}

/// Converts a colour name into an [AdvanceColour].
AdvanceColour advanceColourFromEnColourName(String name) {
  switch (name) {
    case "Yellow":
      return AdvanceColour.yellow;
    case "Green":
      return AdvanceColour.green;
    case "Blue":
      return AdvanceColour.blue;
    case "Red":
      return AdvanceColour.red;
    case "Orange":
      return AdvanceColour.orange;
    default:
      throw Exception("Unknown advance colour $name");
  }
}
