import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class ActionCard extends StatelessWidget {
  const ActionCard({super.key, required this.onDeposit, required this.onPayment});

  final Function onDeposit;
  final Function onPayment;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.surface,
        ),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => onPayment(),
              icon: Column(children: [
                SvgPicture.asset("assets/send_funds.svg", height: 60,),
                const Text("Pay",
                  style: TextStyle(fontWeight: FontWeight.w500),)]
              ),
            ),
            IconButton(
              onPressed: () => onDeposit(),
              icon: Column(children: [
                SvgPicture.asset("assets/add_funds.svg", height: 60,),
                const Text("Top up",
                  style: TextStyle(fontWeight: FontWeight.w500),)]),
            )
          ],
        ),
      ),
    );
  }
}
