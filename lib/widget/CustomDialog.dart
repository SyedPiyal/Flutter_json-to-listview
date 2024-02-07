
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomDailog extends StatefulWidget {
  const CustomDailog({super.key, required this.title, required this.value, required this.dropValue, required this.ratingValue});
  @override
  State<CustomDailog> createState() => _CustomDailogState();
  final String title;

  final String value;
  final String dropValue;

  final double ratingValue;



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
    ratingValue =widget.ratingValue;
  }

  String selectedOption = "Yes";

  String dropdownValue = 'Good';

  double ratingValue = 1.5;



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  const Text("Are You Happy With the Design ?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
      content: Container(
        height: 150,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //radio button
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
                      value: "Yes",
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
                    value: "No",
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
                initialRating: ratingValue,
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
                  ratingValue = rating!;
                },
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop((selectedOption,dropdownValue,ratingValue));
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