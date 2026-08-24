import 'package:dotsin_assignment/widgets/static_asset.dart';
import 'package:flutter/material.dart';

class HyperprolactinemiaSection extends StatelessWidget {
  const HyperprolactinemiaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 154,
          height: 150,
          child: StaticAsset(
            assetPath: 'assets/images/hyper_img.png',
            borderRadius: BorderRadius.circular(8),
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ABOUT Hyperprolactinemia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  'This condition is characterized by abnormally high levels of prolactin in the blood, which can result from various factors, including dopamine dysfunction, certain medications, or tumors of the pituitary gland (prolactinomas).',
                  style: TextStyle(
                    color: Color(0xFF969696),
                    fontSize: 12,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
