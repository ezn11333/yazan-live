
import 'package:flutter/material.dart';

class YazanHomePage extends StatelessWidget {
  const YazanHomePage({super.key});

  static const Color purple = Color(0xFF180D2B);
  static const Color gold = Color(0xFFFFD700);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purple,
      appBar: AppBar(
        backgroundColor: purple,
        title: const Text(
          'يزن لايف 👑',
          style: TextStyle(
            color: gold,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(Icons.notifications, color: gold),
          SizedBox(width: 18),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'أهلاً بك في يزن لايف',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: gold,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF57258B), Color(0xFF24123D)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              children: [
                Icon(Icons.mic, color: gold, size: 55),
                SizedBox(height: 10),
                Text(
                  'عالمك الصوتي الجديد',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'تواصل مع أصدقائك واستمتع بالغرف الصوتية',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'الغرف الصوتية',
            style: TextStyle(
              color: gold,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          roomCard('غرفة الأصدقاء', Icons.people),
          roomCard('غرفة السهرة', Icons.nightlife),
          roomCard('غرفة التعارف', Icons.favorite),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: menuCard('المحفظة', Icons.wallet)),
              const SizedBox(width: 10),
              Expanded(child: menuCard('الهدايا', Icons.card_giftcard)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: menuCard('الأصدقاء', Icons.people_alt)),
              const SizedBox(width: 10),
              Expanded(child: menuCard('الملف الشخصي', Icons.person)),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF28183D),
        selectedItemColor: gold,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'الغرف',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'الهدايا',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'حسابي',
          ),
        ],
      ),
    );
  }

  static Widget roomCard(String name, IconData icon) {
    return Card(
      color: const Color(0xFF302044),
      child: ListTile(
        leading: Icon(icon, color: gold, size: 30),
        title: Text(name, style: const TextStyle(color: Colors.white)),
        subtitle: const Text(
          'غرفة صوتية',
          style: TextStyle(color: Colors.white54),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: gold),
      ),
    );
  }

  static Widget menuCard(String name, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF302044),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(icon, color: gold, size: 32),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
