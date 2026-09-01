import 'package:flutter/material.dart';
import '../widgets/risk_indicator.dart';

class PredictiveRiskScreen extends StatelessWidget {
  const PredictiveRiskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AI Disease Risk & Explainability (XAI)',
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
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF141C2E),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF00F2FE).withOpacity(0.3),
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.memory, color: Color(0xFF00F2FE), size: 30),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Ensemble Models (XGBoost + Random Forest) active. Analyzing 24-hour vitals window.",
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Multi-Disease Risk Predictions",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const XaiRiskCard(
              disease: "Type-2 Diabetes Mellitus",
              probability: 38,
              level: "MODERATE RISK",
              levelColor: Colors.orangeAccent,
              keyFactors: [
                "Elevated Fasting Glucose (+18%)",
                "Low Daily Step Count (+12%)",
                "BMI Trajectory (+8%)"
              ],
            ),
            const XaiRiskCard(
              disease: "Cardiovascular Disease",
              probability: 14,
              level: "LOW RISK",
              levelColor: Colors.greenAccent,
              keyFactors: [
                "Blood Pressure Normal (-10%)",
                "Stable Resting Heart Rate (-4%)"
              ],
            ),
            const XaiRiskCard(
              disease: "Hypertension Stage-1",
              probability: 22,
              level: "LOW RISK",
              levelColor: Colors.greenAccent,
              keyFactors: ["Systolic BP fluctuating under 125 mmHg"],
            ),
          ],
        ),
      ),
    );
  }
}