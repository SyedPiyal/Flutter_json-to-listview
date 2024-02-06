
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDailog extends StatefulWidget {
  const CustomDailog({super.key, required this.title, required this.value, required this.dropValue});
  @override
  State<CustomDailog> createState() => _CustomDailogState();
  final String title;

  final int value;
  final String dropValue;


}

class _CustomDailogState extends State<CustomDailog>{

  @override
  void initState() {
    super.initState();
    // Load initial data
    _loadData();
  }

  void _loadData() async {
    selectedOption = widget.value;
    dropdownValue = widget.dropValue;
  }

  int selectedOption = 1;

  String dropdownValue = 'Good';



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  const Text("Are You Happy With the Design ?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
      content: Container(
        height: 200,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: const Text('Yes'),
              leading: Radio(
                value: 1,
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('No'),
              leading: Radio(
                value: 2,
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),

            // Step 2.
            DropdownButton<String>(
              // Step 3.
              value: dropdownValue,
              // Step 4.
              items: <String>['Good', 'Not Good', 'Bad', 'Best']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 30),
                  ),
                );
              }).toList(),
              // Step 5.
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            ),

          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop((selectedOption,dropdownValue));
          },
          child: Container(
            color: Colors.deepOrangeAccent,
            padding: const EdgeInsets.all(14),
            child: const Text("okay"),
          ),
        ),
      ],
    );
  }
}