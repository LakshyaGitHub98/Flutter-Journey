// OOPS  -- Object Oriented Programming
// OOPS contains 4 basic pillars-
// 1.Encapsulation
// 2.Inheritance
// 3.Polymorphism
// 4.Abstraction

// 1.Encapsulation- Bundling of data and member functions
class Car{
  String model;
  int year;
  Car(this.model,this.year);//Constructor
  void display(){
    print("Car model:$model, Year:$year ");
  }
}// Claas and Objects
class Student{
  late String _name;//Private variable using "_"
  String get name=>_name;// Getter
  //Setter
  set name(String name){
    _name=name;
  }
}// Class using private variables
class BankAccount{
  double _balance=0.0;

  //Getter for balance
  double get balance=> _balance;
  //Setter for balance
  set deposit(double amount){
    if(amount>0){
      _balance+=amount;
    }
  }
}// Getter and Setter

// 2.Inheritance
class Animal{
  String name;
  Animal(this.name);
  void display(){
    print("Animal Name : $name");
  }
  void sound(){
    print("Animal is making sounds ");
  }
  void eat(){
    print("Eating");
}
}// Base class
class Dog extends Animal{
  Dog(String name):super(name);
  void bark(){
    print("Barking");
  }
  @override
  void sound(){
    print("Barks");
  }

}// Derived class

// 3.Polymorphism
abstract class Shape{
  void draw();
}
class Circle implements Shape{
  @override
  void draw(){
  print("Drawing Circle");
  }
}
class Square implements Shape{
  @override
  void draw(){
    print("Drawing Square");
}
}

// 4.Abstraction

// Abstract Class - Can contain Concrete and Abstract Methods both
// Interface - Only contain Abstract Methods

void main(){
  // 1. Encapsulation
  print("Encapsulation : ");
  Car car=new Car("XYZ",19);
  car.display();
  Student student=new Student()
    .._name="Lakshya";
  print("Student's Name : ${student.name}");
  // 2.Inheritance
  print("Inheritance : ");
  Dog dog=new Dog("Tommy ");
  dog.bark();//Special Method
  dog.eat();
  dog.sound();//Override Method
  // 3.Polymorphism
  Circle circle=new Circle();
  Square square=new Square();
  circle.draw();
  square.draw();
  // 4. Abstraction is used in up so don't I need to override it again
}

