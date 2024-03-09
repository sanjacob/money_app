import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_app/models/transaction_type.dart';
import 'package:money_app/state/wallet.dart';
import 'package:money_app/views/transaction_tile.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    return GetX<WalletController>(
      builder: (ctx) {
        var lastDate = null;
        return SliverList.builder(
            itemCount: ctx.txCount,
            itemBuilder: (context, index) {
              var previousLast = lastDate;
              var tx = ctx.tx(index);
              lastDate = tx.date;

              return TransactionTile(
                  title: tx.concept,
                  amount: tx.amount,
                  type: tx.type,
                  day: dateLabel(now, previousLast, tx.date),
                  key: Key(index.toString()));
            }
        );
      }
    );
  }

  String? dateLabel(DateTime now, DateTime? last, DateTime current) {
    bool lastDiff = last == null || last.difference(current).inDays != 0;
    var nowDiff = current.difference(now).inDays;
    if (lastDiff) {
      switch (nowDiff) {
        case 0:
          return "TODAY";
        case -1:
          return "YESTERDAY";
        default:
          return DateFormat.MMMMd().format(current).toUpperCase();
      }
    }

    return null;
  }
}

