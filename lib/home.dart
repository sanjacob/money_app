import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:money_app/state/wallet.dart';
import 'package:money_app/theme.dart';
import 'package:money_app/views/action_card.dart';
import 'package:money_app/views/amount_screen.dart';
import 'package:money_app/views/balance_display.dart';
import 'package:money_app/views/transaction_list.dart';
import 'package:money_app/views/who_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late WalletController wallet;
  late TextEditingController controller;

  @override
  void initState() {
    wallet = Get.put(WalletController());
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              title: Text(
                widget.title,
                style: TextStyle(color: Theme.of(context).colorScheme.surface,
                fontSize: 15,
                fontWeight: FontWeight.w500),
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).colorScheme.primary,
              expandedHeight: 260,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background:
                    Container(color: Theme.of(context).colorScheme.primary,
                    child: Center(child:
                    GetX<WalletController>(
                      builder: (ctx) {
                        return BalanceDisplay(
                            pounds: ctx.money.pounds.toString(),
                            pennies: ctx.money.pennies.toString());
                      }
                    )),),
              ),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(80.0),
                  child: Transform.translate(
                      offset: const Offset(0, 40),
                      child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ActionCard(
                              onDeposit: () {
                                _handleDeposit(context);
                              },
                              onPayment: () {
                                _handlePayment(context);
                              }))))),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 60
            )
          ),
           SliverToBoxAdapter(
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Recent Activity", style: TextStyle(
                color: MainColorScheme.darkGrey,
                fontSize: 17,
                fontWeight: FontWeight.w500
              ),),
            ),
          ),
          TransactionList()
        ],
      ),
    );
  }

  Future<void> _handlePayment(BuildContext context) async {
    final String? who = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WhoScreen()),
    );
    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!context.mounted || who == null) return;

    final double? amount = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AmountScreen()),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!context.mounted || amount == null) return;

    wallet.pay(amount, who);
  }

  Future<void> _handleDeposit(BuildContext context) async {
    final double? amount = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AmountScreen()),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!context.mounted || amount == null) return;

    wallet.deposit(amount);
  }
}
