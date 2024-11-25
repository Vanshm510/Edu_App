import 'package:elearning/constant/color.dart';
import 'package:elearning/constant/size.dart';
import 'package:elearning/view/home/home_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static String route = "MainScreen";
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: kPrimaryColor,
            backgroundColor: Colors.white54,
            elevation: 0,
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home_rounded,
                  size: kBottomNavigationBarItemSize,
                ),
                icon: Icon(
                  Icons.home_outlined,
                  size: kBottomNavigationBarItemSize,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.leaderboard_rounded,
                  size: kBottomNavigationBarItemSize,
                ),
                icon: Icon(
                  Icons.leaderboard_outlined,
                  size: kBottomNavigationBarItemSize,
                ),
                label: "Leadrboard",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.notifications,
                  size: kBottomNavigationBarItemSize,
                ),
                icon: Icon(
                  Icons.notifications_none,
                  size: kBottomNavigationBarItemSize,
                ),
                label: "Notifications",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  size: kBottomNavigationBarItemSize,
                ),
                icon: Icon(
                  Icons.settings_outlined,
                  size: kBottomNavigationBarItemSize,
                ),
                label: "Settings",
              ),
            ]),
      ),
    );
  }
}
