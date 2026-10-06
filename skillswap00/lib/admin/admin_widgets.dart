import 'dart:math' as math;
import 'package:flutter/material.dart';

/// The official SkillSwap emblem painter matching the logo shown in the app & admin dashboard
class SkillSwapEmblemPainter extends CustomPainter {
  final Color color;

  const SkillSwapEmblemPainter({this.color = const Color(0xFF0F172A)});

  static Path _buildPath(List<double> pts) {
    final path = Path();
    if (pts.length < 2) return path;
    path.moveTo(pts[0], pts[1]);
    for (int i = 2; i < pts.length; i += 2) {
      path.lineTo(pts[i], pts[i + 1]);
    }
    path.close();
    return path;
  }

  static const List<double> _gearPts = [
    54.5, 85.5, 42.1, 98.2, 42.1, 104.4, 47.9, 109.8, 47.9, 116.0,
    45.0, 118.5, 45.0, 127.6, 40.7, 131.9, 37.4, 131.9, 33.4, 135.9,
    33.4, 147.9, 36.3, 150.4, 36.3, 153.7, 37.4, 154.8, 49.4, 154.8,
    62.4, 167.9, 62.4, 182.7, 63.5, 183.8, 66.8, 183.8, 69.3, 186.7,
    75.5, 186.7, 78.0, 189.6, 80.2, 190.0, 89.7, 180.9, 110.3, 180.9,
    118.7, 189.6, 120.9, 190.0, 124.5, 186.7, 130.7, 186.7, 133.2, 183.8,
    136.5, 183.8, 140.5, 180.2, 140.5, 179.1, 137.6, 176.9, 137.6, 167.9,
    139.0, 166.4, 142.3, 166.4, 143.4, 165.3, 143.4, 162.1, 150.6, 154.8,
    162.6, 154.8, 163.7, 153.7, 163.7, 150.4, 166.6, 147.9, 166.6, 138.8,
    169.5, 136.7, 169.5, 135.6, 168.0, 134.5, 165.1, 134.8, 162.6, 131.9,
    159.3, 131.9, 155.0, 127.6, 155.0, 115.6, 152.1, 113.1, 151.7, 110.9,
    157.9, 104.4, 157.9, 98.2, 145.5, 85.5, 144.5, 85.5, 142.3, 88.4,
    136.1, 88.4, 133.9, 91.3, 132.8, 91.3, 127.8, 85.5, 121.6, 85.5,
    119.1, 82.6, 115.8, 82.6, 114.3, 81.1, 114.3, 77.9, 111.4, 75.3,
    111.4, 72.1, 110.3, 71.0, 89.7, 71.0, 88.6, 72.1, 88.6, 75.3,
    85.7, 77.9, 85.7, 81.1, 84.2, 82.6, 80.9, 82.6, 78.4, 85.5,
    75.1, 85.5, 72.6, 88.4, 69.3, 88.4, 67.2, 91.3, 66.1, 91.3,
    63.9, 88.4, 57.7, 88.4, 55.5, 85.5,
  ];

  static const List<double> _holePts = [
    99.5, 93.5, 101.6, 93.8, 104.2, 96.7, 113.2, 96.7, 115.8, 99.6,
    119.1, 99.6, 121.6, 102.5, 124.9, 102.5, 135.0, 112.7, 135.0, 116.0,
    137.9, 118.5, 137.9, 121.8, 140.8, 124.3, 140.8, 136.3, 137.9, 138.8,
    137.9, 145.0, 135.0, 147.5, 135.0, 150.8, 124.9, 161.0, 121.6, 161.0,
    119.1, 163.9, 112.9, 163.9, 110.3, 166.8, 89.7, 166.8, 87.1, 163.9,
    80.9, 163.9, 75.5, 158.1, 72.2, 158.1, 67.9, 153.7, 67.9, 150.4,
    62.1, 145.0, 62.1, 135.9, 59.2, 133.4, 59.2, 127.2, 62.1, 124.7,
    62.1, 118.5, 65.0, 116.0, 65.0, 112.7, 75.1, 102.5, 78.4, 102.5,
    80.9, 99.6, 84.2, 99.6, 86.8, 96.7, 95.8, 96.7,
  ];

  static const List<double> _torsoPts = [
    74.1, 141.7, 74.1, 150.8, 75.1, 151.9, 78.4, 151.9, 80.9, 154.8,
    84.2, 154.8, 86.8, 157.7, 113.2, 157.7, 115.8, 154.8, 119.1, 154.8,
    121.6, 151.9, 124.9, 151.9, 128.9, 148.3, 128.9, 147.2, 125.9, 145.0,
    125.9, 141.7, 118.0, 134.5, 115.8, 134.8, 110.3, 140.6, 89.7, 140.6,
    84.2, 134.8, 82.0, 134.5,
  ];

  static const List<double> _headPts = [
    95.5, 102.9, 85.7, 112.7, 85.7, 124.7, 92.6, 131.6, 107.4, 131.6,
    114.3, 124.7, 114.3, 121.4, 117.2, 119.2, 117.2, 118.1, 114.3, 116.0,
    114.3, 112.7, 111.4, 110.2, 111.4, 106.9, 110.3, 105.8, 107.1, 105.8,
    104.5, 102.9,
  ];

