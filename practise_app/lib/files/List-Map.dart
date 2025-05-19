import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
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
      home: const MyHomePage(title: 'List Map Example'),
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
  var arrData=[
    {"name": "Rajeev", "mobno": "9839953414", "unread": 1},
    {"name": "Amit", "mobno": "9876543210", "unread": 3},
    {"name": "Neha", "mobno": "8765432109", "unread": 2},
    {"name": "Vikas", "mobno": "7654321098", "unread": 5},
    {"name": "Priya", "mobno": "6543210987", "unread": 0},
    {"name": "Ramesh", "mobno": "5432109876", "unread": 4},
    {"name": "Suman", "mobno": "4321098765", "unread": 6},
    {"name": "Alok", "mobno": "3210987654", "unread": 2},
    {"name": "Pooja", "mobno": "2109876543", "unread": 3},
    {"name": "Suresh", "mobno": "1098765432", "unread": 7},
    {"name": "Rahul", "mobno": "9988776655", "unread": 1},
    {"name": "Swati", "mobno": "8877665544", "unread": 8},
    {"name": "Kiran", "mobno": "7766554433", "unread": 2},
    {"name": "Gopal", "mobno": "6655443322", "unread": 4},
    {"name": "Meena", "mobno": "5544332211", "unread": 3},
    {"name": "Arjun", "mobno": "4433221100", "unread": 9},
    {"name": "Sneha", "mobno": "3322110099", "unread": 5},
    {"name": "Manish", "mobno": "2211009988", "unread": 6},
    {"name": "Varun", "mobno": "1100998877", "unread": 0},
    {"name": "Anjali", "mobno": "9998887776", "unread": 2}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
        body:Container(
          child: ListView(
            //scrollDirection: Axis.horizontal,
            children:arrData.map((value){
              return ListTile(
                leading: Icon(Icons.account_circle),
                title: Text(value['name'].toString()),
                subtitle:Text(value['mobno'].toString()),
                trailing: CircleAvatar(radius: 21,backgroundColor: Colors.green,child: Text(value['unread'].toString())),
              );
            }).toList()
          )
        )
    );
  }
}
