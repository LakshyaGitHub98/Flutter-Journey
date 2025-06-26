import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/counter_provider.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
          create:(_)=>CounterProvider(),
          child: HomePage(),
      ),
    );
  }
}
class HomePage extends StatelessWidget {
 int _count=0;
  @override
  Widget build(BuildContext context) {
    print("Build Function called");
    return Scaffold(
      appBar: AppBar(
        title:Text("Home"),
      ),
      body: Center(
        child: Consumer(builder: (cntxt,_,__){
          print("Consumer function called");
          return Text(
            // "${Provider.of<CounterProvider>(cntxt,listen: true).getcount()}",
            '${cntxt.watch<CounterProvider>().getcount()}',
            style:TextStyle(fontSize: 25),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        //Provider.of<CounterProvider>(context,listen: false).incrementcounter();
        context.read<CounterProvider>().incrementcounter();
      },
        child: Icon(Icons.add),
      ),
    );
  }
}
