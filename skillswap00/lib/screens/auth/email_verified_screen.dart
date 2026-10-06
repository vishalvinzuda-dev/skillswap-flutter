import 'package:flutter/material.dart';
import 'auth_widgets.dart';
import '../dashboard/dashboard_screen.dart';

class EmailVerifiedScreen extends StatelessWidget {
  const EmailVerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: const Color(0xFF7555F6).withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Color(0xFF7555F6),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Email Verified!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF141A28),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Your email has been successfully verified.\nWelcome to SkillSwap! Start discovering,\nsharing, and expanding your skills.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF737A8C),
                  height: 1.5,
                ),
              ),
              const Spacer(flex: 2),
              buildButton('Go to Home', () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const SkillSwapDashboard()),
                  (route) => false,
                );
              }),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
