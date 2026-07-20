void main(){
final johnDoe = Person(firstName: "John", lastName: "Doe");
print(johnDoe.fullName);
//print(getFullName(johnDoe)); // another way to print full name
}

//String getFullName(HasFullName obj) => obj.fullName; // another way to get full name

mixin HasFirstName{
  String get firstName;
}
mixin HasLastName{
  String get lastName;
}
mixin HasFullName on HasFirstName, HasLastName{
  String get fullName => "$firstName $lastName";
}

class Person with  HasFirstName,HasLastName,HasFullName {
  @override
  final String firstName;
  @override
  final String lastName;

  Person({required this.firstName,required this.lastName});

}
