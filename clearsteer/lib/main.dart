import 'package:flutter/material.dart';
import 'dart:async'; // For Timer
import 'package:fluttertoast/fluttertoast.dart'; // For toast notifications
import 'login_page.dart';
import 'signup_page.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(241, 215, 199, 1),
        scaffoldBackgroundColor: const Color.fromARGB(
            255, 18, 73, 54), // Background color for all screens
      ),
      home: MainPage(), // Set MainPage as the home widget
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png', // Path to your image asset
          width: 200, // Adjust width as needed
          height: 200, // Adjust height as needed
        ),
      ),
    );
  }
}
