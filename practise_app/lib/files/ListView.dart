import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My First App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ListView Example'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body:ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                color: Colors.red,
                child: Center(
                    child: Text("List Item 1",style: TextStyle(color: Colors.white,fontWeight:FontWeight.w700),)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                color: Colors.green,
                child: Center(
                    child: Text("List Item 2",style: TextStyle(color: Colors.white,fontWeight:FontWeight.w700))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                color: Colors.blue,
                child: Center(child: Text("List Item 3",style: TextStyle(color: Colors.white,fontWeight:FontWeight.w700))
                ),
              ),
            ),
          ],
        )
    );
  }
}

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100, // Number of items in the list
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item ${index+1} )'),
        );
      },
    );
  }
}
class MySeparatedListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 50, // Number of items in the list
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item ${index+1}'),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(); // Separator between items
      },
    );
  }
}


