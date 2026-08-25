import 'package:dotsin_assignment/widgets/condition_callout.dart';
import 'package:dotsin_assignment/widgets/static_asset.dart';
import 'package:flutter/material.dart';

class HealthOverview extends StatefulWidget {
  final String? selectedOrgan;
  const HealthOverview(this.selectedOrgan, {super.key});

  @override
  State<HealthOverview> createState() => _HealthOverviewState();
}

class _HealthOverviewState extends State<HealthOverview> {
  final Map<String, OrganCondition> organConditions = {
    'Heart': const OrganCondition(
      title: 'Better Cardiac condition than past',
      color: Color(0xFF51FF19),
    ),

    'Lungs': const OrganCondition(
      title: 'Chronic Lungs',
      subtitle: 'Problem',
      color: Color(0xFFFF4A16),
    ),

    'Kidneys': const OrganCondition(
      title: 'Kidney condition needs attention',
      subtitle: 'Problem',
      color: Color(0xFFFF4A16),
    ),

    'Brain': const OrganCondition(
      title: 'Better Brain condition than past',
      color: Color(0xFF51FF19),
    ),

    'Bones': const OrganCondition(
      title: 'Bone health is stable',
      color: Color(0xFF51FF19),
    ),

    'Stomach': const OrganCondition(
      title: 'Stomach condition needs attention',
      subtitle: 'Problem',
      color: Color(0xFFFF4A16),
    ),

    'Intestine': const OrganCondition(
      title: 'Intestinal health is improving',
      color: Color(0xFF51FF19),
    ),
  };
  @override
  Widget build(BuildContext context) {
    // print(widget.selectedOrgan);
    final condition = organConditions[widget.selectedOrgan];
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
                  assetPath: getImg(widget.selectedOrgan),
                  fit: BoxFit.contain,
                ),
              ),

              Positioned(
                left: 30,
                top: 70,
                // child: ConditionCallout(
                //   title: widget.selectedOrgan == "Heart"
                //       ? "Better Cardiac condition than past"
                //       : 'Chronics Lungs',
                //   subtitle: widget.selectedOrgan == "Heart" ? null : 'Problem',
                //   color: widget.selectedOrgan == "Heart"
                //       ? const Color(0xFF51FF19)
                //       : const Color(0xFFFF4A16),
                // ),
                child: ConditionCallout(
                  title: condition?.title ?? 'Chronics Lungs Problem',
                  subtitle: condition?.subtitle,
                  color: condition?.color ?? Color(0xFFFF4A16),
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

  String getImg(String? selectedOrgan) {
    if (selectedOrgan == "Heart") {
      return "assets/images/heart_img.png";
    }
    return "assets/images/human_body.png";
  }
}

class OrganCondition {
  final String title;
  final String? subtitle;
  final Color color;

  const OrganCondition({
    required this.title,
    this.subtitle,
    required this.color,
  });
}
