import 'package:dotsin_assignment/widgets/static_asset.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 24,
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Phenotype',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          StaticAsset(
            assetPath: 'assets/images/header_img.png',
            width: 34,
            height: 34,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
