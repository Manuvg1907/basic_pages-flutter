import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = 'manu@gmail.com';
  String _password = 'Manju@89';
  bool _showPassword = false;

  Map? _signupData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _signupData = ModalRoute.of(context)?.settings.arguments as Map?;
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_signupData != null &&
          _email == _signupData!['email'] &&
          _password == _signupData!['password']) {
        Navigator.pushReplacementNamed(context, '/home', arguments: _email);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid credentials or please sign up first')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
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
                validator: (value) => value!.isEmpty ? 'Enter your email' : null,
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
                validator: (value) => value!.isEmpty ? 'Enter your password' : null,
                onSaved: (value) => _password = value!,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.login, color: Colors.blue),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Social login not implemented')),
                      );
                    },
                  ),
                  Text('Login with Google'),
                ],
              ),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/signup'),
                child: Text('Don\'t have an account? Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
