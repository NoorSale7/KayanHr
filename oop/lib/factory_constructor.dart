void main(){
print(Vehicle.car());
print(Vehicle.truck());
print(Car.toyota());
}

class Vehicle{
  const Vehicle();

  factory Vehicle.car() => Car();
  factory Vehicle.truck() => Truck();

  @override
  String toString() => "Vehicle of type $runtimeType";
}
class Car extends Vehicle{

  final String type;
  const Car({this.type = "Unknown"});
  factory Car.toyota() => Car(type: "Toyota");

  @override
  String toString() {
    if (type == "Unknown") {
      return super.toString(); // fall back to Vehicle.toString()
    }
    else {
      return "Car of type $type";
    }
  }
}
class Truck extends Vehicle{
  const Truck();
}

//class Car extends Vehicle {
//   final String color;
//
//   const Car({this.color = 'unknown'});
//
//   factory Car.red() => Car(color: 'red');
//   factory Car.blue() => Car(color: 'blue');
//
//   @override
//   String toString() => 'Car of color $color';
// }
//const is about immutability of each individual object once created, not about all objects having the same value.
//factory Car.fromCode(int code) {
//   if (code == 1) return Car(color: 'red');
//   if (code == 2) return Car(color: 'blue');
//   return Car(color: 'unknown');
// }
//This kind of logic (conditions, choosing a value) can't be done inside a regular constructor in Dart,
//because the initializer list is limited and can't execute statements like if.