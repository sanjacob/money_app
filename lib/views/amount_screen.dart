import 'package:flutter/material.dart';
import 'package:money_app/models/balance.dart';
import 'package:money_app/views/balance_display.dart';
import 'package:money_app/views/number_keyboard.dart';
import 'package:money_app/views/send_form.dart';

class AmountScreen extends StatefulWidget {
  const AmountScreen({super.key});

  @override
  State<AmountScreen> createState() => _AmountScreenState();
}

class _AmountScreenState extends State<AmountScreen> {
  late Balance balance;

  @override
  void initState() {
    balance = Balance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.primary,
          actions: [
            IconButton(
                onPressed: () => {Navigator.of(context).pop()},
                icon: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Theme.of(context).colorScheme.surface),
                    child: Icon(
                      Icons.close,
                      color: Theme.of(context).colorScheme.primary,
                    )))
          ]),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SendForm(
          onPress: () {
            if (balance.toDouble() != 0.0) {
              Navigator.of(context).pop(
                balance.toDouble());
            }
          },
          title: "How much?",
          buttonText: "Next",
          child:  Center(
              child: Column(
                children: [
                   Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: BalanceDisplay(
                        pounds: balance.pounds,
                        pennies: balance.pennies),
                  ),
                  NumberKeyboard(onPress: (char) {
                    setState(() {
                      balance.handleChar(char);
                    });
                  }),
                ],
              )
              )
        ),
      ),
    );
  }
}
