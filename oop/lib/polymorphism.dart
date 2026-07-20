void main() {
  // Polymorphism: a list of type Animal can hold any subclass
  List<Animal> animals = [
    Dog('Rex'),
    Cat('Whiskers'),
    Cow('Bessie'),
  ];

  // Same method call, different behavior depending on the actual object
  for (Animal animal in animals) {
    animal.makeSound();
  }
}

class Animal {
  String name;

  Animal(this.name);

  void makeSound() {
    print('$name makes a sound');
  }
}

// Subclass 1 - overrides makeSound()
class Dog extends Animal {
  Dog(String name) : super(name);

  @override
  void makeSound() {
    print('$name barks: Woof! Woof!');
  }
}

// Subclass 2 - overrides makeSound()
class Cat extends Animal {
  Cat(String name) : super(name);

  @override
  void makeSound() {
    print('$name meows: Meow!');
  }
}

// Subclass 3 - overrides makeSound()
class Cow extends Animal {
  Cow(String name) : super(name);

  @override
  void makeSound() {
    print('$name moos: Moooo!');
  }
}