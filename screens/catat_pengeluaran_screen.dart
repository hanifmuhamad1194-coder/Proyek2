import 'package:flutter/material.dart';

class CatatPengeluaranScreen extends StatelessWidget {
  const CatatPengeluaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Riwayat Pengeluaran', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1B4332))),
              ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.add, size: 16), label: const Text('Tambah'), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1B4332), foregroundColor: Colors.white)),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 20,
                columns: const [DataColumn(label: Text('No')), DataColumn(label: Text('Periode')), DataColumn(label: Text('Total')), DataColumn(label: Text('Keterangan')), DataColumn(label: Text('Aksi'))],
                rows: [
                  _buildPengeluaranRow('1', 'April - Minggu 2', 'Rp. 900.000', '-'),
                  _buildPengeluaranRow('2', 'April - Minggu 1', 'Rp. 1.200.000', '-'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildPengeluaranRow(String no, String periode, String total, String keterangan) {
    return DataRow(
      cells: [
        DataCell(Text(no)),
        DataCell(Text(periode)),
        DataCell(Text(total, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.red))),
        DataCell(Text(keterangan)),
        DataCell(Row(mainAxisSize: MainAxisSize.min, children: [IconButton(icon: const Icon(Icons.edit, size: 18, color: Colors.blue), onPressed: () {}), IconButton(icon: const Icon(Icons.delete, size: 18, color: Colors.red), onPressed: () {})])),
      ],
    );
  }
}