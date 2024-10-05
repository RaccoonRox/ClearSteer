import 'package:flutter/material.dart';
import 'home_page.dart'; // Import HomePage if it's needed for navigation
import 'emergency_services_page.dart';
import 'profile_page.dart';

class StatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1D7C7),
      appBar: AppBar(
        title: Text('Statistics Page'),
        backgroundColor: Color(0xFFF1D7C7), // App bar color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Last Drive Speed Box
              Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(bottom: 16.0),
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
                      'Last Drive Speed',
                      style: TextStyle(
                        color: Color(0xFFF1D7C7), // Text color
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Speed: 60 km/h',
                      style: TextStyle(
                        color: Color(0xFFF1D7C7), // Text color
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              // Smart Drive Graph Box
              Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(bottom: 16.0),
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
                      'Smart Drive Graph',
                      style: TextStyle(
                        color: Color(0xFFF1D7C7), // Text color
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Image for the graph
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/graph.jpg'), // Replace with your image path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Map of Last Trip Box
              Container(
                padding: EdgeInsets.all(16.0),
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
                      'Map of Last Trip',
                      style: TextStyle(
                        color: Color(0xFFF1D7C7), // Text color
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Image for the map
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/last trip.png'), // Replace with your image path
                          fit: BoxFit.cover,
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
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
            // Statistics button should not navigate away from the StatisticsPage
          }
        },
      ),
    );
  }
}
