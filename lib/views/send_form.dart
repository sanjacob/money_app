import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendForm extends StatelessWidget {
  const SendForm(
      {super.key,
      required this.buttonText,
      required this.child,
      required this.title,
      required this.onPress});
  final String buttonText;
  final Widget child;
  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 45.0, top: 30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.surface),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: child
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => onPress(),
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor:
                    Theme.of(context).colorScheme.surface.withAlpha(100),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Text(this.buttonText,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
            ),
          )
        ],
      ),
    );
  }
}
