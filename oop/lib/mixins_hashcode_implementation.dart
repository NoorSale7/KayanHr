void main(){
  final cats = <Cat>{
    Cat(name: 'Kitty 1',age: 2),
    Cat(name: 'Kitty 2',age: 3),
    Cat(name: 'Kitty 1',age: 2),
  };
  cats.forEach(print);
}

enum PetType{cat,dog}

mixin Pet{
  String get name;
  int get age;
  PetType get type;

  @override
  String toString() => 'Pet($type), name = $name,';

  @override
  int get hashCode => Object.hash(name, age,type);
  // hashCode is just a number that Dart gives to every object, like an ID tag.
  // It's used so that things like Set and Map can find and store objects quickly.
  // Think of it like this: imagine a huge library. Instead of searching every shelf for a book,
  // each book gets a code number that tells the librarian roughly which shelf to check first.
  // That's what hashCode does for objects — it helps Dart find them fast in collections.

  // If two objects are equal (==), they must have the same hashCode.
  // But two objects can have the same hashCode even if they're not equal
  // (this is called a "collision" — rare, but allowed).

  //class Student {
  //   String name;
  //   Student(this.name);
  // }
  //
  // void main() {
  //   var s1 = Student('Sara');
  //   var s2 = Student('Sara');
  //   print(s1.hashCode == s2.hashCode); // false
  // }
  // Even though both students are named "Sara", Dart sees them as two different objects in memory —
  // so by default they get different hashCodes.

  // If you want them to be treated as equal (same name = same student):
  // class Student {
  //   String name;
  //   Student(this.name);
  //
  //   @override
  //   bool operator ==(Object other) =>
  //       other is Student && other.name == name;
  //
  //   @override
  //   int get hashCode => name.hashCode;
  // }
  // Now s1 == s2 is true, and their hashCode matches too.
  // In short: hashCode = a number identifying an object, used for speed in Set/Map.
  // If you change how == works, you must also change hashCode to match it.

  @override
  bool operator ==(Object other) => other.hashCode == hashCode;
}

class Cat with Pet{
  @override
  final int age ;

  @override
  final String name;

  @override
  final PetType type;

  Cat({required this.age,required this.name}) : type = PetType.cat;

}