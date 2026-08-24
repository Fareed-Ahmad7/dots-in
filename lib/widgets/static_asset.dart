

import 'package:flutter/material.dart';

class StaticAsset extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const StaticAsset({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: const Color(0x1500FF3C),
            borderRadius: borderRadius,
            border: Border.all(color: const Color(0x2233FF66)),
          ),
          child: const Center(
            child: Icon(Icons.image_outlined, color: Color(0x5566FF88)),
          ),
        );
      },
    );

    if (borderRadius == null) {
      return image;
    }

    return ClipRRect(borderRadius: borderRadius!, child: image);
  }
}
