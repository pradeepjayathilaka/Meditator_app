import 'package:flutter/material.dart';
import 'package:meditator_app/pages/main_screen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meditate flutter",
      home: MainScreen(),
    );
  }
}
