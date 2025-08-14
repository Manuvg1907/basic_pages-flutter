import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/signup');
    });
    return Scaffold(
      body: Center(
        child: Text('Welcome to Flutter Auth Demo', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
