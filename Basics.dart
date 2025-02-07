void main() {
  var a = 42;
  var b = 3.14;
  var c = 'Hello, Dart!';
  var d = true;
  var e = [1, 2, 3];
  var f = {'key': 'value'};

  print('The type of a is ${a.runtimeType}');
  print('The type of b is ${b.runtimeType}');
  print('The type of c is ${c.runtimeType}');
  print('The type of d is ${d.runtimeType}');
  print('The type of e is ${e.runtimeType}');
  print('The type of f is ${f.runtimeType}');

  int age = 25;
  double height = 5.9;
  String name = 'John Doe';
  bool isStudent = true;
  List<int> numbers = [1, 2, 3, 4, 5];
  Map<String, int> scores = {'Alice': 90, 'Bob': 85};
  Set<String> colors = {'red', 'green', 'blue'};
  Runes input = Runes('\u{1F600}'); // Smiley face emoji
  Symbol symbol = #symbolName;
  Null value = null;

}
