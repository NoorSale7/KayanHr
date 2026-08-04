import 'package:flutter/material.dart';
import '../models/employee.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  final Employee employee;
  const ProfileScreen({required this.employee});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _goToEditProfile() async {
    final updatedEmployee = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(employee: widget.employee),
      ),
    );
    if(updatedEmployee != null){
      setState(() {
        widget.employee.name= updatedEmployee.name;
        widget.employee.position= updatedEmployee.position;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Profile updated successfully"),
          backgroundColor: Colors.green,
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Profile'),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 40),
            ),
            SizedBox(height: 20),
            Text("Name: ${widget.employee.name}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Email: ${widget.employee.email}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Position: ${widget.employee.position}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 30),
            ElevatedButton(onPressed: _goToEditProfile, child: Text("Edit Profile")),
          ],
        ),
      ),


    );
  }
}
