import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _phone = '';
  String _email = 'manu@gmail.com';
  String _password = '';
  String _confirmPassword = '';
  bool _showPassword = false;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_password == _confirmPassword) {
        Navigator.pushReplacementNamed(context, '/login', arguments: {
          'username': _username,
          'phone': _phone,
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

  InputDecoration _inputDecoration(String label, {IconData? icon}) {
    return InputDecoration(
      labelText: label,
      prefixIcon: icon != null ? Icon(icon, color: Colors.deepPurple) : null,
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text('Create Account'),
        backgroundColor: Colors.deepPurple,
        elevation: 4,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Username
                    TextFormField(
                      decoration: _inputDecoration('Username', icon: Icons.person),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter your username' : null,
                      onSaved: (value) => _username = value!,
                    ),
                    SizedBox(height: 16),

                    // Phone
                    TextFormField(
                      decoration: _inputDecoration('Phone Number', icon: Icons.phone),
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          value!.length != 10 ? 'Enter a valid 10-digit number' : null,
                      onSaved: (value) => _phone = value!,
                    ),
                    SizedBox(height: 16),

                    // Email
                    TextFormField(
                      initialValue: _email,
                      decoration: _inputDecoration('Email', icon: Icons.email),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => value!.isEmpty || !value.contains('@')
                          ? 'Enter a valid email'
                          : null,
                      onSaved: (value) => _email = value!,
                    ),
                    SizedBox(height: 16),

                    // Password
                    TextFormField(
                      decoration: _inputDecoration('Password', icon: Icons.lock).copyWith(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _showPassword ? Icons.visibility : Icons.visibility_off,
                            color: Colors.deepPurple,
                          ),
                          onPressed: () =>
                              setState(() => _showPassword = !_showPassword),
                        ),
                      ),
                      obscureText: !_showPassword,
                      validator: (value) => value!.length < 6
                          ? 'Password must be at least 6 characters'
                          : null,
                      onSaved: (value) => _password = value!,
                    ),
                    SizedBox(height: 16),

                    // Confirm Password
                    TextFormField(
                      decoration: _inputDecoration('Confirm Password', icon: Icons.lock_outline),
                      obscureText: true,
                      validator: (value) =>
                          value != _password ? 'Passwords do not match' : null,
                      onSaved: (value) => _confirmPassword = value!,
                    ),
                    SizedBox(height: 24),

                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    // Login Redirect
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? "),
                        TextButton(
                          onPressed: () =>
                              Navigator.pushReplacementNamed(context, '/login'),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
