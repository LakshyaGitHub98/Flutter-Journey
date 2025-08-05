import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'numberProvider.dart';
import 'themeProvider.dart';
import 'second.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, this.title = "Home Page"});

  @override
  Widget build(BuildContext context) {
    return Consumer2<NumberProvider, ThemeProvider>(
      builder: (context, numberProvider, themeProvider, _) {
        final numbers = numberProvider.numbers;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(title),
            actions: [
              IconButton(
                icon: const Icon(Icons.brightness_6),
                onPressed: themeProvider.toggleTheme,
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                child: Text(
                  numbers.length.toString(),
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: numbers.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        numbers[index].toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondPage(),
                    ),
                  );
                },
                child: const Text(
                  "Second",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              numberProvider.addNumber();
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}