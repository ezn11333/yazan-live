import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        final session = Supabase.instance.client.auth.currentSession;
        if (session != null) return const HomePage();
        return const LoginPage();
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool isLogin = true;
  bool loading = false;

  Future<void> submit() async {
    setState(() => loading = true);
    try {
      final auth = Supabase.instance.client.auth;
      if (isLogin) {
        await auth.signInWithPassword(email: email.text.trim(), password: password.text);
      } else {
        await auth.signUp(email: email.text.trim(), password: password.text);
      }
    } on AuthException catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('حدث خطأ، حاول مرة أخرى')));
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(children: [
            const Icon(Icons.graphic_eq, size: 75, color: Color(0xFF7026A8)),
            const SizedBox(height: 12),
            const Text('يزن لايف', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF7026A8))),
            const Text('عالمك الصوتي يجمعنا'),
            const SizedBox(height: 30),
            TextField(controller: email, keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(labelText: 'البريد الإلكتروني', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            TextField(controller: password, obscureText: true, decoration: const InputDecoration(labelText: 'كلمة المرور', border: OutlineInputBorder())),
            const SizedBox(height: 20),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: loading ? null : submit, child: Text(loading ? 'انتظر...' : isLogin ? 'تسجيل الدخول' : 'إنشاء حساب'))),
            TextButton(onPressed: () => setState(() => isLogin = !isLogin), child: Text(isLogin ? 'ليس لديك حساب؟ أنشئ حسابًا' : 'لديك حساب؟ سجل الدخول')),
          ]),
        ),
      ),
    );
  }
}
