import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/counter_provider.dart';
import 'package:state_management/theme_provider.dart';
void main() {
  runApp(MyApp());
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
          ),
          home: HomePage(),
        ),
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
