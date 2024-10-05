import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home_page.dart';

class OTPPage extends StatefulWidget {
  final String email;

  OTPPage({required this.email});

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());

  void _verifyOTP() {
    // Combine OTP from all controllers
    String otp = _otpControllers.map((controller) => controller.text).join();

    // Debug print statement to check the OTP value
    print("Entered OTP: $otp");

    // Check if OTP is valid (assuming 6-digit OTP for simplicity)
    if (otp.length < 6) {
      Fluttertoast.showToast(msg: "Please enter a valid 6-digit OTP");
      return;
    }

    // Add OTP verification logic here
    // For demonstration, we'll assume any 6-digit OTP is valid
    bool otpIsValid = otp.length == 6; // Replace with actual validation logic

    if (otpIsValid) {
      // Navigate to HomePage if OTP is valid
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    } else {
      // Show error message if OTP is invalid
      Fluttertoast.showToast(msg: "Invalid OTP, please try again.");
    }
  }

  void _resendOTP() {
    Fluttertoast.showToast(
      msg: "OTP resent to ${widget.email}",
      backgroundColor: Color.fromRGBO(
          127, 79, 49, 0.75), // Background color with transparency
      textColor: Color(0xF6E5B394), // Text color
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 3, // Show for 3 seconds
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify OTP')),
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
                          "OTP sent to ${widget.email}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFF1D7C7), // Text color
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Enter OTP",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF1D7C7), // Text color
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(6, (index) {
                            return Container(
                              width: 40,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(246, 229, 179,
                                    0.58), // Background color with transparency
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextField(
                                controller: _otpControllers[index],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Color.fromARGB(
                                      255, 18, 73, 54), // Text color
                                ),
                                onChanged: (value) {
                                  if (value.length == 1 && index < 5) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _verifyOTP,
                          child: Text('Verify OTP'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFF6E5B3),
                            foregroundColor: Color.fromARGB(255, 18, 73, 54),
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: _resendOTP,
                          child: Text('Resend OTP'),
                          style: TextButton.styleFrom(
                            foregroundColor: Color(0xFFF1D7C7), // Text color
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Ring in the top-left corner
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFFF1D7C7),
                  width: 5, // Ring thickness
                ),
              ),
            ),
          ),
          // Circle in the bottom-right corner
          Positioned(
            bottom: -50,
            right: -50,
            child: Container(
              width: 150,
              height: 150,
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
