import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'dashboard_kas_screen.dart';
import 'catat_pemasukan_screen.dart';
import 'catat_pengeluaran_screen.dart';
import 'laporan_keuangan_screen.dart';
import '../widgets/sidebar_item.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _menuItems = [
    {'icon': Icons.dashboard, 'label': 'Dashboard'},
    {'icon': Icons.arrow_circle_up, 'label': 'Catat Pemasukan'},
    {'icon': Icons.arrow_circle_down, 'label': 'Catat Pengeluaran'},
    {'icon': Icons.bar_chart, 'label': 'Laporan Keuangan'},
  ];

  final List<Widget> _screens = [
    const DashboardKasScreen(),
    const CatatPemasukanScreen(),
    const CatatPengeluaranScreen(),
    const LaporanKeuanganScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;

    return Scaffold(
      appBar: isWideScreen
          ? null
          : AppBar(
              backgroundColor: const Color(0xFF1B4332),
              title: const Text('M. Kas', style: TextStyle(color: Colors.white)),
              iconTheme: const IconThemeData(color: Colors.white),
            ),
      drawer: isWideScreen
          ? null
          : Drawer(
              child: Container(
                color: const Color(0xFF1B4332),
                child: Column(
                  children: [
                    _buildHeader(),
                    const Divider(color: Colors.white24),
                    ...List.generate(_menuItems.length, (index) {
                      return SidebarItem(
                        icon: _menuItems[index]['icon'],
                        label: _menuItems[index]['label'],
                        isActive: _selectedIndex == index,
                        onTap: () {
                          setState(() => _selectedIndex = index);
                          Navigator.pop(context);
                        },
                      );
                    }),
                    const Spacer(),
                    SidebarItem(
                      icon: Icons.logout,
                      label: 'Logout',
                      isActive: false,
                      onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
      body: Row(
        children: [
          if (isWideScreen)
            Container(
              width: 250,
              color: const Color(0xFF1B4332),
              child: Column(
                children: [
                  _buildHeader(),
                  const Divider(color: Colors.white24),
                  ...List.generate(_menuItems.length, (index) {
                    return SidebarItem(
                      icon: _menuItems[index]['icon'],
                      label: _menuItems[index]['label'],
                      isActive: _selectedIndex == index,
                      onTap: () => setState(() => _selectedIndex = index),
                    );
                  }),
                  const Spacer(),
                  SidebarItem(
                    icon: Icons.logout,
                    label: 'Logout',
                    isActive: false,
                    onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          Expanded(child: _screens[_selectedIndex]),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          const CircleAvatar(radius: 20, backgroundColor: Colors.white, child: Icon(Icons.person, color: Color(0xFF1B4332))),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Halo, Tata Sri Noviyanti', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                Text('Administrator', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}