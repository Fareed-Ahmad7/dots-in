import 'package:flutter/material.dart';

class ConditionCallout extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color color;
  final double width;
  final bool compact;

  const ConditionCallout({
    super.key,
    required this.title,
    required this.color,
    this.subtitle,
    this.width = 108,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 12 : 8,
        vertical: compact ? 9 : 6,
      ),
      decoration: BoxDecoration(
        color: const Color(0xCC030703),
        border: Border.all(color: color.withValues(alpha: .8)),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: compact ? 11 : 10,
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 2),
            Text(
              subtitle!,
              style: TextStyle(
                color: color,
                fontSize: 8,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
