import 'package:flutter/material.dart';
import 'package:money_app/models/transaction_type.dart';
import 'package:money_app/theme.dart';
import 'package:money_app/utils/money.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile(
      {super.key, required this.title, required this.amount, required this.type, this.day});
  final String title;
  final double amount;
  final String? day;
  final TransactionType type;

  static const icons = {
    TransactionType.deposit: Icons.add_circle,
    TransactionType.retail: Icons.shopping_bag
  };

  @override
  Widget build(BuildContext context) {
    final money = Money(value: amount);
    final dateLabel = day;
    return Column(
      children: [
        if (dateLabel != null)
          Container(
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.tertiary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: Text(dateLabel,
                  style: TextStyle(
                      color: MainColorScheme.lightGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 11),
                  textAlign: TextAlign.start),
            ),
          ),
        ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Theme.of(context).colorScheme.primary),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(icons[type],
                      color: Theme.of(context).colorScheme.surface),
                )),
            trailing: RichText(
              text: TextSpan(
                text: '${money.sign}${money.pounds.abs()}.',
                style: TextStyle(
                    fontSize: 24,
                    color: getAmountColor(context, money.value.isNegative),
                    fontWeight: FontWeight.w300),
                children: <TextSpan>[
                  TextSpan(
                      text: '${money.pennies}'.padRight(2, '0'),
                      style: TextStyle(
                          color: getAmountColor(context, money.value.isNegative),
                          fontWeight: FontWeight.w300,
                          fontSize: 18)),
                ],
              ),
            )),
      ],
    );
  }

  getAmountColor(BuildContext context, bool negative) {
    return negative ?
      Theme.of(context).colorScheme.inverseSurface:
    Theme.of(context).colorScheme.primary;

  }
}
