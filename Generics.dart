///Generics in Dart are like creating a template for your code.
// Custom List Example using Generics with 'T'  character
class Custom_List<T>{
  List<T>elements=[];
  Custom_List(this.elements);
  void add_e(T element){
    elements.add(element);
  }
  List<T>getElements(){
    return elements;
  }
}
// Creating a Generics class of box
class Box<T>{
  T item;
  Box(this.item);
  T getItem(){
    return item;
  }
}
// Using it, we have to create a special box class for each value , we just have to declare it type at time of using it , which allow it toi use  for multiple time more.

// This is example which shows that using generics, we can take make classes using another class as it's type.
class Animal {
  void makeSound() {
    print('Some generic animal sound');
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print('Woof!');
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print('Meow!');
  }
}

class AnimalShelter<T extends Animal> {
  T animal;

  AnimalShelter(this.animal);

  void makeAnimalSound() {
    animal.makeSound();
  }
}

void main() {
  //Custom List's example use
  Custom_List<String>names=new Custom_List(["Lakshya","Anuj","Ayush"]);
  names.add_e("Aakash");
  Custom_List<int>numbers=new Custom_List([12,34,65,90]);
  numbers.add_e(4);
  // Box's example use
  Box<String>clothes=new Box("Shirts");
  Box<int>lights=new Box(50);
  Box<List<String>>employees_gifts=new Box(["ABC","XYZ","PQR"]);
  // Animal Shelter's example use
  AnimalShelter<Dog> dogShelter = AnimalShelter(Dog());
  dogShelter.makeAnimalSound(); // Outputs: Woof!
  AnimalShelter<Cat> catShelter = AnimalShelter(Cat());
  catShelter.makeAnimalSound(); // Outputs: Meow!
}


