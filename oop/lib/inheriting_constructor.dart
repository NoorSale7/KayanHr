void main(){
final mom = MOM();
print(mom.role);
final dad = DAD();
print(dad.role);
final son = SON();
print(son.role);
final daughter = DAUGHTER();
print(daughter.role);
final grandpa = GRANDPA();
print(grandpa.role);
final grandma = GRANDMA();
print(grandma.role);
}

enum Role{mom , dad , son , daughter, grandpa, grandma}

class Person{
  final Role role;
  const Person({required this.role});
}

class MOM extends Person{
  const MOM() : super(role: Role.mom);
}
class DAD extends Person{
  const DAD() : super(role: Role.dad);
}
class SON extends Person{
  const SON() : super(role: Role.son);
}
class DAUGHTER extends Person{
  const DAUGHTER() : super(role: Role.daughter);
}
class GRANDPA extends Person{
  const GRANDPA() : super(role: Role.grandpa);
}
class GRANDMA extends Person{
  const GRANDMA() : super(role: Role.grandma);
}