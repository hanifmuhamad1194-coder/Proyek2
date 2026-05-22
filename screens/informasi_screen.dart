import 'package:flutter/material.dart';
import '../widgets/nav_pill.dart';
import '../widgets/informasi_card.dart';
import '../widgets/header_clipper.dart';

class InformasiScreen extends StatelessWidget {
  const InformasiScreen({super.key});

  final List<Map<String, String>> informasiList = const [
    {'title': 'Jadwal Kultum Subuh Ramadhan', 'subtitle': '1447 H/2026', 'image': 'https://images.unsplash.com/photo-1584551246679-0daf3d275d0f?w=400'},
    {'title': 'Buka bersama di masjid jami\' Al Istiqomah desa Loh Bener', 'subtitle': '1447 H/2026', 'image': 'https://images.unsplash.com/photo-1564121211835-e88c852648ab?w=400'},
    {'title': 'Gotong royong pembersihan Masjid', 'subtitle': '1447 H/2026', 'image': 'https://images.unsplash.com/photo-1584551246679-0daf3d275d0f?w=400'},
    {'title': 'Jadwal Kultum Subuh Ramadhan', 'subtitle': '1447 H/2026', 'image': 'https://images.unsplash.com/photo-1584551246679-0daf3d275d0f?w=400'},
    {'title': 'Buka bersama di masjid jami\' Al Istiqomah desa Loh Bener', 'subtitle': '1447 H/2026', 'image': 'https://images.unsplash.com/photo-1564121211835-e88c852648ab?w=400'},
    {'title': 'Gotong royong pembersihan Masjid', 'subtitle': '1447 H/2026', 'image': 'https://images.unsplash.com/photo-1584551246679-0daf3d275d0f?w=400'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: HeaderClipper(),
            child: Container(
              height: 200,
              decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF1B4332), Color(0xFF2D6A4F)])),
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(width: 40, height: 40, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)), child: const Icon(Icons.mosque, color: Color(0xFF1B4332))),
                          Flexible(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    NavPill(label: 'BERANDA', isActive: false),
                                    NavPill(label: 'INFORMASI', isActive: true),
                                    NavPill(label: 'LAYANAN', isActive: false, hasDropdown: true),
                                    NavPill(label: 'DONASI', isActive: false),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('INFORMASI', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    const Text('Masjid Jami\' Al Istiqomah', style: TextStyle(color: Colors.white70, fontSize: 14)),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final cardWidth = (constraints.maxWidth - 20) / 3;
                    final cardHeight = cardWidth * 1.35;
                    return Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: informasiList.map((item) {
                        return SizedBox(
                          width: cardWidth,
                          height: cardHeight,
                          child: InformasiCard(title: item['title']!, subtitle: item['subtitle']!, imageUrl: item['image']!),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}