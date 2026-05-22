import 'package:flutter/material.dart';

class NavPill extends StatelessWidget {
  final String label;
  final bool isActive;
  final bool hasDropdown;
  const NavPill({super.key, required this.label, this.isActive = false, this.hasDropdown = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: isActive ? BoxDecoration(color: Colors.yellow.shade400, borderRadius: BorderRadius.circular(15)) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: TextStyle(color: isActive ? const Color(0xFF1B4332) : Colors.white, fontSize: 10, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
          if (hasDropdown) ...[const SizedBox(width: 2), Icon(Icons.keyboard_arrow_down, size: 12, color: isActive ? const Color(0xFF1B4332) : Colors.white)],
        ],
      ),
    );
  }
}