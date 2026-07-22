void main(){}
// Bad — class does too many things:
class Student {
  String name;
  Student(this.name);

  void saveToDatabase() {
    print("Saving $name to database...");
  }

  void printReportCard() {
    print("Printing report card for $name...");
  }
}
// This Student class handles both data AND database logic AND printing — if the database changes,
// or the print format changes, you'd have to modify this same class for unrelated reasons.

// Good — split responsibilities:
// class Student {
//   String name;
//   Student(this.name);
// }
//
// class StudentRepository {
//   void saveToDatabase(Student s) {
//     print("Saving ${s.name} to database...");
//   }
// }
//
// class ReportPrinter {
//   void printReportCard(Student s) {
//     print("Printing report card for ${s.name}...");
//   }
// }
// Now each class has one job. Changing the database logic doesn't touch printing logic.