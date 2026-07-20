void main()
{
  final v = Vehicle(4);
  print(v.toString());

  print(Car());

  print(Bicycle());
}

class Vehicle{
  final int wheelCount;
  const Vehicle(this.wheelCount);

  @override
  String toString() {
    return "$runtimeType with $wheelCount wheels"; // runtimeType returns the type of the class
  }
}

class Car extends Vehicle{
  const Car() : super(4); // another way to extend
  //const Car(super.wheelCount);
}

class Bicycle extends Vehicle{
  const Bicycle() : super(2); // another way to extend
  //const Bicycle(super.wheelCount);
}



