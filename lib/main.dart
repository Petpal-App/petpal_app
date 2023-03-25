import 'package:flutter/material.dart';
import 'dart:ui';
import 'screens/intro_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class AppColor {
  static const Color greenTambourine = Color.fromRGBO(12, 122, 61, 1);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
}

class MyApp extends StatelessWidget {
  ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Color.fromRGBO(12, 122, 61, 1),
      secondary: Color.fromRGBO(12, 122, 61, 1),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w700,
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
