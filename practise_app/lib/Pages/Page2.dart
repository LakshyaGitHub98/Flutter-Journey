import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(title: Text("Page 2")),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child:ElevatedButton(
              child:Text("Back to Page 1"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:const EdgeInsets.all(16.0),
              child: Container(
                child: Text("# Created By LAKSHYA 😁",style:TextStyle(fontWeight: FontWeight.w600,color: Colors.white,)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child:Container(
                height: 150,
                width: 100,
                child: Image.asset("assets/images/Photo1.jpg"),
              ),
            ),
          ),
        ],
      )
    );
  }
}