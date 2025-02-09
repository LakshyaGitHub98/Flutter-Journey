import 'dart:io';
// All about functions in Dart
// There are all ten  types of functions in dart
/*
1.Named Functions(Consider returnable, non-returnable, parameterized and non-parameterized )

2.Anonymous Functions (Lambda Functions)

3.Arrow Functions(Short Syntax Functions )

4.Higher - Order Functions (Functions those can contain other functions)

5.Static Functions (Functions associated with a class but not with any instance of it)

6.Instances Methods (Functions that can operate with any instance of class in which it is )

7.Getter and Setter Functions (Functions to access or modify properties of a class)

8.Anonymous Greater Functions (Functions that generate values using sync* or async*)

9.Asynchronous Functions (Functions built using async and await keywords)

10.Closer Functions (Functions that capture variables from their lexical scope)

*/

// 1.Named Functions
int add(int a,int b){
  return a+b;
}// - Parameterised and Returnable Function
int add_d(){
  int a=10,b=5;
  return a+b;
}// - Non-parameterised and Returnable Function
void print_names(){
  List<String>names=["Anuj","Ayush","Lakshya","Piyush","Ashutosh","Ram"];
  int i=1;
  print("");
  for(var name in names){
    print("$i : $name");
    i++;
  }
  print("");
}// -Non-parameterized and non-Returnable Functions
void take_names(List<String>names){
  int i=1;
  print("");
  for(var name in names){
    print("$i : $name");
    i++;
  }
  print("");
}// -Parameterized and non-Returnable Functions

// 2.Anonymous Functions (Lambda Functions)
var multiply = (int a, int b) {
  return a * b;
}; // We can directly use without using any name of functions -- (arguments){expressions}

// 3.Arrow Functions(Short Syntax Functions )

int add_arrow(int a,int b)=> a+b; // (parameter)=>expressions;

// 4.Higher - Order Functions (Functions those can contain other functions)

void executeFunction(Function func) {
  func();
}// Higher Order Function

// It can take functions as arguments and also have capability to return functions
void sayHello() {
  print('Hello, World!');
}// Argument Function

// 5.Static Functions (Functions associated with a class but not with any instance of it)

class Configuration {
  static const String apiUrl = 'https://api.example.com';
}

// 6.Instances Methods (Functions that can operate with any instance of class in which it is )

class MyClass {
  // Instance variable
  String name;

  // Constructor
  MyClass(this.name);

  // Instance method
  void greet() {
    print('Hello, $name!');
  }
}

// 7.Getter and Setter Functions (Functions to access or modify properties of a class)

class Person {
  // Private instance variable
  String _name;

  // Constructor
  Person(this._name);

  // Getter for name
  String get name => _name;

  // Setter for name
  set name(String value) {
    _name = value;
  }
}

// 8.Anonymous Greater Functions (Functions that generate values using sync* or async*)

Iterable<int> syncGenerator(int n) sync* {
  for (int i = 0; i < n; i++) {
    yield i;
  }
}// Synchronous Functions
Stream<int> asyncGenerator(int n) async* {
  for (int i = 0; i < n; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}// Asynchronous Functions -- These functions are used to fetch data from database , server and in running time , other functions also run at same time

// 9.Asynchronous Functions (Functions built using async and await keywords)

Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2)); // Simulate a network request
  return 'Data fetched';
}

// 10.Closer Functions (Functions that capture variables from their lexical scope)

Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}
// Functions to capture and remember variables from their lexical scope

//Using those all functions
void main() async{
  // 1.Named Functions
  print("Named functions is used : ");
  print("Parameterised and Returnable Function (add(2,3)) =>  ${add(2,3)} ");
  print("Non-parameterised and Returnable Function (add_d()) =>  ${add_d()} ");
  stdout.write("Non-parameterised and Non-returnable Function (print_names())=>");
  print_names();
  List<String>names=["Anuj","Ayush","Lakshya","Piyush","Ashutosh","Ram"];
  stdout.write("Parameterised and Non-returnable Function (print_names())=>");
  take_names(names);
  // 2.Anonymous Functions (Lambda Functions)
  print("Anonymous Function is used :");
  print(multiply(2, 3)); // Output: 6
  // 3.Arrow Functions
  print("Arrow Function is used :");
  print("Add Arrow (2,3) : ${add_arrow(2,3)}");
  // 4.Higher - Order Functions (Functions those can contain other functions)
  print("Higher - Order  Function is used :");
  executeFunction(sayHello);
  // 5.Static Function
  print("Static  Function is used :");
  print(Configuration.apiUrl);
  // 6.Instances Methods - Mainly known as methods
  print("Instances  Method is used :");
  var myObj=new MyClass("Lakshya");
  myObj.greet();
  // 7.Getter and Setter Functions (Functions to access or modify properties of a class)
  print("Getter and Setter Functions  are used :");
  var person=Person("Simar");
  print(person.name);// Using getter function
  person.name="Lakshya";//Using setter function
  print("After using setter, Name: ${person.name}");
  // 8.Anonymous Greater Functions
  print("Anonymous Greater Functions is used : ");
  // Synchronous Generator
  print("Synchronous Generator : ");
  var generator = syncGenerator(5);
  for (var value in generator) {
    print(value);
  }
  // Asynchronous Generator
  print("Asynchronous Generator : ");
  var generator_ = asyncGenerator(5);
  await for (var value in generator_) {
    print(value);
  }
  // 9.Asynchronous Function
  print("Asynchronous Functions is used : ");
  print(fetchData());
  // 10.Closer Function
  print("Closer Function is used : ");
  var addi=makeAdder(2);
  print("Default:$addi");
  print("Adding 2:${addi(2)}");
  print("Adding 3:${addi(3)}");
}
