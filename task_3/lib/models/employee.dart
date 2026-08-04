import 'package:task_3/models/employee.dart';
class Employee {
  String name;
  String email;
  String password;
  String position;

  Employee({
        required this.name,
        required this.email,
        required this.password,
        required this.position
      });

}

class EmployeeDatabase {
  static List<Employee> employees = [];

  static Employee? findByEmail(String email) {
    for (var emp in employees) {
      if (emp.email == email) return emp;
    }
    return null;
  }
}
