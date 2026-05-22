import 'package:flutter/material.dart';
import '../widgets/nav_pill.dart';

class LayananScreen extends StatelessWidget {
  const LayananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1584551246679-0daf3d275d0f?w=800'), fit: BoxFit.cover),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xFF1B4332).withOpacity(0.9), const Color(0xFF1B4332).withOpacity(0.95), Colors.black.withOpacity(0.8)],
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
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
                                  NavPill(label: 'INFORMASI', isActive: false),
                                  NavPill(label: 'LAYANAN', isActive: true, hasDropdown: true),
                                  NavPill(label: 'DONASI', isActive: false),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(width: 200, height: 200, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.1), border: Border.all(color: Colors.white.withOpacity(0.3), width: 2)), child: const Icon(Icons.mosque, size: 100, color: Colors.white70)),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('SELAMAT DATANG', style: TextStyle(color: Colors.yellow, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1)),
                        const SizedBox(height: 8),
                        const Text('Masjid Jami\' Al Istiqomah', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                        const Text('Loh Bener, Indramayu', style: TextStyle(color: Colors.white70, fontSize: 20, fontStyle: FontStyle.italic)),
                        const SizedBox(height: 16),
                        Text('Silaturahmi, cinta dan rasa saling urat yang transparan di Loh Bener. Menjaga amanah, mengut kedaulatan, demi kesegarahan bersama.', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 13, height: 1.5)),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.white.withOpacity(0.2), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                          child: const Row(mainAxisSize: MainAxisSize.min, children: [Text('Tentang SmartKas'), SizedBox(width: 8), Icon(Icons.arrow_forward, size: 16)]),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}