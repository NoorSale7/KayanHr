void main(){}
// Don't force a class to implement methods it doesn't need.
// Bad — one big interface forces unused methods:
abstract class Worker {
  void work();
  void eat();
}

class Robot extends Worker {
  @override
  void work() => print("Working...");

  @override
  void eat() => throw Exception("Robots don't eat!"); // forced to implement this
}

// Good — split into smaller, specific interfaces:
// abstract class Workable {
//   void work();
// }
//
// abstract class Eatable {
//   void eat();
// }
//
// class Human extends Workable with Eatable {
//   @override
//   void work() => print("Working...");
//   void eat() => print("Eating...");
// }
//
// class Robot extends Workable {
//   @override
//   void work() => print("Working...");
//   // no need to implement eat() at all
// }
