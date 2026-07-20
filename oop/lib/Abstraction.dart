void main(){
const car = Car();
car.accelerate();
car.decelerate();

const motorcycle = MotorCycle();
motorcycle.accelerate();
motorcycle.decelerate();
}

abstract class Vehicle{
final VehicleKind kind;
const Vehicle({required this.kind});

void accelerate() => print("$kind is Accelerating");
void decelerate() => print("$kind is Decelerating");
}

class Car extends Vehicle{
  const Car() : super(kind: VehicleKind.car);
}

class MotorCycle implements Vehicle{
  const MotorCycle();
  @override
  void accelerate() {
    print("MotorCycle is Accelerating");
  }

  @override
  void decelerate() {
    print("MotorCycle is Decelerating");
  }

  @override
  VehicleKind get kind => VehicleKind.motorCycle;

}

enum VehicleKind{car,truck,motorCycle}