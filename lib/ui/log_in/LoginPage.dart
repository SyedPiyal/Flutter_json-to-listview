

import 'package:buytickets/ui/home/MyHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,toolbarHeight: 10),
      body: Column(
        children: [
        Hero(
        tag: "Welcome",
        child: Image.asset("assets/images/homePage.png",)),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Welcome To Login Page",style: TextStyle (color: Colors.black,fontSize: 20),),
          ),

          //user name field
          Padding(
            padding: const EdgeInsets.only(top: 50,bottom: 8,left: 25,right: 25),
            child: TextField(
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'User Name',
                  filled: true,
                  fillColor: const Color(0xFFf3f3f2),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xff1393c6), width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  //labelText: "01266",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color(0xff1393c6), width: 1,

                    ),
                  ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(0xff1393c6), width: 1),
                    borderRadius: BorderRadius.circular(10)),
              ),

              keyboardType: TextInputType.text,
            ),
          ),
          //password field
          Padding(
            padding: const EdgeInsets.only(top: 35,bottom: 8,left: 25,right: 25),
            child: TextField(
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: const Icon(Icons.lock),
                hintText: 'Enter Password',
                filled: true,
                fillColor: const Color(0xFFf3f3f2),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(0xff1393c6), width: 1),
                    borderRadius: BorderRadius.circular(10)),
                //labelText: "01266",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xff1393c6), width: 1,

                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(0xff1393c6), width: 1),
                    borderRadius: BorderRadius.circular(10)),
              ),

              keyboardType: TextInputType.text,
            ),
          ),

          // button for log in
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
            child:  ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage(title: "Home Page")));
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      )),
                  minimumSize: const Size(250, 40),
                  foregroundColor: Colors.white,
                  // Text Color (Foreground color)
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  backgroundColor: Colors.blue),
              child: const Text("Log in", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
            ),
              //child: const Text("Book", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
            ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Do not have an Account?",style: TextStyle (color: Colors.black)),
              SizedBox(width: 10,),
              Text("Sign Up", style: TextStyle (color: Colors.red),)
            ],
          )
        ],
      ),
    );
  }
}