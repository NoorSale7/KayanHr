import 'package:flutter/material.dart';
import '../models/employee.dart';
import 'register_screen.dart';
import 'profile_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if(_formKey.currentState!.validate()){
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      final employee = EmployeeDatabase.findByEmail(email);
      if (employee != null && employee.password == password) {
        // Navigate to Profile screen, passing the employee object
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(employee: employee),
          ),
        );
      }else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid email or password'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _goToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Login'),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if(value == null || value.isEmpty) return "Email is Required";
                  if(!value.contains("@")) return "Enter a Valid Email";
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if(value == null || value.isEmpty) return "Password is Required";
                  if(value.length < 6) return "Password must be at least 6 characters";
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(onPressed: _login, child: Text("Log in")),
              TextButton(onPressed: _goToRegister, child: Text("Don't have an account? Register")),
            ],
          ),
        ),
      ),
    );
  }
}
