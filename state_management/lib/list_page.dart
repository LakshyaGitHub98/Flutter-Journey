import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/add_data.dart';
import 'list_map_provider.dart';
import 'add_data.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: Consumer<ItemProvider>(
        builder: (ctx, provider, __) {
          var data = provider.getItems;
          return data.isNotEmpty
              ? ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              final item = data[index];
              return ListTile(
                title: Text(item['name'] ?? 'No Name'),
                subtitle: Text(item['mobNo'] ?? 'No Number'),
              );
            },
          )
              : Center(child: Text("No contact yet"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddData()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}