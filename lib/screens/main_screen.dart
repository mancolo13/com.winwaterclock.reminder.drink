import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'tabs/tab1_screen.dart';
import 'tabs/tab2_screen.dart';
import 'tabs/tab3_screen.dart';
import 'tabs/tab4_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    Tab1Screen(),
    Tab2Screen(),
    Tab3Screen(),
    Tab4Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        backgroundColor: AppTheme.surfaceColor,
        indicatorColor: AppTheme.primaryColor.withValues(alpha: 0.2),
        destinations: [
        NavigationDestination(
          icon: const Icon(Icons.water_drop_outlined),
          selectedIcon: const Icon(Icons.water_drop, color: AppTheme.primaryColor),
          label: 'Intake',
        ),
        NavigationDestination(
          icon: const Icon(Icons.alarm_outlined),
          selectedIcon: const Icon(Icons.alarm, color: AppTheme.primaryColor),
          label: 'Schedule',
        ),
        NavigationDestination(
          icon: const Icon(Icons.view_list_outlined),
          selectedIcon: const Icon(Icons.view_list, color: AppTheme.primaryColor),
          label: 'Log',
        ),
        NavigationDestination(
          icon: const Icon(Icons.show_chart_outlined),
          selectedIcon: const Icon(Icons.show_chart, color: AppTheme.primaryColor),
          label: 'Trends',
        ),

        ],
      ),
    );
  }
}
