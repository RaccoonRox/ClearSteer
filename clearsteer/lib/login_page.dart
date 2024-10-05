import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'signup_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    String name = _nameController.text;
    String password = _passwordController.text;

    if (name.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill in all fields");
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    }
  }

  void _goToSignUp() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 100,
              height: 100,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFFF1D7C7),
                          width: 4,
                        ),
                        color: Colors.transparent,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.all(
                              8), // Adjust the margin for inner circle
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFF1D7C7),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: 600), // Adjust maxWidth to suit your design
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Let's Login",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF1D7C7),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                10), // Soft curved corners
                            color: Color(0xFFF6E5B3)
                                .withOpacity(0.58), // Soft color with opacity
                          ),
                          child: TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                  color: Color(0xFFF1D7C7)), // Label color
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                10), // Soft curved corners
                            color: Color(0xFFF6E5B3)
                                .withOpacity(0.58), // Soft color with opacity
                          ),
                          child: TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: Color(0xFFF1D7C7)), // Label color
                            ),
                            obscureText: true,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _login,
                          child: Text('Login'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFF6E5B3), // Button background color
                            foregroundColor: Color.fromARGB(
                                255, 18, 73, 54), // Button text color
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: _goToSignUp,
                          child: Text('Sign Up'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFF6E5B3), // Button background color
                            foregroundColor: Color.fromARGB(
                                255, 18, 73, 54), // Button text color
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
