import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'MY BMI APP'),
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
  var weightController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  String result = "";  // ✅ Class-level variable ensuring state persistence
  var bgColor=Colors.indigo.shade100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "BMI",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
                ),
                TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                    label: Text("Enter your weight (in kgs)"),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 40),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text("Enter your height (in feet)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 40),
                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                    label: Text("Enter your height (in inch)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    var wt = weightController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inchController.text.toString();

                    if (wt != "" || ft != "" || inch != "") {  // ✅ Keeping Your Exact Condition
                      var iwt = double.parse(wt);
                      var ift = double.parse(ft);
                      var iInch = double.parse(inch);
                      var tM = (((ift * 12) + iInch) * 2.54) / 100;
                      var bmi = iwt / (tM * tM);
                      var msg="";

                      if(bmi>25){
                        msg="You're over weight !";
                        bgColor=Colors.orange.shade200;
                      } else if(bmi<18){
                        msg="You're under weight !";
                        bgColor=Colors.red.shade200;
                      }
                      else{
                        msg="You're Healthy !!";
                        bgColor=Colors.green.shade200;
                      }
                      setState(() {  // ✅ Ensuring UI Refresh
                        result = "$msg \nYour BMI is ${bmi.toStringAsFixed(4)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill all the required fields!";
                      });
                    }
                  },
                  child: Text("Calculate", style: TextStyle(color: Colors.indigo)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(result, style: TextStyle(fontSize: 19)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}