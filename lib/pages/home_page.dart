import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? email = ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, '/profile', arguments: email),
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome, ${email ?? 'User'}!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
