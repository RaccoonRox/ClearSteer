import 'package:flutter/material.dart';
import 'home_page.dart';
import 'statistics_page.dart';
import 'emergency_services_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1D7C7),
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFFF1D7C7), // App bar color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20), // Top spacing

              // Profile Info Box
              Container(
                width: double.infinity, // Full width
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Color(0xFF1E1E1E), // Box color
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile Information',
                      style: TextStyle(
                        color: Color(0xFFF1D7C7), // Text color
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Name: John Doe',
                      style: TextStyle(
                        color: Color(0xFFF1D7C7), // Text color
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Number: +1234567890',
                      style: TextStyle(
                        color: Color(0xFFF1D7C7), // Text color
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Email: johndoe@example.com',
                      style: TextStyle(
                        color: Color(0xFFF1D7C7), // Text color
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              // Car Info Box
              Container(
                width: double.infinity, // Full width
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Color(0xFF1E1E1E), // Box color
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Car',
                      style: TextStyle(
                        color: Color(0xFFF1D7C7), // Text color
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Car Model: Toyota Corolla',
                      style: TextStyle(
                        color: Color(0xFFF1D7C7), // Text color
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Add Car button press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3F4D42), // Button color
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          'Add Car',
                          style: TextStyle(
                              color: Color(0xFFF1D7C7)), // Button text color
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Emergency Contact Box
              Container(
                width: double.infinity, // Full width
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Color(0xFF1E1E1E), // Box color
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Emergency Contact',
                      style: TextStyle(
                        color: Color(0xFFF1D7C7), // Text color
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Contact: +0987654321',
                      style: TextStyle(
                        color: Color(0xFFF1D7C7), // Text color
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              // Settings Box
              Container(
                width: double.infinity, // Full width
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF1E1E1E), // Box color
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Settings',
                      style: TextStyle(
                        color: Color(0xFFF1D7C7), // Text color
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Settings button press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3F4D42), // Button color
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          'Change Settings',
                          style: TextStyle(
                              color: Color(0xFFF1D7C7)), // Button text color
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart, color: Color(0xFF1E1E1E)), // Icon color
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFF1E1E1E)), // Icon color
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital,
                color: Color(0xFF1E1E1E)), // Icon color
            label: 'Emergency Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xFF1E1E1E)), // Icon color
            label: 'Profile',
          ),
        ],
        backgroundColor: Color(0xFFF1D7C7), // Navbar color
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StatisticsPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EmergencyServicesPage()),
              );
              break;
          }
        },
      ),
    );
  }
}
