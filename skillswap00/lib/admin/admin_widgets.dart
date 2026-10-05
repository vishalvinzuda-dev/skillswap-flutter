import 'package:flutter/material.dart';

/// The official SkillSwap emblem painter matching the logo shown in the app & admin dashboard
class SkillSwapEmblemPainter extends CustomPainter {
  final Color color;

  const SkillSwapEmblemPainter({this.color = const Color(0xFF0F172A)});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.05
      ..strokeCap = StrokeCap.round;

    // Head circle
    canvas.drawCircle(
      Offset(center.dx, center.dy - size.height * 0.1),
      size.width * 0.12,
      paint,
    );

    // Body arc
    final bodyRect = Rect.fromCenter(
      center: Offset(center.dx, center.dy + size.height * 0.16),
      width: size.width * 0.38,
      height: size.height * 0.30,
    );
    canvas.drawArc(bodyRect, 3.14, 3.14, true, paint);

    // Top nodes/rays
    canvas.drawLine(
      Offset(center.dx, center.dy - size.height * 0.35),
      Offset(center.dx, center.dy - size.height * 0.27),
      strokePaint,
    );
    canvas.drawLine(
      Offset(center.dx - size.width * 0.25, center.dy - size.height * 0.25),
      Offset(center.dx - size.width * 0.16, center.dy - size.height * 0.18),
      strokePaint,
    );
    canvas.drawLine(
      Offset(center.dx + size.width * 0.25, center.dy - size.height * 0.25),
      Offset(center.dx + size.width * 0.16, center.dy - size.height * 0.18),
      strokePaint,
    );

    // Gear perimeter arcs
    strokePaint.strokeWidth = size.width * 0.065;
    final gearRect = Rect.fromCircle(center: center, radius: size.width * 0.36);
    canvas.drawArc(gearRect, 0.4, 0.9, false, strokePaint);
    canvas.drawArc(gearRect, 1.9, 0.9, false, strokePaint);
    canvas.drawArc(gearRect, 3.5, 0.9, false, strokePaint);
    canvas.drawArc(gearRect, 5.0, 0.9, false, strokePaint);
  }

  @override
  bool shouldRepaint(covariant SkillSwapEmblemPainter oldDelegate) =>
      oldDelegate.color != color;
}

/// Logo component with emblem and "SKILLSWAP" brand typography
class SkillSwapLogo extends StatelessWidget {
  final double size;
  final Color color;

  const SkillSwapLogo({
    super.key,
    this.size = 22,
    this.color = const Color(0xFF0F172A),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomPaint(
          size: Size(size, size),
          painter: SkillSwapEmblemPainter(color: color),
        ),
        const SizedBox(width: 8),
        Text(
          'SKILLSWAP',
          style: TextStyle(
            color: color,
            fontSize: 13,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.6,
          ),
        ),
      ],
    );
  }
}

/// Admin Avatar with dual-tone orange/blue background and silhouette
class AdminAvatar extends StatelessWidget {
  final double size;
  final VoidCallback? onTap;

  const AdminAvatar({
    super.key,
    this.size = 38,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFB923C), // Warm Orange
              Color(0xFF3B82F6), // Royal Blue
            ],
            stops: [0.48, 0.52],
          ),
          border: Border.all(color: Colors.white, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Center(
          child: Icon(
            Icons.person_rounded,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
    );
  }
}

/// Common Admin Top Bar with logo and avatar
class AdminTopBar extends StatelessWidget {
  final VoidCallback? onAvatarTap;

  const AdminTopBar({
    super.key,
    this.onAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SkillSwapLogo(),
          AdminAvatar(onTap: onAvatarTap),
        ],
      ),
    );
  }
}

/// Metric Card for 2x2 Admin Grid
class StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Widget? topTrailing;
  final VoidCallback? onTap;

  const StatCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.topTrailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFFF1F5F9),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF64748B).withValues(alpha: 0.04),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: const Color(0xFFE2E8F0),
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    icon,
                    size: 20,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                ?topTrailing,
              ],
            ),
            const SizedBox(height: 18),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF64748B),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                color: Color(0xFF0F172A),
                fontSize: 26,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Pill indicator used on stat cards
class StatPillBadge extends StatelessWidget {
  final Color backgroundColor;
  final String? text;
  final Color? textColor;

  const StatPillBadge({
    super.key,
    required this.backgroundColor,
    this.text,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    if (text != null) {
      return Text(
        text!,
        style: TextStyle(
          color: textColor ?? const Color(0xFF64748B),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      );
    }
    return Container(
      width: 32,
      height: 14,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}

/// Activity Tile for Recent Activity Card
class ActivityTile extends StatelessWidget {
  final IconData icon;
  final Color iconBackgroundColor;
  final String title;
  final String subtitle;
  final String timeAgo;
  final VoidCallback? onTap;

  const ActivityTile({
    super.key,
    required this.icon,
    required this.iconBackgroundColor,
    required this.title,
    required this.subtitle,
    required this.timeAgo,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 20,
                  color: const Color(0xFF0F172A),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF64748B),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              timeAgo,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF94A3B8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
