import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart'; // Make sure to replace 'your_app' with your actual package name

void main() {
  testWidgets('Splash screen shows and transitions to login page',
      (WidgetTester tester) async {
    // Load the app and pump the widget
    await tester.pumpWidget(MyApp());

    // Check if the splash screen text "MyApp Logo" is present
    expect(find.text('MyApp Logo'), findsOneWidget);

    // Wait for 2 seconds (the time for splash screen to transition)
    await tester.pump(Duration(seconds: 2));

    // Splash screen should now transition, and the login page should appear
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
  });

  testWidgets('Login page transitions to home page on successful login',
      (WidgetTester tester) async {
    // Load the app and skip the splash screen
    await tester.pumpWidget(MyApp());
    await tester.pump(Duration(seconds: 2));

    // Enter valid name and password
    await tester.enterText(find.byType(TextField).at(0), 'Test User');
    await tester.enterText(find.byType(TextField).at(1), 'password123');

    // Tap the 'Login' button
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Check if the home page appears with the emoji
    expect(find.text('😊'), findsOneWidget);
  });

  testWidgets('Sign Up page transitions to OTP verification and then home page',
      (WidgetTester tester) async {
    // Load the app and skip the splash screen
    await tester.pumpWidget(MyApp());
    await tester.pump(Duration(seconds: 2));

    // Tap the 'Sign Up' button
    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();

    // Enter phone number and tap 'Send OTP'
    await tester.enterText(find.byType(TextField).at(0), '1234567890');
    await tester.tap(find.text('Send OTP'));
    await tester.pumpAndSettle();

    // Enter the correct OTP and tap 'Verify OTP'
    await tester.enterText(find.byType(TextField).at(1), '1234');
    await tester.tap(find.text('Verify OTP'));
    await tester.pumpAndSettle();

    // Check if the home page appears with the emoji
    expect(find.text('😊'), findsOneWidget);
  });
}
