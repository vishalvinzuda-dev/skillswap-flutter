import 'package:flutter/material.dart';
import 'auth_widgets.dart';
import 'email_verified_screen.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

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
                      const SizedBox(height: 24),
                      buildIconBubble(Icons.key_rounded),
                      const SizedBox(height: 24),
                      const Text(
                        'Create New\nPassword',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF141A28),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Your new password must be\ndifferent from previous used\npasswords.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF737A8C),
                        ),
                      ),
                      const SizedBox(height: 32),
                      buildField('New Password', '••••••••', isPassword: true),
                      const SizedBox(height: 16),
                      buildField(
                        'Confirm Password',
                        '••••••••',
                        isPassword: true,
                      ),
                      const Spacer(),
                      const SizedBox(height: 24),
                      buildButton('Set Password', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const EmailVerifiedScreen(),
                          ),
                        );
                      }),
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
