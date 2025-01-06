import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Meditation",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Meditation",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Meditation",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Meditation",
            ),
          ],
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
