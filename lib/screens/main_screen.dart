import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'predictive_risk_screen.dart';
import 'simulator_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const TwinDashboardScreen(),
    const PredictiveRiskScreen(),
    const SimulatorScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        backgroundColor: const Color(0xFF101726),
        indicatorColor: const Color(0xFF00F2FE).withOpacity(0.2),
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.accessibility_new_rounded, color: Colors.white70),
            selectedIcon: Icon(
              Icons.accessibility_new_rounded,
              color: Color(0xFF00F2FE),
            ),
            label: 'Twin Avatar',
          ),
          NavigationDestination(
            icon: Icon(Icons.analytics_outlined, color: Colors.white70),
            selectedIcon: Icon(
              Icons.analytics_rounded,
              color: Color(0xFF00F2FE),
            ),
            label: 'AI Risk & XAI',
          ),
          NavigationDestination(
            icon: Icon(Icons.science_outlined, color: Colors.white70),
            selectedIcon: Icon(
              Icons.science_rounded,
              color: Color(0xFF00F2FE),
            ),
            label: 'Trajectory Sim',
          ),
        ],
      ),
    );
  }
}