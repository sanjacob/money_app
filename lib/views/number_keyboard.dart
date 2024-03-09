import 'package:flutter/material.dart';

class NumberKeyboard extends StatelessWidget {
  const NumberKeyboard({super.key, required this.onPress});

  final Function onPress;

  static const labels = [
    "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "0", "<"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 300,
      child: GridView.count(
        scrollDirection: Axis.vertical,
          childAspectRatio: 2.2,
          crossAxisCount: 3,
        children: List.generate(12, (index) => Center(
          child: TextButton(child: Text(labels[index], style: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontSize: 32
          )), onPressed: () => onPress(labels[index]))
        )))
    );
  }
}
