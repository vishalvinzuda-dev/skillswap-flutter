import 'package:flutter/material.dart';
import 'auth_widgets.dart';
import '../dashboard/dashboard_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      buildBackButton(context),
                      const SizedBox(height: 20),
                      buildIconBubble(Icons.person_add_outlined),
                      const SizedBox(height: 20),
                      const Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF141A28),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Sign up to start your learning\nand teaching journey.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF737A8C),
                        ),
                      ),
                      const SizedBox(height: 28),
                      buildField(
                        'Full Name',
                        'Alex Johnson',
                        icon: Icons.person_outline,
                      ),
                      const SizedBox(height: 16),
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
                      const SizedBox(height: 16),
                      buildField(
                        'Confirm Password',
                        '••••••••',
                        icon: Icons.lock_outline,
                        isPassword: true,
                      ),
                      const Spacer(),
                      const SizedBox(height: 24),
                      buildButton('Sign Up', () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const SkillSwapDashboard(),
                          ),
                        );
                      }),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(
                              color: Color(0xFF8C8D9E),
                              fontSize: 13,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                color: Color(0xFF7555F6),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
