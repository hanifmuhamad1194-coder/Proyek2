import 'package:flutter/material.dart';

class LaporanKeuanganScreen extends StatelessWidget {
  const LaporanKeuanganScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Laporan Keuangan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1B4332))),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
            child: const Center(child: Text('Laporan Keuangan Detail')),
          ),
        ],
      ),
    );
  }
}