import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'numberProvider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NumberProvider>(
      builder: (context, numberProvider, _) {
        final numbers = numberProvider.numbers;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Second Page"),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: numbers.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        "Number: ${numbers[index]}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  numberProvider.addNumber();
                },
                icon: const Icon(Icons.add),
                label: const Text("Add Number"),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}