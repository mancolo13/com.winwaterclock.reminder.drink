import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';


class Tab2Screen extends StatelessWidget {
  const Tab2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final timeline = [
      {'time': '08:15 AM', 'vol': '350 ml', 'bev': 'Mineral Water'},
      {'time': '10:45 AM', 'vol': '250 ml', 'bev': 'Green Tea'},
      {'time': '01:30 PM', 'vol': '500 ml', 'bev': 'Pure Water'},
      {'time': '04:15 PM', 'vol': '400 ml', 'bev': 'Electrolyte Mix'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Win • Drink Timeline')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: timeline.length,
        itemBuilder: (context, i) {
          final t = timeline[i];
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: AppTheme.surfaceColor, borderRadius: BorderRadius.circular(14)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.water_drop, color: AppTheme.primaryColor),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t['bev']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(t['time']!, style: const TextStyle(color: Colors.white60, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                Text(t['vol']!, style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.secondaryColor, fontSize: 15)),
              ],
            ),
          );
        },
      ),
    );
  }
}

