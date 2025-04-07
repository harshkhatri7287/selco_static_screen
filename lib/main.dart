import 'package:flutter/material.dart';
import 'package:static_screens/screens/installation_report_home_page.dart';
import 'package:static_screens/screens/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const WelcomePage(),
      home: InstallationReport(),
    );
  }
}


