import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';


class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});
  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> {
  int _intake = 1850;
  final int _target = 2500;

  @override
  Widget build(BuildContext context) {
    final pct = (_intake / _target).clamp(0.0, 1.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Win • HydroClock'),
        actions: [
          IconButton(
            icon: const Icon(Icons.water_drop, color: AppTheme.primaryColor),
            onPressed: () => RoutingService.openRegistrationUrl(),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [AppTheme.primaryColor.withValues(alpha: 0.35), AppTheme.surfaceColor],
                radius: 0.9,
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppTheme.primaryColor.withValues(alpha: 0.4)),
            ),
            child: Column(
              children: [
                const Text('DAILY WATER INTAKE', style: TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                const SizedBox(height: 16),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 170,
                      height: 170,
                      child: CircularProgressIndicator(
                        value: pct,
                        strokeWidth: 14,
                        backgroundColor: Colors.white12,
                        color: AppTheme.primaryColor,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('$_intake', style: const TextStyle(fontSize: 38, fontWeight: FontWeight.w900)),
                        const Text('OF 2500 ML', style: TextStyle(fontSize: 11, color: Colors.white60, letterSpacing: 1.2)),
                        const SizedBox(height: 4),
                        Text('${(pct * 100).toInt()}% Done', style: const TextStyle(color: AppTheme.secondaryColor, fontWeight: FontWeight.bold, fontSize: 13)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _logBtn('+200 ml', 200),
                    _logBtn('+350 ml', 350),
                    _logBtn('+500 ml', 500),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _infoTile('Remaining to target', '${_target - _intake} ml needed today'),
          _infoTile('Hydration Streak', '14 consecutive days goal met 🔥'),
        ],
      ),
    );
  }

  Widget _logBtn(String label, int val) {
    return ElevatedButton(
      onPressed: () => setState(() => _intake = (_intake + val).clamp(0, 5000)),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(label),
    );
  }

  Widget _infoTile(String t, String v) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppTheme.surfaceColor, borderRadius: BorderRadius.circular(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(t, style: const TextStyle(color: Colors.white70)),
          Text(v, style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.secondaryColor)),
        ],
      ),
    );
  }
}

