import 'package:flutter/material.dart';
import 'package:money_app/home.dart';
import 'package:money_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoneyApp',
      theme: ThemeData(
        colorScheme: MainColorScheme.scheme
      ),
      home: const MyHomePage(title: 'MoneyApp'),
    );
  }
}
