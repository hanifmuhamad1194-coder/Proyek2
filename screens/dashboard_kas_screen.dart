import 'package:flutter/material.dart';
import '../widgets/summary_card.dart';
import '../widgets/bar_chart_column.dart';
import '../widgets/legend_item.dart';

class DashboardKasScreen extends StatelessWidget {
  const DashboardKasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Dashboard Kas Masjid', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1B4332))),
              ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.refresh, size: 16), label: const Text('Refresh'), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1B4332), foregroundColor: Colors.white)),
            ],
          ),
          const SizedBox(height: 16),
          isWideScreen
              ? Row(
                  children: [
                    Expanded(child: SummaryCard(title: 'Total Pemasukan', amount: 'Rp. 15.800.000', icon: Icons.arrow_upward, color: Colors.green)),
                    const SizedBox(width: 12),
                    Expanded(child: SummaryCard(title: 'Total Pengeluaran', amount: 'Rp. 10.500.000', icon: Icons.arrow_downward, color: Colors.red)),
                    const SizedBox(width: 12),
                    Expanded(child: SummaryCard(title: 'Total Saldo Kas Masjid', amount: 'Rp. 5.300.000', icon: Icons.account_balance_wallet, color: Colors.blue)),
                  ],
                )
              : Column(
                  children: [
                    SummaryCard(title: 'Total Pemasukan', amount: 'Rp. 15.800.000', icon: Icons.arrow_upward, color: Colors.green),
                    const SizedBox(height: 12),
                    SummaryCard(title: 'Total Pengeluaran', amount: 'Rp. 10.500.000', icon: Icons.arrow_downward, color: Colors.red),
                    const SizedBox(height: 12),
                    SummaryCard(title: 'Total Saldo Kas Masjid', amount: 'Rp. 5.300.000', icon: Icons.account_balance_wallet, color: Colors.blue),
                  ],
                ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Grafik Keuangan 2026', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1B4332))),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BarChartColumn(label: 'Jan', pemasukan: 0.6, pengeluaran: 0.4),
                      BarChartColumn(label: 'Feb', pemasukan: 0.8, pengeluaran: 0.5),
                      BarChartColumn(label: 'Mar', pemasukan: 0.7, pengeluaran: 0.6),
                      BarChartColumn(label: 'Apr', pemasukan: 0.9, pengeluaran: 0.5),
                      BarChartColumn(label: 'Mei', pemasukan: 0.8, pengeluaran: 0.7),
                      BarChartColumn(label: 'Jun', pemasukan: 1.0, pengeluaran: 0.6),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LegendItem(color: Colors.green, label: 'Pemasukan'),
                    const SizedBox(width: 16),
                    LegendItem(color: Colors.red, label: 'Pengeluaran'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Transaksi Terakhir', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1B4332))),
                    TextButton(onPressed: () {}, child: const Text('Lihat Semua')),
                  ],
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 20,
                    columns: const [DataColumn(label: Text('Tanggal')), DataColumn(label: Text('Keterangan')), DataColumn(label: Text('Jenis')), DataColumn(label: Text('Nominal')), DataColumn(label: Text('Aksi'))],
                    rows: [
                      _buildDataRow('4 April 2026', 'Infaq Jumat', 'Pemasukan', 'Rp. 200.000', Colors.green),
                      _buildDataRow('3 April 2026', 'Listrik Masjid', 'Pengeluaran', 'Rp. 150.000', Colors.red),
                      _buildDataRow('2 April 2026', 'Donatur', 'Pemasukan', 'Rp. 500.000', Colors.green),
                      _buildDataRow('1 April 2026', 'Alat Kebersihan', 'Pengeluaran', 'Rp. 75.000', Colors.red),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildDataRow(String tanggal, String keterangan, String jenis, String nominal, Color color) {
    return DataRow(
      cells: [
        DataCell(Text(tanggal)),
        DataCell(Text(keterangan)),
        DataCell(Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(4)), child: Text(jenis, style: TextStyle(color: color, fontSize: 12)))),
        DataCell(Text(nominal, style: const TextStyle(fontWeight: FontWeight.w600))),
        DataCell(Row(mainAxisSize: MainAxisSize.min, children: [IconButton(icon: const Icon(Icons.edit, size: 18, color: Colors.blue), onPressed: () {}), IconButton(icon: const Icon(Icons.delete, size: 18, color: Colors.red), onPressed: () {})])),
      ],
    );
  }
}