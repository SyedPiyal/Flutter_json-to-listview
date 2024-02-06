import 'dart:core';

import 'package:flutter/cupertino.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer(
      {required this.child, required this.height});

  final Widget child;
  final double height;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
    );
  }
}
