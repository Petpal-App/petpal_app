import 'package:flutter/material.dart';
import 'dart:ui';
import 'screens/intro_screen.dart';

void main() => runApp(MyApp());

class AppColor {
  static const Color greenTambourine = Color(0xFF20C20E);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
}

class MyApp extends StatelessWidget {
  ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Color(0xFF20C20E),
      secondary: Color(0xFF20C20E),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
    ),
  );

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
