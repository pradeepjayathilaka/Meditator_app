import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      home: MainScreen(),
    );
  }
}
