import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'numberProvider.dart';
import 'themeProvider.dart';
import 'homescreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NumberProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Provider Demo',
          theme: themeProvider.themeData,
          home: const MyHomePage(),
        );
      },
    );
  }
}