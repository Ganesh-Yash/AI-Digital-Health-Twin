import 'package:flutter/material.dart';

class XaiRiskCard extends StatelessWidget {
  final String disease;
  final int probability;
  final String level;
  final Color levelColor;
  final List<String> keyFactors;

  const XaiRiskCard({
    super.key,
    required this.disease,
    required this.probability,
    required this.level,
    required this.levelColor,
    required this.keyFactors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF141C2E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: levelColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                disease,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                "$probability% | $level",
                style: TextStyle(
                  color: levelColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: probability / 100,
            backgroundColor: Colors.white10,
            color: levelColor,
            minHeight: 6,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 12),
          const Text(
            "Explainable AI (SHAP) Risk Drivers:",
            style: TextStyle(
              fontSize: 10,
              color: Colors.white54,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: keyFactors
                .map(
                  (f) => Text(
                    "• $f",
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white70,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}