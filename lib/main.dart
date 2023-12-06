import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Import the file where MyStatefulWidget is defined

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stateful Widget Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(), // Call the Stateful Widget here
    );
  }
}
