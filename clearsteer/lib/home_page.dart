import 'package:flutter/material.dart';
import 'status_page.dart'; // Import the StatusPage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Navigate to StatusPage after 3 seconds
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => StatusPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1D7C7), // Set the background color
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor:
            Colors.transparent, // Optional: Set AppBar color to transparent
        elevation: 0, // Optional: Remove AppBar shadow
      ),
      body: Stack(
        children: [
          // Text element
          Positioned(
            top: 74,
            left: 17,
            child: Container(
              width: 268,
              height: 188,
              color: Color(0xFF8B5B3C), // Background color
              child: Center(
                child: Text(
                  'Loading...',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          // Circle element
          Positioned(
            top: 61,
            left: 285,
            child: Container(
              width: 110,
              height: 107,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF124936), // Circle color
              ),
            ),
          ),
          // Circle and ring element
          Positioned(
            top: 338,
            left: -132,
            child: Stack(
              children: [
                // Circle
                Container(
                  width: 312,
                  height: 284.18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF124936), // Circle color
                  ),
                ),
                // Ring
                Container(
                  width: 312,
                  height: 284.18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xFF124936),
                      width: 4,
                    ),
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
