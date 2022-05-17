import 'package:flutter/material.dart';
import 'package:mattbank/screens/dashboard.dart';

void main() async {
  runApp(const MattBankApp());
}

class MattBankApp extends StatelessWidget {
  const MattBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.teal[400],
            colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: Colors.teal[400], secondary: Colors.cyanAccent[700]),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.cyanAccent[700])))),
        home: const Dashboard());
  }
}
