void main(){}
// A subclass should be usable anywhere its parent class is expected, without breaking things.
// Bad — subclass breaks the parent's expected behavior:
//class Bird {
//   void fly() {
//     print("Flying...");
//   }
// }
//
// class Penguin extends Bird {
//   @override
//   void fly() {
//     throw Exception("Penguins can't fly!"); // breaks expectations
//   }
// }
// If code expects any Bird to fly(), substituting a Penguin in crashes the program.

// Good — restructure so the hierarchy makes sense:
class Bird {
  void eat() {
    print("Eating...");
  }
}

class FlyingBird extends Bird {
  void fly() {
    print("Flying...");
  }
}

class Eagle extends FlyingBird{
  @override
  void fly() {
    super.fly();
  }
  @override
  void eat() {
    super.eat();
  }
}
class Penguin extends Bird {
  // no fly() method — Penguin just doesn't have that capability, and that's fine
}
