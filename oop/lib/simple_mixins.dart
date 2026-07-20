void main(){
  final person = Person();
  person.jump(speed: 10.0);
  person.walk(speed: 5.0);
}

mixin HasSpeed{
  abstract double speed;
}

mixin CanJump on HasSpeed{
  void jump({required double speed}){
    print("$runtimeType is Jumping with speed $speed");
    this.speed=speed;
  }
}

mixin CanWalk on HasSpeed{
  void walk({required double speed}){
    print("$runtimeType is Walking with speed $speed");
    this.speed=speed;
  }
}

class Person with HasSpeed, CanJump, CanWalk{
  @override
  double speed; // = 0.0; // or i can do it like this
  Person(): speed=0.0;
}