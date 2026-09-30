import 'package:flutter/material.dart';
import 'auth_widgets.dart';
import 'create_new_password_screen.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

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
                'Verify Email',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF141A28),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'We\'ve sent a 6-digit code to\nyour email address. Please\nenter it below to continue.',
                style: TextStyle(fontSize: 14, color: Color(0xFF737A8C)),
              ),
              const SizedBox(height: 32),
              const Text(
                'Verification Code',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF141A28),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return Container(
                    width: 45,
                    height: 52,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: index == 2
                            ? const Color(0xFF7555F6)
                            : const Color(0xFFE2E4EB),
                        width: index == 2 ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      index == 0
                          ? '4'
                          : (index == 1 ? '8' : (index == 2 ? '|' : '')),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: index == 2
                            ? FontWeight.w300
                            : FontWeight.bold,
                        color: index == 2
                            ? const Color(0xFF7555F6)
                            : const Color(0xFF141A28),
                      ),
                    ),
                  );
                }),
              ),
              const Spacer(),
              buildButton('Verify', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CreateNewPasswordScreen(),
                  ),
                );
              }),
              const SizedBox(height: 16),
              Column(
                children: [
                  const Center(
                    child: Text(
                      "Didn't receive the code?",
                      style: TextStyle(color: Color(0xFF8C8D9E), fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Resend",
                        style: TextStyle(
                          color: Color(0xFF7555F6),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
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
