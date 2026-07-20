void main() {
final car = Car();

try{
car.drive(speed: 10);
car.drive(speed: -10);
}catch(e){
print(e);
}
}
class Car {
  int _speed = 0;

  int get speed => _speed; // Return Speed Value
  set speed(newSpeed) // Check Speed Value
  {
    if (newSpeed < 0) {
      throw Exception("Speed cannot be negative");
    }
    // we don't need else because the program will not continue after Exception statement but i can add else statement
    _speed = newSpeed;
  }
  void drive({required speed})
  {
    this.speed = speed;
    print("Accelerating to $speed km/h");
  }

  void stop ()
  {
    speed = 0;
    print("Stopping");
    print("The car is Stopped");
  }
}