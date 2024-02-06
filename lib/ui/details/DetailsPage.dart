import 'package:buytickets/model/DataModel.dart';
import 'package:buytickets/theme/CustomThem.dart';
import 'package:buytickets/widget/CustomDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsPage extends StatefulWidget {
  //const DetailsPage({super.key});

  const DetailsPage({super.key, required this.dataModel});

  final DataModel dataModel;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String dropdownValue = 'Good';
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 300,
            child: Image.asset(
              widget.dataModel.image!,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.dataModel.title!,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //button for review
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => CustomDailog(title: "Book",dropValue: dropdownValue,value: selectedOption),
                    ).then((value) {
                      final data = value as (int,String);
                      setState(() {
                        selectedOption = data.$1;
                        dropdownValue = data.$2;
                      });
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          )),
                      minimumSize: const Size(50, 40),
                      foregroundColor: Colors.white,
                      // Text Color (Foreground color)
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      backgroundColor: Colors.blue),
                  child: const Text("Review", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                ),
                RatingBar.builder(
                  ignoreGestures: true,
                  initialRating: widget.dataModel.rating!,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.blue,
                  ),
                  onRatingUpdate: (rating) {
                    // Handle rating update if needed
                  },
                ),
                Text(
                  dropdownValue,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Image.asset(
                  widget.dataModel.location!,
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 8),
                Text(widget.dataModel.address!),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //text for Refound
                Text(widget.dataModel.ref!),

                //text for price
                Text(
                  widget.dataModel.price!,
                  style: themeData.textTheme.bodyText1,
                ),
              ],
            ),
          ),
          //button for booking and show loader
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
            child: ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    10,
                  )),
                  minimumSize: const Size(216, 40),
                  foregroundColor: Colors.white,
                  // Text Color (Foreground color)
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  backgroundColor: Colors.blue),
              child: const Text("Book", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
            ),
          ),

        ],
      ),
    );
  }
}
