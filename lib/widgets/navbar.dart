import 'package:flutter/material.dart';

import '../screens/reminder_screen.dart';
import '../screens/category_screen.dart';
import '../main.dart';

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
    return SizedBox(
      height: 56,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
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
            selectedItemColor: AppColor.greenTambourine,
          ),
        ),
      ),
    );
  }
}
