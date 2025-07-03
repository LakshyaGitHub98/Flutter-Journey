import 'package:flutter/material.dart';
import 'package:shared_preferences/';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => MaterialApp(
          title: 'Flutter Provider Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(brightness: Brightness.dark),
          ),
          home: MainScaffold(),
        ),
      ),
    );
  }
}
