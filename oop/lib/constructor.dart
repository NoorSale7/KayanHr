import 'package:flutter/material.dart';
//"What is the difference between a constructor with positional parameters and a constructor with named (required) parameters in Dart?"
void main() {
  final person1 = Person("Noor", 21);
  print("${person1.name} , ${person1.age}");
  //final person1 = Person(name: "Noor",age: 21);
}
class Person {
  final String name;
  final int age;

  Person(this.name,this.age);// → positional parameters
//Order matters — لازم تحطي القيم بنفس ترتيب تعريفهم

//Person({required this.name,required this.age}); → named parameters
// Order doesn't matter — بتحدد كل قيمة باسمها
}

