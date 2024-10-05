import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'otp_page.dart'; // Import OTPPage

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  void _signUp() {
    String name = _nameController.text;
    String password = _passwordController.text;
    String email = _emailController.text;

    if (name.isEmpty || password.isEmpty || email.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill in all fields");
    } else if (!_isValidEmail(email)) {
      Fluttertoast.showToast(msg: "Please enter a valid email address");
    } else {
      // Navigate to OTPPage after successful signup
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => OTPPage(email: email)),
      );
    }
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9])*@[a-zA-Z0-9]+([.-]?[a-zA-Z0-9])*(\.[a-zA-Z]{2,})$");
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 600),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF1D7C7), // Text color
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFFF1D7C7), // Text color
                          ),
                        ),
                        SizedBox(height: 30),
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            filled: true,
                            fillColor: Color.fromRGBO(246, 229, 179, 0.58),
                            labelStyle: TextStyle(color: Color(0xFFF1D7C7)),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Soft curved corners
                            ),
                          ),
                          style:
                              TextStyle(color: Color.fromARGB(255, 18, 73, 54)),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            filled: true,
                            fillColor: Color.fromRGBO(246, 229, 179, 0.58),
                            labelStyle: TextStyle(color: Color(0xFFF1D7C7)),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Soft curved corners
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          style:
                              TextStyle(color: Color.fromARGB(255, 18, 73, 54)),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            filled: true,
                            fillColor: Color.fromRGBO(246, 229, 179, 0.58),
                            labelStyle: TextStyle(color: Color(0xFFF1D7C7)),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Soft curved corners
                            ),
                          ),
                          obscureText: true,
                          style:
                              TextStyle(color: Color.fromARGB(255, 18, 73, 54)),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _signUp,
                          child: Text('Sign Up'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFF6E5B3),
                            foregroundColor: Color.fromARGB(255, 18, 73, 54),
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: -50, // Move circle down beyond the screen
            right: -50, // Move circle right beyond the screen
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF1D7C7), // Circle color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
