import 'package:flutter/material.dart';
import 'intro_page.dart';
import 'my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
        useMaterial3: true,
      ),
      initialRoute: '/', // Show the introductory page first
      routes: {
        '/': (context) => IntroPage(),
        '/home': (context) => MyHomePage(title: 'Calculator Home Page'),
      },
    );
  }
}