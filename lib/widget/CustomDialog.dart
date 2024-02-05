
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDailog extends StatelessWidget {
  CustomDailog({required this.title, required this.content});

final String title;
final String content;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Alert Dialog Box"),
            content: const Text("You have raised a Alert Dialog Box"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Container(
                  color: Colors.green,
                  padding: const EdgeInsets.all(14),
                  child: const Text("okay"),
                ),
              ),
            ],
          ),
        );
      },
      child: const Text("Show alert Dialog box"),
    );
  }
}