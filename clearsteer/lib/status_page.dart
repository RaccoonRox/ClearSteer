import 'package:flutter/material.dart';
import 'detect.dart'; // Import the DetectScreen from detect.dart
import 'statistics_page.dart';
import 'emergency_services_page.dart';
import 'profile_page.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1D7C7),
      appBar: AppBar(
        //title: Text('Status Page'),
        backgroundColor: Color(0xFFF1D7C7), // App bar color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Good Morning!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E1E1E), // Text color
              ),
            ),
            // SizedBox(height: 20),
            // Container(
            //   width: 150,
            //   height: 150,
            //   decoration: BoxDecoration(
            //     color: Color(0xFF1E1E1E), // Square color
            //     borderRadius: BorderRadius.circular(12),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black.withOpacity(0.1),
            //         spreadRadius: 2,
            //         blurRadius: 5,
            //         offset: Offset(0, 3),
            //       ),
            //     ],
            //   ),
            //   child: Center(
            //     child: Text(
            //       'Press Below to Start',
            //       style: TextStyle(
            //         color: Color(0xFFF1D7C7), // Text color in square
            //         fontSize: 18,
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to DetectScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetectScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: Color(0xFF124936), // Button background color
                padding: EdgeInsets.all(20),
              ),
              child: Text(
                'Start',
                style: TextStyle(color: Color(0xFFF1D7C7)), // Button text color
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFF1D7C7), // Navbar background color
        unselectedItemColor: Color(0xFF1E1E1E), // Icon color
        selectedItemColor: Color(0xFF1E1E1E), // Icon color when selected
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Emergency Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StatisticsPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EmergencyServicesPage()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
            // Home button should not navigate away from the StatusPage
          }
        },
      ),
    );
  }
}
