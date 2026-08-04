import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile picture
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue.shade100,
              child: Icon(Icons.person, size: 70, color: Colors.blue),
            ),
            SizedBox(height: 16),

            // Name
            Text(
              "Noor Al-Deen",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),

            // Email
            Text(
              "noorallftawy@outlook.com",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 24),

            // Info card
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildInfoRow(Icons.phone, "Phone", "+962 79 710 5207"),
                    Divider(),
                    _buildInfoRow(Icons.location_on, "Location", "Zarqa, Jordan"),
                    Divider(),
                    _buildInfoRow(Icons.school, "University", "Applied Science University"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),

            // Edit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print("Edit Profile pressed");
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text("Edit Profile"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue, size: 20),
       const SizedBox(width: 12),
        Text(
          "$label: ",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(color: Colors.grey.shade700),
          ),
        ),
      ],
    );
  }
}