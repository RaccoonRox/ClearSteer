import 'package:flutter/material.dart';
import 'home_page.dart';

class DrivePage extends StatefulWidget {
  @override
  _DrivePageState createState() => _DrivePageState();
}

class _DrivePageState extends State<DrivePage> {
  final _numberPlateController = TextEditingController();

  void _navigateToHome() {
    String numberPlate = _numberPlateController.text;

    if (numberPlate.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter the number plate")),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drive')),
      body: Stack(
        children: [
          // Background Circles
          Positioned(
            top: -50, // Move circle up beyond the screen
            left: -50, // Move circle left beyond the screen
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF1D7C7), // Circle color
              ),
            ),
          ),
          Positioned(
            bottom: -50, // Move circle down beyond the screen
            right: -50, // Move circle right beyond the screen
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF1D7C7), // Circle color
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "What are we driving today?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF1D7C7), // Text color
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _numberPlateController,
                    decoration: InputDecoration(
                      labelText: 'Number Plate',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Color.fromRGBO(
                          246, 229, 179, 0.58), // Input field color
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _navigateToHome,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(0xFFF1D7C7), // Button background color
                      foregroundColor: Color(0xFF124936), // Button text color
                    ),
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
