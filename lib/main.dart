import 'dart:convert';

import 'package:buytickets/model/DataModel.dart';
import 'package:buytickets/theme/CustomThem.dart';
import 'package:buytickets/ui/DetailsPage.dart';
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String title = "";
  int currentPageIndex = 0;

  List<DataModel> _listData = [];
  List<DataModel> _results = [];

  @override
  void initState() {
    super.initState();
    // Load initial data
    _loadData();
  }
  void _loadData() async {
    _listData = await ReadJsonData();
    setState(() {
      _results = _listData;
    });
  }
  void _handleSearch(String input) {
    setState(() {
      _results = _listData
          .where((item) =>
      item.title!.toLowerCase().contains(input.toLowerCase()) ||
          item.address!.toLowerCase().contains(input.toLowerCase()))
          .toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        //Image.asset("assets/images/back.jpg"),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        //Theme.of(context).colorScheme.inversePrimary,
        title: const Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text("DUBAI,UNITED ARAB EMIRATES",
                    style: TextStyle(fontSize: 12.5, color: Colors.white70))),
            Row(
              children: [
                Text("01 Nov,24",
                    style: TextStyle(fontSize: 12.5, color: Colors.white70)),
                Text("-",
                    style: TextStyle(fontSize: 12.5, color: Colors.white70)),
                Text("01 Dec,24",
                    style: TextStyle(fontSize: 12.5, color: Colors.white70)),
                Text(" | ",
                    style: TextStyle(fontSize: 12.5, color: Colors.white70)),
                Text("30 Night",
                    style: TextStyle(fontSize: 12.5, color: Colors.white70)),
                Text(" | ",
                    style: TextStyle(fontSize: 12.5, color: Colors.white70)),
                Text("1 Room,1 Adult",
                    style: TextStyle(fontSize: 12.5, color: Colors.white70)),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.blue,),
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(top: 8,bottom: 8,left: 25,right: 25),
              child: TextField(
                onChanged: _handleSearch,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search by Hotel name',
                  filled: true,
                  fillColor: const Color(0xFFf3f3f2),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFFf3f3f2), width: 0),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFf3f3f2)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 13),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          Container(
            child:  Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child:
                Text('${_results.length} ${_results.length == 1 ? 'Hotel' : 'Hotels'} Found',
                    style: Theme.of(context).textTheme.headline1),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 550,
                child: ListView.builder(
                  itemCount: _results.length,
                  itemBuilder: (context, index) {
                    final data = _results[index];
                    return GestureDetector(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 160,
                            child: Image.asset(
                              data.image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data.title!,
                                    style: Theme.of(context).textTheme.headline2),
                                RatingBar.builder(
                                  ignoreGestures: true,
                                  initialRating: data.rating!,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20,
                                  itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    // Handle rating update if needed
                                  },
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                data.location!,
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(data.address!),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(data.ref!),
                              Text(data.price!,style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                          const Divider(), // Optional: Add a divider between items
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(dataModel: _results[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<DataModel>>ReadJsonData() async {
    final jsonData = await rootBundle.loadString('assets/jsonfile/data.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => DataModel.fromJson(e)).toList();
  }
}