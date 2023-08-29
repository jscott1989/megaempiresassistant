import 'package:flutter/material.dart';
import 'package:mega_empires_assistant/data/advance_colour.dart';

/// Tile used to display a credit item and allow incrementing and decrementing
class CreditListTile extends StatelessWidget {
  /// The current number of credits
  final int itemCount;

  /// The minimum we should allow decrementing to
  final int min;

  /// The maximum we should allow incrementing to
  final int max;

  /// The credit type being displayed
  final AdvanceColour creditType;

  /// A callback for when the count is decremented
  final VoidCallback decrement;

  /// A callback for when the count is incremented
  final VoidCallback increment;

  CreditListTile(
      {required this.creditType,
      required this.itemCount,
      required this.min,
      this.max = 1000,
      required this.decrement,
      required this.increment})
      : super(key: Key(creditType.toString()));

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: creditType.colour),
        child: ListTile(
            title: Text(creditType.displayName),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                    key: decreaseButtonKey(creditType),
                    icon: const Icon(Icons.remove),
                    onPressed: itemCount >= min + 5 ? decrement : null),
                Container(
                  constraints: const BoxConstraints(minWidth: 20),
                  child:
                      Text(itemCount.toString(), textAlign: TextAlign.center),
                ),
                IconButton(
                    key: increaseButtonKey(creditType),
                    icon: const Icon(Icons.add),
                    onPressed: itemCount <= max - 5 ? increment : null)
              ],
            )));
  }
}

Key increaseButtonKey(AdvanceColour creditType) {
  return Key("increase_${creditType.name}");
}

Key decreaseButtonKey(AdvanceColour creditType) {
  return Key("decrease_${creditType.name}");
}
