import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list_map_provider.dart';
import 'list_page.dart';
import 'counter_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ItemProvider()),
        ChangeNotifierProvider(create: (context) => CounterProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD with Provider',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: ListPage(),
    );
  }
}