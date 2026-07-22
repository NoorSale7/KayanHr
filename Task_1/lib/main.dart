import 'dart:io';

class Student {
  String name;
  int age;
  String id;
  Student(this.name,this.age,this.id);
}

String toString(Student student){
  return "Name: ${student.name} , Age: ${student.age} , ID: ${student.id}";
}

class StudentManager {
  List<Student> students =[];

  void addStudent(String name, int age, String id)
  {
    students.add(Student(name, age, id));
    print("Student Added Successfully");
  }
  void removeStudent(String id) {
    bool existed = students.any((s) => s.id == id);
    students.removeWhere((s) => s.id == id);
    if (existed) {
      print("Student Removed Successfully");
    }
    else
      print("Student Not Found");
  }

  void searchStudent(String id) {
    var result = students.where((s)=>s.id==id);
    if(result.isNotEmpty){
      print(toString(result.first));
    }
    else
      print("Student Not Found");
  }

  void printAllStudents(){
    if(students.isEmpty){
      print("No Students Yet");
      return; // ← this stops the function here
    }
    for(var s in students){
      print(toString(s));
    }
  }
}

void main() {
  StudentManager manager = StudentManager();
  bool running = true;
  while (running) {
    print("\n -----Student Management System-----");
    print("1. Add Student");
    print("2. Remove Student");
    print("3. Search Student");
    print("4. Print All Students");
    print("5. Exit");
    stdout.write("Enter your choice: ");

    String? choice = stdin.readLineSync();


    switch (choice) {
      case '1':
        stdout.write("Enter Student Name: ");
        String? name = stdin.readLineSync() ?? "";
        stdout.write("Enter Student Age: ");
        int? age=int.tryParse(stdin.readLineSync()??"")??0;
        stdout.write("Enter Student ID: ");
        String? id=stdin.readLineSync()??"";
        manager.addStudent(name, age, id);
        break;
      case '2':
        stdout.write("Enter Student ID: ");
        String? id=stdin.readLineSync()??"";
        manager.removeStudent(id);
        break;
      case '3':
        stdout.write("Enter Student ID: ");
        String? id=stdin.readLineSync()??"";
        manager.searchStudent(id);
        break;
      case '4':
        manager.printAllStudents();
        break;
      case '5':
        running=false;
        break;
      default:
        print("Invalid choice");
        break;


    }
  }
}