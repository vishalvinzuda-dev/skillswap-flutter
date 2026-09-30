import 'package:flutter/material.dart';
import 'auth_widgets.dart';
import 'verify_email_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
              const SizedBox(height: 12),
              buildBackButton(context),
              const SizedBox(height: 24),
              buildIconBubble(Icons.key_rounded),
              const SizedBox(height: 24),
              const Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF141A28),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Don\'t worry! Enter your email below\nand we\'ll send you a recovery link.',
                style: TextStyle(fontSize: 14, color: Color(0xFF737A8C)),
              ),
              const SizedBox(height: 32),
              buildField(
                'Email Address',
                'name@example.com',
                icon: Icons.mail_outline,
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF7555F6).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      color: Color(0xFF7555F6),
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Check your spam folder if you don\'t\nsee it.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF7555F6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              buildButton('Verify my Mail', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const VerifyEmailScreen()),
                );
              }),
              const SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    'Back to Login',
                    style: TextStyle(
                      color: Color(0xFF8C8D9E),
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
