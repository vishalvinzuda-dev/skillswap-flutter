import 'package:flutter/material.dart';
import '../mentors/expert_profile_screen.dart';
import 'schedule_screen.dart';

class SessionDetailsScreen extends StatelessWidget {
  final String title;
  final String status;
  final String dateMonth;
  final String dateDay;
  final String dateYearText;
  final String timeRange;
  final String durationText;
  final String participantName;
  final String participantRole;

  const SessionDetailsScreen({
    super.key,
    this.title = 'UI Design Mentorship &\nPortfolio Review',
    this.status = 'Confirmed',
    this.dateMonth = 'OCT',
    this.dateDay = '24',
    this.dateYearText = 'Thursday, 2024',
    this.timeRange = '14:00 - 15:30',
    this.durationText = '(90 min)',
    this.participantName = 'Marcus Sterling',
    this.participantRole = 'Expert UI/UX Designer',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFFE2E8F0),
                          width: 1.2,
                        ),
                      ),
                      child: const Icon(
                        Icons.chevron_left_rounded,
                        color: Color(0xFF141A28),
                        size: 24,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Session Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF141A28),
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),

                    // Status Badge (Confirmed)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFECFDF5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Color(0xFF10B981),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            status,
                            style: const TextStyle(
                              color: Color(0xFF10B981),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Session Title (Left-aligned)
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF141A28),
                        height: 1.35,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Hero Date & Time Gradient Card
                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6D28D9), Color(0xFF7C3AED)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(
                              0xFF7C3AED,
                            ).withValues(alpha: 0.35),
                            blurRadius: 18,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Left Date Box
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.18),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  dateMonth,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                Text(
                                  dateDay,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    height: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 16),

                          // Middle: Thursday, 2024 / Time
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dateYearText,
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.9),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      timeRange,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  durationText,
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.85),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Right: Clock Icon circle
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.access_time_filled_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Participant Section Header
                    const Text(
                      'PARTICIPANT',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,
                        color: Color(0xFF94A3B8),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Participant Card
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ExpertProfileScreen(
                              name: participantName,
                              role: participantRole,
                              location: 'London, UK',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFE2E8F0),
                            width: 1.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.02),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Illustrated Avatar with Online Status Dot
                            Stack(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF8FAFC),
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: const Color(0xFFE2E8F0),
                                      width: 1,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: CustomPaint(
                                      painter: _ParticipantAvatarPainter(),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    width: 11,
                                    height: 11,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF10B981),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(width: 16),

                            // Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    participantName,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF141A28),
                                      height: 1.2,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    participantRole,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF64748B),
                                      height: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Chevron circle button
                            Container(
                              width: 36,
                              height: 36,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFF8FAFC),
                              ),
                              child: const Icon(
                                Icons.chevron_right_rounded,
                                color: Color(0xFF94A3B8),
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Meeting button
                    _buildActionButton(
                      context,
                      icon: Icons.calendar_month_rounded,
                      iconColor: const Color(0xFF7555F6),
                      borderColor: const Color(0xFF7555F6),
                      label: 'Meeting',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Row(
                              children: [
                                Icon(
                                  Icons.video_call_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(width: 10),
                                Text('Opening video meeting room...'),
                              ],
                            ),
                            backgroundColor: const Color(0xFF7555F6),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 14),

                    // Reschedule button
                    _buildActionButton(
                      context,
                      icon: Icons.history_rounded,
                      iconColor: const Color(0xFF64748B),
                      borderColor: const Color(0xFFE2E8F0),
                      label: 'Reschedule',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RescheduleScreen(
                              participantName: participantName,
                              participantRole: participantRole,
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    // Cancel Session text button
                    Center(
                      child: GestureDetector(
                        onTap: () => _showCancelDialog(context),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            'Cancel Session',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFEF4444),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required Color borderColor,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 20),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF141A28),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Cancel Session?',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        content: const Text(
          'Are you sure you want to cancel this scheduled session? Your mentor will be notified immediately.',
          style: TextStyle(color: Color(0xFF64748B)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx),
            child: const Text('Keep Session'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF4444),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pop(dialogCtx);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Session cancelled.'),
                  backgroundColor: Color(0xFFEF4444),
                ),
              );
            },
            child: const Text('Yes, Cancel'),
          ),
        ],
      ),
    );
  }
}

class _ParticipantAvatarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Torso / White Polo
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

    // Orange sleeves
    final orangePaint = Paint()..color = const Color(0xFFFDBA74);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.08, h * 0.74, w * 0.14, h * 0.20),
        const Radius.circular(3),
      ),
      orangePaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.78, h * 0.74, w * 0.14, h * 0.20),
        const Radius.circular(3),
      ),
      orangePaint,
    );

    // Neck
    final skinPaint = Paint()..color = const Color(0xFFFED7AA);
    canvas.drawRect(
      Rect.fromLTWH(w * 0.43, h * 0.50, w * 0.14, h * 0.14),
      skinPaint,
    );

    // Head
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.31, h * 0.22, w * 0.38, h * 0.34),
        const Radius.circular(8),
      ),
      skinPaint,
    );

    // Hair
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
