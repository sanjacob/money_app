import 'package:flutter/material.dart';
import 'package:money_app/views/send_form.dart';

class WhoScreen extends StatefulWidget {
  const WhoScreen({super.key});

  @override
  State<WhoScreen> createState() => _WhoScreenState();
}

class _WhoScreenState extends State<WhoScreen> {
  late TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();
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
            if (textController.value.text.isNotEmpty) {
              Navigator.of(context).pop(textController.value.text);
            }
          },
          title: "To who?",
          buttonText: "Pay",
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                enabled: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.white,
                  )
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.white,
                    )
                ),
              )),
          )),
        ),
      ),
    );
  }
}
