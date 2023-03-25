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
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.black,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontFamily: 'Montserrat',
          ),
          displayMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: 'Montserrat',
          ),
          displaySmall: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontFamily: 'Montserrat',
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      home: IntroScreen(),
    );
  }
}
