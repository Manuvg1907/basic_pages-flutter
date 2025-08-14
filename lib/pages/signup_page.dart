import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = 'manu@gmail.com';
  String _password = '';
  String _confirmPassword = '';
  bool _showPassword = false;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_password == _confirmPassword) {
        Navigator.pushReplacementNamed(context, '/login', arguments: {
          'email': _email,
          'password': _password,
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords do not match')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value!.isEmpty || !value.contains('@') ? 'Enter a valid email' : null,
                onSaved: (value) => _email = value!,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () => setState(() => _showPassword = !_showPassword),
                  ),
                ),
                obscureText: !_showPassword,
                validator: (value) => value!.length < 6 ? 'Password must be at least 6 characters' : null,
                onSaved: (value) => _password = value!,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                validator: (value) => value != _password ? 'Passwords do not match' : null,
                onSaved: (value) => _confirmPassword = value!,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Sign Up'),
              ),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                child: Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
