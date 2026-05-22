import 'package:flutter/material.dart';

class InformasiCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  const InformasiCard({super.key, required this.title, required this.subtitle, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xFF1B4332), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(imageUrl, height: 65, width: double.infinity, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) => Container(height: 65, color: const Color(0xFF2D6A4F), child: const Icon(Icons.image, color: Colors.white54))),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontSize: 9.5, fontWeight: FontWeight.w600, height: 1.2), maxLines: 3, overflow: TextOverflow.ellipsis),
                  const Spacer(),
                  Text(subtitle, style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 8.5)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}