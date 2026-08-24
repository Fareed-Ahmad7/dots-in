import 'package:flutter/material.dart';

class ModeSwitcher extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int>? onChanged;

  const ModeSwitcher({super.key, this.selectedIndex = 1, this.onChanged});

  @override
  State<ModeSwitcher> createState() => ModeSwitcherState();
}

class ModeSwitcherState extends State<ModeSwitcher> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  void _select(int index) {
    setState(() {
      selectedIndex = index;
    });

    widget.onChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _select(0),
              behavior: HitTestBehavior.opaque,
              child: _TabItem(title: 'Genotype', selected: selectedIndex == 0),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => _select(1),
              behavior: HitTestBehavior.opaque,
              child: _TabItem(title: 'Phenotype', selected: selectedIndex == 1),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool selected;

  const _TabItem({required this.title, required this.selected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF292929) : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: selected ? const Color(0xFFE4E4E4) : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
