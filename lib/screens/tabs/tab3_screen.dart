import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';


class Tab3Screen extends StatelessWidget {
  const Tab3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Win • Beverage Hydration Index')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _bevCard('Pure Filtered Water', '100% Hydration Index'),
          _bevCard('Electrolyte Coconut Water', '115% High Absorption'),
          _bevCard('Green Tea & Herbal Infusion', '95% Effective Hydration'),
        ],
      ),
    );
  }

  Widget _bevCard(String name, String index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: AppTheme.surfaceColor, borderRadius: BorderRadius.circular(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(index, style: const TextStyle(color: AppTheme.secondaryColor, fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }
}

