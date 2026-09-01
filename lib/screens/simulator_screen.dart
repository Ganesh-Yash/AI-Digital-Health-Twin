import 'package:flutter/material.dart';

class SimulatorScreen extends StatefulWidget {
  const SimulatorScreen({super.key});

  @override
  State<SimulatorScreen> createState() => _SimulatorScreenState();
}

class _SimulatorScreenState extends State<SimulatorScreen> {
  double _sleep = 6.5;
  double _steps = 5000;
  double _carbs = 180;

  int _calculateProjectedBioAge() {
    int age = 22;
    if (_sleep >= 7.5) age -= 1;
    if (_steps >= 9000) age -= 2;
    if (_carbs > 200) age += 2;
    return age;
  }

  @override
  Widget build(BuildContext context) {
    int projectedAge = _calculateProjectedBioAge();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Twin "What-If" Simulation Engine',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF0F2027),
                    Color(0xFF203A43),
                    Color(0xFF2C5364)
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF00F2FE).withOpacity(0.5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "PROJECTED BIOLOGICAL AGE",
                        style: TextStyle(
                          color: Color(0xFF00F2FE),
                          fontSize: 11,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "$projectedAge Years",
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Chronological Baseline: 22 Years",
                        style: TextStyle(fontSize: 11, color: Colors.white54),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: projectedAge <= 22
                          ? Colors.green.withOpacity(0.2)
                          : Colors.orange.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      projectedAge <= 22
                          ? Icons.trending_down
                          : Icons.trending_up,
                      color: projectedAge <= 22
                          ? Colors.greenAccent
                          : Colors.orangeAccent,
                      size: 36,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Simulate Lifestyle Interventions",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSliderCard(
              "Sleep Duration",
              "${_sleep.toStringAsFixed(1)} hrs/day",
              _sleep,
              4,
              10,
              (v) => setState(() => _sleep = v),
              Colors.cyanAccent,
            ),
            _buildSliderCard(
              "Daily Activity",
              "${_steps.toInt()} steps",
              _steps,
              1000,
              15000,
              (v) => setState(() => _steps = v),
              Colors.greenAccent,
            ),
            _buildSliderCard(
              "Carbohydrate Intake",
              "${_carbs.toInt()} grams/day",
              _carbs,
              50,
              350,
              (v) => setState(() => _carbs = v),
              Colors.orangeAccent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderCard(
    String title,
    String valText,
    double val,
    double min,
    double max,
    Function(double) onChanged,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF141C2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                ),
              ),
              Text(
                valText,
                style: TextStyle(color: color, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Slider(
            value: val,
            min: min,
            max: max,
            activeColor: color,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}