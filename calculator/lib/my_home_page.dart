import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'widgets/Calculator Button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController displayController = TextEditingController();

  String currentInput = '';
  String fullExpression = '';

  void updateDisplay(String expression, String result) {
    // Display the full expression and result on separate lines
    displayController.text = '$expression\n$result';
  }

  void onButtonPressed(String label) {
    setState(() {
      if (label == 'A/C') {
        // Clear everything
        currentInput = '';
        fullExpression = '';
        updateDisplay('', '0');
      } else if (label == '=') {
        // Evaluate the full expression
        try {
          Parser parser = Parser();
          Expression exp = parser.parse(fullExpression + currentInput);
          double result = exp.evaluate(EvaluationType.REAL, ContextModel());
          updateDisplay(fullExpression + currentInput + ' =', result.toString());

          // Reset for next operation
          currentInput = result.toString();
          fullExpression = '';
        } catch (e) {
          updateDisplay('', 'Error');
        }
      } else {
        // Append input or operator to the full expression
        if (label == '+' || label == '-' || label == '*' || label == '/') {
          fullExpression += currentInput + ' ' + label + ' ';
          currentInput = '';
        } else {
          currentInput += label;
        }
        updateDisplay(fullExpression, currentInput);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.grey,
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerRight,
                child: TextField(
                  controller: displayController,
                  readOnly: true,
                  style: TextStyle(fontSize: 40, color: Colors.white),
                  decoration: InputDecoration(border: InputBorder.none),
                  textAlign: TextAlign.right,
                  maxLines: 2, // Allows for two lines (expression and result)
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: CalculatorButton(label: "A/C", onPressed: () => onButtonPressed("A/C")),
                  ),
                  Expanded(
                    child: CalculatorButton(label: "*", onPressed: () => onButtonPressed("*")),
                  ),
                  Expanded(
                    child: CalculatorButton(label: "/", onPressed: () => onButtonPressed("/")),
                  ),
                  Expanded(
                    child: CalculatorButton(label: ".", onPressed: () => onButtonPressed(".")),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: CalculatorButton(label: "1", onPressed: () => onButtonPressed("1")),
                  ),
                  Expanded(
                    child: CalculatorButton(label: "2", onPressed: () => onButtonPressed("2")),
                  ),
                  Expanded(
                    child: CalculatorButton(label: "3", onPressed: () => onButtonPressed("3")),
                  ),
                  Expanded(
                    child: CalculatorButton(label: "+", onPressed: () => onButtonPressed("+")),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: CalculatorButton(label: "4", onPressed: () => onButtonPressed("4")),
                  ),
                  Expanded(
                    child: CalculatorButton(label: "5", onPressed: () => onButtonPressed("5")),
                  ),
                  Expanded(
                    child: CalculatorButton(label: "6", onPressed: () => onButtonPressed("6")),
                  ),
                  Expanded(
                    child: CalculatorButton(label: "-", onPressed: () => onButtonPressed("-")),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: CalculatorButton(label: "7", onPressed: () => onButtonPressed("7")),
                  ),
                  Expanded(
                    child: CalculatorButton(label: "8", onPressed: () => onButtonPressed("8")),
                  ),
                  Expanded(
                    child: CalculatorButton(label: "9", onPressed: () => onButtonPressed("9")),
                  ),
                  Expanded(
                    child: CalculatorButton(label: "=", onPressed: () => onButtonPressed("=")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}