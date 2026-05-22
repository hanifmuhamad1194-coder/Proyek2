import 'package:flutter/material.dart';

class BarChartColumn extends StatelessWidget {
  final String label;
  final double pemasukan;
  final double pengeluaran;
  const BarChartColumn({super.key, required this.label, required this.pemasukan, required this.pengeluaran});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 8, height: 150 * pemasukan, decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(2))),
              const SizedBox(width: 2),
              Container(width: 8, height: 150 * pengeluaran, decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(2))),
            ],
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}