
import 'package:bmi/result_screen.dart';
import 'package:bmi/screen_home.dart';
import 'package:flutter/material.dart';

import 'constants.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Constants.primary),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Constants.primary,
          titleTextStyle: TextStyle(
            color: Constants.text,
            fontSize: 24
          )
        ),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

