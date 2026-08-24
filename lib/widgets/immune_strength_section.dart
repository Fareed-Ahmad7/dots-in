import 'package:dotsin_assignment/widgets/static_asset.dart';
import 'package:flutter/material.dart';

class ImmuneStrengthSection extends StatelessWidget {
  const ImmuneStrengthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Immune system strength',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 300,
          child: Stack(
            alignment: Alignment.center,
            children: [
              StaticAsset(
                assetPath: 'assets/images/immune_strength.png',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
