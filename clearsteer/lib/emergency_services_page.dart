import 'package:flutter/material.dart';
import 'home_page.dart';
import 'statistics_page.dart';
import 'profile_page.dart';

class EmergencyServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1D7C7),
      appBar: AppBar(
        title: Text('Emergency Services'),
        backgroundColor: Color(0xFFF1D7C7), // App bar color
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Service Box
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Center contents
                children: [
                  Text(
                    'Service',
                    style: TextStyle(
                      color: Color(0xFFF1D7C7), // Text color
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Call Emergency Contact
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3F4D42), // Button color
                      padding: EdgeInsets.symmetric(vertical: 16),
                      minimumSize: Size(
                          double.infinity, 50), // Same size for all buttons
                    ),
                    child: Text(
                      'Call Emergency Contact',
                      style: TextStyle(
                          color: Color(0xFFF1D7C7)), // Button text color
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Call Ambulance
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3F4D42), // Button color
                      padding: EdgeInsets.symmetric(vertical: 16),
                      minimumSize: Size(
                          double.infinity, 50), // Same size for all buttons
                    ),
                    child: Text(
                      'Call Ambulance',
                      style: TextStyle(
                          color: Color(0xFFF1D7C7)), // Button text color
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Alert Police
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3F4D42), // Button color
                      padding: EdgeInsets.symmetric(vertical: 16),
                      minimumSize: Size(
                          double.infinity, 50), // Same size for all buttons
                    ),
                    child: Text(
                      'Alert Police',
                      style: TextStyle(
                          color: Color(0xFFF1D7C7)), // Button text color
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Spacing between boxes
            // Request Box
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Center contents
                children: [
                  Text(
                    'Roadside Assistance',
                    style: TextStyle(
                      color: Color(0xFFF1D7C7), // Text color
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  DropdownButton<String>(
                    hint: Text(
                      'Choose Problem',
                      style: TextStyle(color: Color(0xFFF1D7C7)),
                    ),
                    items: <String>['Mechanical', 'Medical', 'Security']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Color(0xFFF1D7C7)),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      // Handle dropdown value change
                    },
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Choose Vehicle
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3F4D42), // Button color
                      padding: EdgeInsets.symmetric(vertical: 16),
                      minimumSize: Size(
                          double.infinity, 50), // Same size for all buttons
                    ),
                    child: Text(
                      'Choose Vehicle',
                      style: TextStyle(
                          color: Color(0xFFF1D7C7)), // Button text color
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Submit
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3F4D42), // Button color
                      padding: EdgeInsets.symmetric(vertical: 16),
                      minimumSize: Size(
                          double.infinity, 50), // Same size for all buttons
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Color(0xFFF1D7C7)), // Button text color
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Call Now
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3F4D42), // Button color
                      padding: EdgeInsets.symmetric(vertical: 16),
                      minimumSize: Size(
                          double.infinity, 50), // Same size for all buttons
                    ),
                    child: Text(
                      'Call Now',
                      style: TextStyle(
                          color: Color(0xFFF1D7C7)), // Button text color
                    ),
                  ),
                ],
              ),
            ),
          ],
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
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
          }
        },
      ),
    );
  }
}
