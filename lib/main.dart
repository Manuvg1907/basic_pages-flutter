import 'package:flutter/material.dart';
import 'pages/splash_page.dart';
import 'pages/signup_page.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/signup': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
