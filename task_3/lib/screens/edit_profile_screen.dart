import 'package:flutter/material.dart';
import '../models/employee.dart';

class EditProfileScreen extends StatefulWidget {
  final Employee employee;
  const EditProfileScreen({required this.employee});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _positionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.employee.name);
    _positionController = TextEditingController(text: widget.employee.position);
  }
  @override
  void dispose() {
    _nameController.dispose();
    _positionController.dispose();
    super.dispose();
  }
  void _saveChanges(){
    if(_formKey.currentState!.validate()){
      final updated = Employee(
        name: _nameController.text.trim(),
        email: widget.employee.email,
        password: widget.employee.password,
        position: _positionController.text.trim(),
      );
      Navigator.pop(context, updated);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => (value == null || value.isEmpty) ? 'Name is required' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _positionController,
                decoration: InputDecoration(
                  labelText: 'Position',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => (value == null || value.isEmpty) ? 'Position is required' : null,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveChanges,
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
