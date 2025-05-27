import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practise_app/main.dart';
class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 5),(){  
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>MyHomePage(title: "Home Page")));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:Colors.blue,
        child: Center(
          child: Text("Splash Screen ",
            style: TextStyle(
                color: Colors.white,
                fontSize:34,
                fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
    );
  }
}