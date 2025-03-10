import 'package:flutter/material.dart';
import 'Page2.dart';
class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(title: Text("Page 1")),
      body: Stack(
        children: [
          Center(
            child: Container(child: Text(
              "Move to Page 2",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
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
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Adds space from the edges
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Page2()),
                  );
                },
                child: Icon(Icons.arrow_forward), // Arrow icon
              ),
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
          )
        ],
      )
    );
  }
}