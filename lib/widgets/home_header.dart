import 'package:dotsin_assignment/models/organ_item.dart';
import 'package:dotsin_assignment/widgets/static_asset.dart';
import 'package:flutter/material.dart';
class Header extends StatefulWidget {
  final String selectedOrgan;
  final ValueChanged<String> onOrganSelected;

  const Header({
    super.key,
    required this.selectedOrgan,
    required this.onOrganSelected,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final LayerLink _layerLink = LayerLink();

  OverlayEntry? _overlayEntry;

  final List<OrganItem> organs = [
    OrganItem(name: 'Heart', asset: 'assets/organs/heart.png'),
    OrganItem(name: 'Lungs', asset: 'assets/organs/lungs.png'),
    OrganItem(name: 'Kidneys', asset: 'assets/organs/kidney.png'),
    OrganItem(name: 'Brain', asset: 'assets/organs/brain.png'),
    OrganItem(name: 'Bones', asset: 'assets/organs/spine.png'),
    OrganItem(name: 'Stomach', asset: 'assets/organs/stomach.png'),
    OrganItem(name: 'Intestine', asset: 'assets/organs/intestine.png'),
  ];

  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _showDropdown();
    } else {
      _removeDropdown();
    }
  }

  void _showDropdown() {
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            // Tap outside to close
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: _removeDropdown,
                child: const SizedBox(),
              ),
            ),

            CompositedTransformFollower(
              link: _layerLink,

              // Dropdown appears below the header image
              targetAnchor: Alignment.bottomLeft,
              followerAnchor: Alignment.topLeft,

              offset: const Offset(-170, 8),

              child: Material(
                color: Colors.transparent,
                child: _buildDropdown(),
              ),
            ),
          ],
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeDropdown();
    super.dispose();
  }

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

          CompositedTransformTarget(
            link: _layerLink,
            child: GestureDetector(
              onTap: _toggleDropdown,
              child: StaticAsset(
                assetPath: 'assets/images/header_img.png',
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      width: 208,
      decoration: BoxDecoration(
        color: const Color(0xFF292929),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.45),
            blurRadius: 35,
            spreadRadius: 8,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Container(
            height: 65,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Organ Metrics',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: _removeDropdown,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1D1D1D),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF008F87),
                        width: 0.8,
                      ),
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_up,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Organ list
          ...organs.map((organ) => _buildOrganItem(organ)),

          const SizedBox(height: 8),

          // Blood Metrics
          _buildBottomOption('Blood Metrics'),

          const SizedBox(height: 10),

          // Hormone
          _buildBottomOption('Hormone'),

          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildOrganItem(OrganItem organ) {
    final bool selected = widget.selectedOrgan == organ.name;

    return GestureDetector(
      onTap: () {
        // Tell PhenotypeScreen which organ was selected
        widget.onOrganSelected(organ.name);

        // Close dropdown
        _removeDropdown();
      },
      child: Container(
        height: 73,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 58,
              height: 58,
              child: StaticAsset(assetPath: organ.asset!),
            ),

            const SizedBox(width: 8),

            Expanded(
              child: Text(
                organ.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomOption(String title) {
    return GestureDetector(
      onTap: () {
        _removeDropdown();
      },
      child: Container(
        height: 55,
        margin: const EdgeInsets.symmetric(horizontal: 7),
        decoration: BoxDecoration(
          color: const Color(0xFF1D1D1D),
          borderRadius: BorderRadius.circular(25),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
