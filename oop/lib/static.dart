void main(){
print(Car._carInstantiated);
Car(name: "My Car");
print(Car._carInstantiated);
Car(name: "Your Car");
print(Car._carInstantiated);
}


class Car{
  static int _carInstantiated = 0 ;

  static int get carInstantiated => _carInstantiated;
  static void _incrementCarsInstantiated() => _carInstantiated++;

  final String name;

  Car({required this.name}){
    _incrementCarsInstantiated();
  }
}