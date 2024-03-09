import 'package:flutter/material.dart';

class BalanceDisplay extends StatelessWidget {
  const BalanceDisplay({super.key, required this.pounds, required this.pennies});
  final String pounds;
  final String pennies;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "£",
        style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).colorScheme.surface,
            fontWeight: FontWeight.w600),
        children: <TextSpan>[
          TextSpan(
              text: '${pounds}.',
              style: const TextStyle(fontSize: 48)),
          TextSpan(text: pennies),
        ],
      ),
    );
  }
}
