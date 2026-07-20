void main() {
  const me = Person("Noor", 21);
  print("${me.name} , ${me.age}");
  print("-----------------------");

  const foo = Person.foo();
  print("${foo.name} , ${foo.age}");
  print("-----------------------");

  const bar = Person.bar(23);
  print("${bar.name} , ${bar.age}");
  print("-----------------------");

  const baz = Person.other();
  print("${baz.name} , ${baz.age}");
  print("-----------------------");
  const john = Person.other(name: "john");
  print("${john.name} , ${john.age}");
}

class Person {
  final String name;
  final int age;

  const Person(this.name, this.age);

  const Person.foo() : this("foo", 20); // const named constructor
//const Person.foo() : name = "foo" , age = 21; another way to apply const named constructor

const Person.bar(this.age) : name = "Bar";

const Person.other({String? name , int? age})
  : name = name ?? "Baz"
  , age = age ?? 30;
}


