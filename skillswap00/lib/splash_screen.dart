import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const OnboardingScreen()),
          );
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Color(0xFF7655F5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              Container(
                width: 82,
                height: 82,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Center(
                  child: CustomPaint(
                    size: const Size(48, 48),
                    painter: SkillSwapEmblemPainter(),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'SkillSwap',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Learn Together. Teach Together.',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.1,
                ),
              ),
              const Spacer(flex: 3),
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Tap to explore',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(width: 6),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SkillSwapEmblemPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1E1E2D)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    final strokePaint = Paint()
      ..color = const Color(0xFF1E1E2D)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.4
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(Offset(center.dx, center.dy - 5), 5.5, paint);

    final bodyRect = Rect.fromCenter(
      center: Offset(center.dx, center.dy + 8),
      width: 18,
      height: 14,
    );
    canvas.drawArc(bodyRect, 3.14, 3.14, true, paint);

    canvas.drawLine(
      Offset(center.dx, center.dy - 17),
      Offset(center.dx, center.dy - 13),
      strokePaint,
    );
    canvas.drawLine(
      Offset(center.dx - 12, center.dy - 12),
      Offset(center.dx - 8, center.dy - 9),
      strokePaint,
    );
    canvas.drawLine(
      Offset(center.dx + 12, center.dy - 12),
      Offset(center.dx + 8, center.dy - 9),
      strokePaint,
    );

    strokePaint.strokeWidth = 3;
    final gearRect = Rect.fromCircle(center: center, radius: 17);
    canvas.drawArc(gearRect, 0.4, 0.9, false, strokePaint);
    canvas.drawArc(gearRect, 1.9, 0.9, false, strokePaint);
    canvas.drawArc(gearRect, 3.5, 0.9, false, strokePaint);
    canvas.drawArc(gearRect, 5.0, 0.9, false, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
