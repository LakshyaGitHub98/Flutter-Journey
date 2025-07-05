import 'package:flutter/material.dart';
import 'list_map_provider.dart';
import 'package:provider/provider.dart';

class AddData extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title: Text("Add Data"),
      ) ,
      body: Center(
        child: IconButton(onPressed: () {
    context.read<ItemProvider>().addItem({
    "id": DateTime.now().millisecondsSinceEpoch.toString(), // Unique ID
    "name": "Lakshya",
    "mobNo": "9839953414",
    });
    },
       icon:Icon(Icons.add)
      ),
    )
    );
  }
}