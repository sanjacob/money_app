import 'package:money_app/models/transaction_type.dart';

class Transaction {
  final TransactionType type;
  final String concept;
  final double amount;
  final DateTime date;

  Transaction({
    required this.type,
    required this.concept,
    required this.amount,
    required this.date,
  });
}