import 'package:get/get.dart';
import 'package:money_app/models/transaction.dart';
import 'package:money_app/models/transaction_type.dart';
import 'package:money_app/utils/money.dart';

class WalletController extends GetxController {
  final _balance = 0.0.obs;

  Money get money => Money(value: _balance.value);

  final _transactions = <Transaction>[
    Transaction(
        type: TransactionType.retail, concept: "eBay", amount: -32,
        date: DateTime(2024, 3, 8)
    ),
    Transaction(
        type: TransactionType.retail, concept: "Merton Council", amount: -65,
        date: DateTime(2024, 3, 8)
    ),
    Transaction(
        type: TransactionType.deposit, concept: "Top Up", amount: 150,
        date: DateTime(2024, 3, 8)
    ),
    Transaction(
        type: TransactionType.retail, concept: "Amazon", amount: -32,
        date: DateTime(2024, 3, 7)
    ),
    Transaction(
        type: TransactionType.retail, concept: "John Snow", amount: -1400,
        date: DateTime(2024, 3, 7)
    ),
    Transaction(
        type: TransactionType.deposit, concept: "Top Up", amount: 200,
        date: DateTime(2024, 3, 4)
    )

  ].obs;

  Transaction tx(int index) {
    return _transactions[index];
  }

  int get txCount => _transactions.length;

  deposit(double amount) {
    _balance.value += amount;
    _transactions.add(
        Transaction(
            amount: amount,
            concept: "Top Up",
            type: TransactionType.deposit,
            date: DateTime.now())
    );
  }

  pay(double amount, String recipient) {
    _balance.value -= amount;
    _transactions.add(
      Transaction(
        amount: -amount,
        concept: recipient,
        type: TransactionType.retail,
        date: DateTime.now()
      )
    );
  }
}