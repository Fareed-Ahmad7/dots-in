import 'package:dotsin_assignment/widgets/condition_callout.dart';
import 'package:dotsin_assignment/widgets/static_asset.dart';
import 'package:flutter/material.dart';

class HealthOverview extends StatelessWidget {
  const HealthOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Health Conditions Overview',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 420,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Positioned.fill(
              //   child: StaticAsset(
              //     assetPath: 'assets/images/body_background_glow.png',
              //     fit: BoxFit.contain,
              //   ),
              // ),
              Positioned(
                top: 5,
                bottom: 15,
                left: 55,
                right: 55,
                child: StaticAsset(
                  assetPath: 'assets/images/human_body.png',
                  fit: BoxFit.contain,
                ),
              ),

              Positioned(
                left: 30,
                top: 70,
                child: ConditionCallout(
                  title: 'Chronics Lungs',
                  subtitle: 'Problem',
                  color: const Color(0xFFFF4A16),
                ),
              ),

              Positioned(
                right: 8,
                top: 12,
                child: ConditionCallout(
                  title: 'Recovery slight\npain in the left\nside neck.',
                  subtitle: 'View in Details →',
                  color: const Color(0xFF51FF19),
                  width: 128,
                  compact: true,
                ),
              ),

              Positioned(
                left: 40,
                top: 215,
                child: ConditionCallout(
                  title: 'Knee Problem',
                  color: const Color(0xFFFF4A16),
                  width: 102,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
