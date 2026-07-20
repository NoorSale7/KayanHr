void main(){
Humen().run();
}
class Has2Feet{
  const Has2Feet();
}
class Humen extends Has2Feet with CanRun{
  const Humen();
}
mixin CanRun on Has2Feet{
  void run(){
    print("$runtimeType is Running");
  }
}
class HasNoFeet{
  const HasNoFeet();
}
class Fish extends HasNoFeet {
  const Fish();
}
