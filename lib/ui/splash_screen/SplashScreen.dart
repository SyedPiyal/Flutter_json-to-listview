

import 'package:buytickets/ui/log_in/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(backgroundColor: Colors.white),
     body: Container(
       child: Center(
         child: InkWell(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
           },
           child: Hero(
             tag: "Welcome",
             child: Image.asset("assets/images/homePage.png",
             height: 200,width: 200,),
             
           ),
         ),
       ),
     ),
   );
  }

}