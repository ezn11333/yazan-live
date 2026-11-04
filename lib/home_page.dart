import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7026A8),
        foregroundColor: Colors.white,
        title: const Text('يزن لايف'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await Supabase.instance.client.auth.signOut();
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('أهلاً بك في يزن لايف 💜', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF7026A8))),
          const SizedBox(height: 8),
          Text('معرّف حسابك: ${user?.id ?? ""}'),
          const SizedBox(height: 20),
          _section('الغرف الصوتية', Icons.mic, 'اكتشف الغرف قريباً'),
          _section('المحفظة', Icons.account_balance_wallet, 'رصيد الكوينز: 0'),
          _section('الهدايا', Icons.card_giftcard, 'الهدايا قريباً'),
          _section('الأصدقاء', Icons.people, 'قابل أصدقاء جدد'),
          _section('الوكلاء', Icons.store, 'خدمات الشحن قريباً'),
        ],
      ),
    );
  }

  Widget _section(String title, IconData icon, String subtitle) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF7026A8), size: 32),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
