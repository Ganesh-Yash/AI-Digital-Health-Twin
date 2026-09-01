import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const DigitalHealthTwinApp());
}

class DigitalHealthTwinApp extends StatelessWidget {
  const DigitalHealthTwinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Digital Health Twin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0E17), // Cyber Dark
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF00F2FE), // Neon Cyan
          secondary: const Color(0xFF4FACFE),
          surface: const Color(0xFF141C2E),
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}