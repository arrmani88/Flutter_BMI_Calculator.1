// import 'dart:js';

import 'package:bmi_calculator/ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/homePage.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/first': (context) => ResultPage(),
      },
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff070918),
        scaffoldBackgroundColor: Color(0xff0B0D22),
      ),
    ),
  );
}