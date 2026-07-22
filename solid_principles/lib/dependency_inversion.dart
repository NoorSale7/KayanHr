// Depend on abstractions (interfaces), not on concrete/specific classes.
// Bad — tightly coupled to one specific class:
class MySQLDatabase {
  void save(String data) => print("Saving to MySQL: $data");
}

class StudentManager {
  MySQLDatabase db = MySQLDatabase(); // stuck with MySQL forever

  void saveStudent(String name) {
    db.save(name);
  }
}
// If you ever want to switch to Firebase or another database,
// you'd have to rewrite StudentManager.

// Good — depend on an abstraction instead:
// abstract class Database {
//   void save(String data);
// }
//
// class MySQLDatabase extends Database {
//   @override
//   void save(String data) => print("Saving to MySQL: $data");
// }
//
// class FirebaseDatabase extends Database {
//   @override
//   void save(String data) => print("Saving to Firebase: $data");
// }
//
// class StudentManager {
//   Database db; // depends on the abstraction, not a specific database // just a variable DECLARATION, saying "db is of type Database"
// // This line is just saying: "db is a variable whose type is Database" — it does NOT create an object. The actual object gets created later,
// // when you call the constructor and pass in a real, concrete subclass (like MySQLDatabase or FirebaseDatabase):

// // Database db = MySQLDatabase(); // This works!, we can do this instead
// // db's TYPE is Database, but its ACTUAL VALUE is a MySQLDatabase object

// // Database db = Database(); //  ERROR! Cannot create an instance of an abstract class
// // Database db; just declares the type of the variable — you can't write = Database() because Database is abstract (no implementation to create an object from).
// // The real object always comes from a concrete subclass like MySQLDatabase() or FirebaseDatabase().

//   StudentManager(this.db);
//
//   void saveStudent(String name) {
//     db.save(name);
//   }
// }
//
// void main() {
//   StudentManager manager = StudentManager(MySQLDatabase());
//   manager.saveStudent("Shahad"); // works with MySQL
//
//   StudentManager manager2 = StudentManager(FirebaseDatabase());
//   manager2.saveStudent("Ahmad"); // works with Firebase, no changes needed to StudentManager
// }