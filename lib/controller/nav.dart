// Importing necessary packages and files.

import 'package:expense_tracker_app/views/home_screen.dart';
import 'package:expense_tracker_app/views/settings_screen.dart';
import 'package:expense_tracker_app/views/statistics_screen.dart';
import 'package:flutter/material.dart';

// Importing the ThemeNotifier class for theme management.

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  // Variable to track the current page index.
  int currentPageIndex = 0;
  // Declare the universal color
  late Color myColor;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    return Scaffold(
      // Bottom Navigation Bar
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.purple,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.stacked_bar_chart),
            label: 'Statistics ',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_rounded),
            label: 'Settings',
          ),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
      ),
      body: <Widget>[
        const HomeScreen(), // Display Home screen at index 0.
        const StatsScreen(), // Display ChartApp screen at index 1.
        const SettingsScreen(), // Display Settings screen at index 2.
      ][currentPageIndex],
    );
  }
}
