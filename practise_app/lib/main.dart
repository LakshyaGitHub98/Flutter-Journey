import 'package:flutter/material.dart';
import 'package:practise_app/files/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My First App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:[Colors.black, Colors.deepPurple, Colors.blueGrey],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        ),
        child: Center( // Ensures everything is centralized
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 18)],
                  ),
                  child: const Text(
                    "Welcome to My App",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24, // Larger font size for emphasis
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: _increaseCounter,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(12.0),
                    foregroundColor: Colors.deepPurple,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text("Show your love ❤️",style: TextStyle(color:Colors.black),),
                ),
                const SizedBox(height: 20),
                Text(
                  "❤️ Count: $_counter",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increaseCounter,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.favorite, color: Colors.white),
    )
    );
  }
}