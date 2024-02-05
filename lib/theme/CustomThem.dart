
import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
  ),

  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 15,color: Colors.black45,fontWeight: FontWeight.bold),
    headline2: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 20,color: Colors.blue)
  ),

);