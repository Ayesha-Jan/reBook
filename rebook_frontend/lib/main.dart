import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const ReBookApp());
}

class ReBookApp extends StatelessWidget {
  const ReBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
