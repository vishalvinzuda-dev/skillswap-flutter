import 'package:flutter/material.dart';

/// Centralized Illustrated Avatar Painter used across Home, Mentors, and Sessions
class IllustratedAvatarPainter extends CustomPainter {
  final Color accentColor;

  const IllustratedAvatarPainter({
    this.accentColor = const Color(0xFFFDBA74),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Torso / White Polo Shirt
    final shirtPaint = Paint()..color = Colors.white;
    final shirtOutline = Paint()
      ..color = const Color(0xFFE2E8F0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final torsoPath = Path()
      ..moveTo(w * 0.12, h)
      ..lineTo(w * 0.12, h * 0.76)
      ..quadraticBezierTo(w * 0.16, h * 0.64, w * 0.34, h * 0.62)
      ..lineTo(w * 0.66, h * 0.62)
      ..quadraticBezierTo(w * 0.84, h * 0.64, w * 0.88, h * 0.76)
      ..lineTo(w * 0.88, h)
      ..close();

    canvas.drawPath(torsoPath, shirtPaint);
    canvas.drawPath(torsoPath, shirtOutline);

    // Sleeves / Accent Colors
    final accentPaint = Paint()..color = accentColor;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.08, h * 0.74, w * 0.14, h * 0.20),
        const Radius.circular(4),
      ),
      accentPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.78, h * 0.74, w * 0.14, h * 0.20),
        const Radius.circular(4),
      ),
      accentPaint,
    );

    // Polo Collar Line
    final collarPaint = Paint()
      ..color = const Color(0xFFCBD5E1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    final collarPath = Path()
      ..moveTo(w * 0.42, h * 0.62)
      ..lineTo(w * 0.50, h * 0.72)
      ..lineTo(w * 0.58, h * 0.62);
    canvas.drawPath(collarPath, collarPaint);

    // Neck
    final skinPaint = Paint()..color = const Color(0xFFFED7AA);
    canvas.drawRect(
      Rect.fromLTWH(w * 0.43, h * 0.50, w * 0.14, h * 0.14),
      skinPaint,
    );

    // Ears
    canvas.drawCircle(Offset(w * 0.29, h * 0.38), w * 0.05, skinPaint);
    canvas.drawCircle(Offset(w * 0.71, h * 0.38), w * 0.05, skinPaint);

    // Face / Head
    final faceRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.31, h * 0.22, w * 0.38, h * 0.34),
      const Radius.circular(10),
    );
    canvas.drawRRect(faceRect, skinPaint);

    // Hair (warm rich brown)
    const hairColor = Color(0xFF92400E);
    final hairPaint = Paint()..color = hairColor;
    final hairPath = Path()
      ..moveTo(w * 0.27, h * 0.34)
      ..quadraticBezierTo(w * 0.27, h * 0.12, w * 0.50, h * 0.12)
      ..quadraticBezierTo(w * 0.73, h * 0.12, w * 0.73, h * 0.34)
      ..lineTo(w * 0.68, h * 0.25)
      ..quadraticBezierTo(w * 0.50, h * 0.19, w * 0.32, h * 0.25)
      ..close();
    canvas.drawPath(hairPath, hairPaint);

    // Beard
    final beardPath = Path()
      ..moveTo(w * 0.31, h * 0.38)
      ..lineTo(w * 0.31, h * 0.46)
      ..quadraticBezierTo(w * 0.33, h * 0.56, w * 0.50, h * 0.56)
      ..quadraticBezierTo(w * 0.67, h * 0.56, w * 0.69, h * 0.46)
      ..lineTo(w * 0.69, h * 0.38)
      ..quadraticBezierTo(w * 0.63, h * 0.44, w * 0.50, h * 0.44)
      ..quadraticBezierTo(w * 0.37, h * 0.44, w * 0.31, h * 0.38)
      ..close();
    canvas.drawPath(beardPath, hairPaint);
  }

  @override
  bool shouldRepaint(covariant IllustratedAvatarPainter oldDelegate) =>
      oldDelegate.accentColor != accentColor;
}

/// Standalone Illustrated Avatar Widget with RepaintBoundary for high performance
class IllustratedAvatar extends StatelessWidget {
  final double size;
  final Color accentColor;
  final double borderRadius;
  final Color backgroundColor;

  const IllustratedAvatar({
    super.key,
    this.size = 54,
    this.accentColor = const Color(0xFFFDBA74),
    this.borderRadius = 16,
    this.backgroundColor = const Color(0xFFF1F5F9),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: RepaintBoundary(
          child: CustomPaint(
            size: Size(size, size),
            painter: IllustratedAvatarPainter(accentColor: accentColor),
          ),
        ),
      ),
    );
  }
}
