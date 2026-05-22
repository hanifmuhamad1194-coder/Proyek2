import 'package:flutter/material.dart';

class CatatPemasukanScreen extends StatelessWidget {
  const CatatPemasukanScreen({super.key});

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
              const Text('Riwayat Pemasukan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1B4332))),
              ElevatedButton.icon(onPressed: () => _showTambahPemasukanDialog(context), icon: const Icon(Icons.add, size: 16), label: const Text('Tambah'), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1B4332), foregroundColor: Colors.white)),
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
                  _buildPemasukanRow('1', 'April - Minggu 2', 'Rp. 2.000.000', '-'),
                  _buildPemasukanRow('2', 'April - Minggu 1', 'Rp. 2.000.000', '-'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildPemasukanRow(String no, String periode, String total, String keterangan) {
    return DataRow(
      cells: [
        DataCell(Text(no)),
        DataCell(Text(periode)),
        DataCell(Text(total, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.green))),
        DataCell(Text(keterangan)),
        DataCell(Row(mainAxisSize: MainAxisSize.min, children: [IconButton(icon: const Icon(Icons.edit, size: 18, color: Colors.blue), onPressed: () {}), IconButton(icon: const Icon(Icons.delete, size: 18, color: Colors.red), onPressed: () {})])),
      ],
    );
  }

  void _showTambahPemasukanDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Tambah Pemasukan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1B4332))), IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context))]),
                const SizedBox(height: 16),
                _buildFormField('Bulan', Icons.calendar_today),
                const SizedBox(height: 10),
                _buildFormField('Minggu Ke-', Icons.date_range),
                const SizedBox(height: 10),
                _buildFormField('Infaq Jumat (Rp)', Icons.money),
                const SizedBox(height: 10),
                _buildFormField('Kotak Amal Harian (Rp)', Icons.savings),
                const SizedBox(height: 10),
                _buildFormField('Zakat / Fidyah (Rp)', Icons.volunteer_activism),
                const SizedBox(height: 10),
                _buildFormField('Donasi Online (Rp)', Icons.language),
                const SizedBox(height: 10),
                _buildFormField('Pemasukan Lainnya (Rp)', Icons.add_circle),
                const SizedBox(height: 10),
                _buildFormField('Keterangan (Opsional)', Icons.note, isOptional: true),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                  child: const Text('TOTAL: Rp 0', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: OutlinedButton(onPressed: () => Navigator.pop(context), child: const Text('Batal'))),
                    const SizedBox(width: 12),
                    Expanded(child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1B4332), foregroundColor: Colors.white), child: const Text('Simpan'))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, IconData icon, {bool isOptional = false}) {
    return TextField(
      decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon, size: 20), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12)),
      keyboardType: label.contains('Rp') ? TextInputType.number : TextInputType.text,
    );
  }
}