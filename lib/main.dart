import 'dart:convert';

import 'package:buytickets/model/DataModel.dart';
import 'package:buytickets/theme/CustomThem.dart';
import 'package:buytickets/ui/details/DetailsPage.dart';
import 'package:buytickets/ui/home/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeData,
      home:  const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

