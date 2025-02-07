import 'dart:io';
// - For taking input in Dart , we have to import dart:io library

void main() {

  // - If / Else Statement
  print('Enter your age:');
  String? input = stdin.readLineSync();
  // An extra case if input is null
  int age=0;
  if (input != null) {
    age = int.parse(input);
  }
  if(age>=18){
    print("You are eligible for voting");
  }
  else{
    print("You are not eligible for voting");
  }

  // - Switch Case Statement
  print("Enter your grades: ");
  String? grade = stdin.readLineSync();
  if(grade==null){
    print("Please enter your grades !");
  }
  switch (grade) {
    case 'A':
      print('Excellent');
      break;
    case 'B':
      print('Good');
      break;
    case 'C':
      print('Average');
      break;
    default:
      print('Invalid grade');
  }

  //  LOOPING

  // - For Loop
  // for generating the even number using for loop
  int n = 10;
  List<int> evenNumbers = [];

  for (int i = 0; i < n; i++) {
    evenNumbers.add(2 * i);
  }
  print('First $n even numbers: $evenNumbers');
  print("");
  // - For in Loop
  List<int>numbers=[10,19,2,20];
  print("The numbers in the List: ");
  for (var num in numbers){
    print("Number =${num}");
  }
  print("");

  // - While Loop
  print("The number of fibbonaci series you want : ");
  input = stdin.readLineSync();
  if(input!=null){
    int n=int.parse(input);
  }
  print("Fibbonaci series upto ${n}: ");
  int a=0,b=1,i=0;
  while(i<n){
    print(a);
    int temp=a;
    a=b;
    b=temp+b;
    i++;
  }
  // - Do While Loop
  i=0;
  do{
    print('i=$i');
    i++;
  }while(i<5);

  // - Break Statement
  for (int i = 0; i < 5; i++) {
    if (i == 3) {
      break; // Exit the loop when i is 3
    }
    print('i = $i');
  }

  // - Continue Statement
  for (int i = 0; i < 5; i++) {
    if (i == 3) {
      continue; // Skip the iteration when i is 3
    }
    print('i = $i');
  }
}
