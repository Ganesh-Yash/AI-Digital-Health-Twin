import 'package:flutter/material.dart';
import '../widgets/metric_card.dart';

class TwinDashboardScreen extends StatelessWidget {
  const TwinDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DIGITAL TWIN REPLICA',
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 1.5,
                color: Color(0xFF00F2FE),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Patient: Yaswanth G. (ID: DT-23BQ1A)',
              style: TextStyle(fontSize: 12, color: Colors.white60),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.15),
              border: Border.all(color: Colors.greenAccent),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                CircleAvatar(radius: 4, backgroundColor: Colors.greenAccent),
                SizedBox(width: 6),
                Text(
                  'TWIN SYNCED',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BiologicalAgeCard(),
            SizedBox(height: 16),
            Text(
              "Organ Systems Health Status",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OrganStatusCard(
                    organ: "Cardiovascular",
                    status: "Optimal",
                    healthScore: 94,
                    icon: Icons.favorite,
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: OrganStatusCard(
                    organ: "Pulmonary (Lungs)",
                    status: "Good",
                    healthScore: 98,
                    icon: Icons.air,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OrganStatusCard(
                    organ: "Metabolic / Sugar",
                    status: "Attention",
                    healthScore: 72,
                    icon: Icons.water_drop,
                    color: Colors.orangeAccent,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: OrganStatusCard(
                    organ: "Renal System",
                    status: "Optimal",
                    healthScore: 91,
                    icon: Icons.shield,
                    color: Colors.purpleAccent,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Live IoMT Sensor Streams",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            LiveVitalTile(
              name: "Heart Rate",
              value: "74 BPM",
              trend: "Normal Sinus Rhythm",
              isAlert: false,
              waveformColor: Colors.redAccent,
            ),
            LiveVitalTile(
              name: "Oxygen Saturation (SpO2)",
              value: "98 %",
              trend: "Stable",
              isAlert: false,
              waveformColor: Colors.cyanAccent,
            ),
            LiveVitalTile(
              name: "Blood Glucose (Continuous)",
              value: "135 mg/dL",
              trend: "+12 mg/dL Post-Meal",
              isAlert: true,
              waveformColor: Colors.orangeAccent,
            ),
          ],
        ),
      ),
    );
  }
}

class _BiologicalAgeCard extends StatelessWidget {
  const _BiologicalAgeCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1A2639), Color(0xFF111823)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TWIN HEALTH INDEX",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.white54,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "88",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00F2FE),
                    ),
                  ),
                  Text(
                    " /100",
                    style: TextStyle(fontSize: 14, color: Colors.white38),
                  ),
                ],
              ),
              Text(
                "Digital Twin status: Healthy Baseline",
                style: TextStyle(fontSize: 11, color: Colors.greenAccent),
              ),
            ],
          ),
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF00F2FE), width: 3),
            ),
            child: const Center(
              child: Icon(
                Icons.person_outline_rounded,
                color: Color(0xFF00F2FE),
                size: 36,
              ),
            ),
          ),
        ],
      ),
    );
  }
}