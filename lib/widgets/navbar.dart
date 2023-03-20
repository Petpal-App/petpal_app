import 'package:flutter/material.dart';
import '../screens/reminder_screen.dart';
import '../screens/category_screen.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  NavBar({required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        if (currentIndex != 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CategoryScreen()),
          );
        }
        break;
      case 1:
        if (currentIndex != 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ReminderScreen()),
          );
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Reminder',
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
    );
  }
}
