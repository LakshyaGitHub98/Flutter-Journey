import 'package:flutter/material.dart';
class DataParsing extends StatelessWidget{
  final String data;
  DataParsing({required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Your Data")),
      body: Center(
        child:Text("$data",style: TextStyle(fontSize: 30),)
      ),
    );
  }
}