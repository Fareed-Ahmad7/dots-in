import 'package:flutter/material.dart';

class ImmuneRecommendationCard extends StatelessWidget {
  const ImmuneRecommendationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 18),
      decoration: BoxDecoration(
        color: const Color(0xB806141A),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: const Color(0xFF00CBEF), width: 1),
        boxShadow: const [BoxShadow(color: Color(0x5500BFE8), blurRadius: 15)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Immune System Recommendation:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Maintaining a strong immune system is essential for overall health and protection against illness.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              height: 1.45,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'We recommend:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          const _Bullet(
            'Eating a balanced diet rich in fruits, vegetables, and proteins.',
          ),
          const _Bullet(
            'Staying hydrated and getting enough sleep (7–8 hours).',
          ),
          const _Bullet(
            'Regular exercise to boost immunity and reduce stress.',
          ),
          const SizedBox(height: 8),
          const Text(
            'Strengths :',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          const _MarkerGrid(color: Color(0xFF1CBF0C), count: 6),
          const SizedBox(height: 14),
          const Text(
            'Weakness :',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          const _MarkerGrid(color: Color(0xFFFF1D12), count: 5),
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;

  const _Bullet(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '•  ',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                height: 1.4,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MarkerGrid extends StatelessWidget {
  final Color color;
  final int count;

  const _MarkerGrid({required this.color, required this.count});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 7,
      runSpacing: 7,
      children: List.generate(
        count,
        (index) => _Marker(color: color, value: '0.05'),
      ),
    );
  }
}

class _Marker extends StatelessWidget {
  final Color color;
  final String value;

  const _Marker({required this.color, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .08),
        border: Border.all(color: color.withValues(alpha: .7)),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Text(
            'HCV Antibody',
            style: TextStyle(
              color: Colors.white,
              fontSize: 8,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
