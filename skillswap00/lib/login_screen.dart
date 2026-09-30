import 'package:flutter/material.dart';
import 'auth_widgets.dart';
import 'dashboard_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              buildIconBubble(Icons.badge_outlined),
              const SizedBox(height: 24),
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF141A28),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sign in to continue your learning\njourney.',
                style: TextStyle(fontSize: 14, color: Color(0xFF737A8C)),
              ),
              const SizedBox(height: 32),
              buildField(
                'Email Address',
                'name@example.com',
                icon: Icons.mail_outline,
              ),
              const SizedBox(height: 16),
              buildField(
                'Password',
                '••••••••',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFF7555F6),
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              buildButton('Login', () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const SkillSwapDashboard()),
                );
              }),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Color(0xFF8C8D9E), fontSize: 13),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xFF7555F6),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
