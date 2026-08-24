import 'package:flutter/material.dart';

class NeurotransmitterSwitcher extends StatefulWidget {
  const NeurotransmitterSwitcher({super.key, this.onChanged});

  final ValueChanged<String>? onChanged;

  @override
  State<NeurotransmitterSwitcher> createState() =>
      NeurotransmitterSwitcherState();
}

class NeurotransmitterSwitcherState extends State<NeurotransmitterSwitcher> {
  String selected = 'Serotonin';

  void _select(String value) {
    setState(() {
      selected = value;
    });

    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 252,
        height: 52,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0xFF050805),
          border: Border.all(color: const Color(0xFF18331A)),
          borderRadius: BorderRadius.circular(19),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _select('Dopamine'),
                child: _buildOption(
                  title: 'Dopamine',
                  isSelected: selected == 'Dopamine',
                ),
              ),
            ),

            Expanded(
              child: GestureDetector(
                onTap: () => _select('Serotonin'),
                child: _buildOption(
                  title: 'Serotonin',
                  isSelected: selected == 'Serotonin',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({required String title, required bool isSelected}) {
    if (!isSelected) {
      return Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF6D747A),
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
      );
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF14C936), Color(0xFF087D24)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Color(0x6617D43C), blurRadius: 12)],
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
