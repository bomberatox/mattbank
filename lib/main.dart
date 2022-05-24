import 'package:flutter/material.dart';
import 'package:mattbank/http/webclient.dart';
import 'package:mattbank/screens/dashboard.dart';

void main() async {
  runApp(const MattBankApp());
  findAll();
}

class MattBankApp extends StatelessWidget {
  const MattBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.cyan[800],
            colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: Colors.cyan[800], secondary: Colors.cyanAccent[700]),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.cyanAccent[700])))),
        home: const Dashboard());
  }
}
