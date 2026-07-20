void main(){
  final whiskers = Cat(age: 2);
  print(whiskers.age);
  whiskers.incrementAge();
  print(whiskers.age);
}

mixin HasAge{
  abstract int age; // shorthand for abstract getter AND setter
// Dart does support the abstract modifier directly on a field, but only inside abstract class or mixin declarations (not in regular concrete classes).
// It's essentially shorthand for an abstract getter + setter pair.
  void incrementAge() => age++; // can use it here even without implementation
}
class Cat with HasAge {
  @override
  int age=0;
  Cat({required this.age}); // cannot be const because I have increment function
}