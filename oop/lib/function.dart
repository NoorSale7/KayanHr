void main(){
final myCar = Car(); // myCar cannot be object for another class else Car
myCar.drive(speed: 100);
print("Speed is ${myCar.speed}");
myCar.stop();
}

class Car{
 int speed = 0;

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