  static const List<double> _socketPts = [
    91.5, 60.4, 91.5, 63.7, 92.6, 64.8, 107.4, 64.8, 108.5, 63.7,
    108.5, 60.4, 107.1, 59.4, 92.9, 59.4,
  ];

  static const List<double> _rightArrowPts = [
    160.4, 41.6, 140.8, 60.4, 140.8, 63.7, 135.0, 69.2, 134.7, 72.1,
    135.7, 73.5, 136.8, 73.5, 139.0, 70.6, 142.3, 70.6, 146.6, 75.0,
    146.6, 78.2, 147.7, 79.3, 151.0, 79.3, 167.0, 95.3, 167.0, 104.4,
    161.1, 109.8, 160.8, 112.0, 164.1, 115.6, 164.1, 124.7, 165.1, 125.8,
    168.4, 125.8, 170.9, 128.7, 174.2, 128.7, 175.7, 130.5, 175.3, 135.9,
    176.4, 137.4, 177.5, 137.4, 178.6, 135.9, 178.2, 75.0, 182.6, 70.6,
    188.4, 71.0, 189.8, 69.9, 189.8, 68.8, 162.6, 41.9,
  ];

  static const List<double> _leftArrowPts = [
    39.6, 41.6, 37.4, 41.9, 16.0, 63.3, 16.0, 66.6, 10.2, 71.7,
    10.2, 72.8, 11.6, 73.9, 20.3, 73.5, 21.8, 75.0, 21.4, 138.8,
    22.5, 140.3, 23.6, 140.3, 24.7, 138.8, 24.7, 132.7, 31.6, 125.8,
    34.9, 125.8, 35.9, 124.7, 35.9, 118.5, 39.2, 114.9, 38.9, 112.7,
    35.9, 110.2, 35.9, 106.9, 33.0, 104.4, 33.0, 98.2, 35.9, 95.6,
    35.9, 92.4, 49.0, 79.3, 52.3, 79.3, 53.4, 78.2, 53.4, 75.0,
    54.8, 73.5, 63.9, 73.5, 65.3, 71.0, 65.0, 69.2, 53.4, 57.9,
    53.4, 54.6,
  ];

  static const List<double> _bulbPts = [
    86.8, 12.9, 77.0, 22.7, 77.0, 37.6, 88.6, 48.8, 88.9, 55.7,
    95.5, 56.1, 96.9, 55.0, 96.9, 43.0, 91.1, 37.6, 91.1, 34.3,
    87.8, 31.0, 88.2, 28.1, 90.4, 27.1, 98.4, 35.8, 100.5, 36.1,
    105.6, 31.8, 105.6, 28.5, 107.1, 27.1, 110.3, 27.1, 112.2, 29.6,
    111.8, 31.8, 106.0, 37.2, 106.0, 40.5, 103.1, 43.0, 103.1, 55.0,
    104.5, 56.1, 107.1, 56.1, 111.4, 52.1, 111.4, 48.8, 120.1, 40.5,
    120.1, 37.2, 123.0, 34.7, 123.0, 25.6, 120.1, 23.1, 120.1, 19.8,
    116.1, 15.8, 112.9, 15.8, 110.3, 12.9, 107.1, 12.9, 104.5, 10.0,
    95.5, 10.0, 92.9, 12.9,
  ];

  static final Path _gearPath = _buildPath(_gearPts);
  static final Path _holePath = _buildPath(_holePts);
  static final Path _torsoPath = _buildPath(_torsoPts);
  static final Path _headPath = _buildPath(_headPts);
  static final Path _socketPath = _buildPath(_socketPts);
  static final Path _rightArrowPath = _buildPath(_rightArrowPts);
  static final Path _leftArrowPath = _buildPath(_leftArrowPts);
  static final Path _bulbPath = _buildPath(_bulbPts);

  @override
  void paint(Canvas canvas, Size size) {
    final s = math.min(size.width, size.height);
    final scale = s / 200.0;

    canvas.save();
    canvas.translate(
      (size.width - 200.0 * scale) / 2,
      (size.height - 200.0 * scale) / 2,
    );
    canvas.scale(scale);

    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final whiteFillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // 1. Solid Gear Body
    canvas.drawPath(_gearPath, fillPaint);

    // 2. Inner White Circular Cavity
    canvas.drawPath(_holePath, whiteFillPaint);

    // 3. Person Silhouette Inside Cavity
    canvas.drawPath(_torsoPath, fillPaint);
    canvas.drawPath(_headPath, fillPaint);

    // 4. Socket Bar
    canvas.drawPath(_socketPath, fillPaint);

    // 5. Left & Right Upward Arrows
    canvas.drawPath(_leftArrowPath, fillPaint);
    canvas.drawPath(_rightArrowPath, fillPaint);

    // 6. Lightbulb with Wishbone Filament Cutout
    canvas.drawPath(_bulbPath, fillPaint);

    canvas.restore();
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
