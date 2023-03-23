import 'package:flutter/material.dart';
import 'screens/intro_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'Montserrat',
      ),
      home: IntroScreen(),
    );
  }
}
