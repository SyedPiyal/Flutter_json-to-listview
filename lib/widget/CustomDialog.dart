
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
        height: 150,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListTile(
                    horizontalTitleGap: 0.5,
                    dense:true,
                    title: const Text('Yes',style: const TextStyle(fontSize: 16)),
                    leading: Radio(
                      activeColor: Colors.blue,
                      value: 1,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(child:
                ListTile(
                  horizontalTitleGap: 0.5,
                  dense:true,
                  title: const Text('No',style: const TextStyle(fontSize: 16)),
                  leading: Radio(
                    activeColor: Colors.blue,
                    value: 2,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                ),),

              ],
            ),

            // drop down menu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("How Much ?",style: TextStyle(color: Colors.black)),
                DropdownButton<String>(
                  value: dropdownValue,
                  items: <String>['Good', 'Not Good', 'Bad', 'Best']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 15),
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

            //rating bar for review
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: RatingBar.builder(
                ignoreGestures: false,
                initialRating: 2.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 25,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.blue,
                ),
                onRatingUpdate: (rating) {
                  // Handle rating update if needed
                },
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop((selectedOption,dropdownValue));
          },
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.blue,
            ),
            padding: const EdgeInsets.all(14),
            child: const Text("Okay",style: TextStyle(color: Colors.black87),textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }
}