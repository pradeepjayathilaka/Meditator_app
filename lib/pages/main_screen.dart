import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditator_app/main_screens/create_custome_exercise_page.dart';
import 'package:meditator_app/main_screens/custom_exercises_page.dart';
import 'package:meditator_app/main_screens/home_page.dart';
import 'package:meditator_app/main_screens/minfull_exercises_page.dart';
import 'package:meditator_app/main_screens/profile_page.dart';
import 'package:meditator_app/utils/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static List<Widget> _pages = [
    MinfullExercisesPage(),
    HomePage(),
    CreateCustomeExercisePage(),
    CustomExercisesPage(),
    ProfilePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      print(index);
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        child: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/items/house.svg",
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 0
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
                semanticsLabel: "home svg",
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/items/brain.svg",
                colorFilter: ColorFilter.mode(
                    _selectedIndex == 1
                        ? AppColors.primaryPurple
                        : AppColors.primaryGrey,
                    BlendMode.srcIn),
                semanticsLabel: "brain svg",
              ),
              label: "Mindfull",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/items/circle-plus.svg",
                colorFilter: ColorFilter.mode(
                    _selectedIndex == 2
                        ? AppColors.primaryPurple
                        : AppColors.primaryGrey,
                    BlendMode.srcIn),
                semanticsLabel: "create svg",
              ),
              label: "Create",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/items/file-plus-2.svg",
                colorFilter: ColorFilter.mode(
                    _selectedIndex == 3
                        ? AppColors.primaryPurple
                        : AppColors.primaryGrey,
                    BlendMode.srcIn),
                semanticsLabel: "user svg",
              ),
              label: "Custom",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/items/user-round-cog.svg",
                colorFilter: ColorFilter.mode(
                    _selectedIndex == 4
                        ? AppColors.primaryPurple
                        : AppColors.primaryGrey,
                    BlendMode.srcIn),
                semanticsLabel: "profile svg",
              ),
              label: "profile",
            ),
          ],
          selectedItemColor: AppColors.primaryPurple,
          unselectedItemColor: AppColors.primaryGrey,
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
