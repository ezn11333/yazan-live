import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth_gate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://temwtguzgrnrluhciedt.supabase.co',
    publishableKey:
        'sb_publishable_WqOLFa7r4JJkj3KJPvLnWw_54ChS0Wu',
  );

  runApp(const YazanLiveApp());
}

class YazanLiveApp extends StatelessWidget {
  const YazanLiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yazan Live',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7026A8),
          primary: const Color(0xFF7026A8),
          secondary: const Color(0xFFFFD700),
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F4FC),
        useMaterial3: true,
      ),
      home: const AuthGate(),
    );
  }
}
