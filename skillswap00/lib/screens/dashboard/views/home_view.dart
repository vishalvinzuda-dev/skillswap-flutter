import 'package:flutter/material.dart';
import '../../skills/top_categories_screen.dart';
import '../../skills/design_skills_screen.dart';
import '../../mentors/ui_designers_screen.dart';
import '../../mentors/expert_profile_screen.dart';
import '../../mentors/find_mentor_screen.dart';
import '../../sessions/session_details_screen.dart';
import '../../sessions/schedule_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 120), // space for bottom nav
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Header: "Good morning, \n Hello Pheonix!"
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Good morning,',
                    style: TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Hello Pheonix!',
                    style: TextStyle(
                      color: Color(0xFF141A28),
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.4,
                    ),
                  ),
                ],
              ),
            ),

            // Categories Section
            _buildSectionHeader(
              title: 'Categories',
              action: 'See All',
              onActionTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TopCategoriesScreen(),
                  ),
                );
              },
            ),

            // 4 Category Buttons Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryButton(
                    context: context,
                    icon: Icons.edit_rounded,
                    label: 'Design',
                    isSelected: true,
                  ),
                  _buildCategoryButton(
                    context: context,
                    icon: Icons.code_rounded,
                    label: 'Coding',
                    isSelected: false,
                  ),
                  _buildCategoryButton(
                    context: context,
                    icon: Icons.music_note_rounded,
                    label: 'Music',
                    isSelected: false,
                  ),
                  _buildCategoryButton(
                    context: context,
                    icon: Icons.restaurant_rounded,
                    label: 'Cooking',
                    isSelected: false,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Featured Skills Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Featured Skills',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF141A28),
                ),
              ),
            ),

            const SizedBox(height: 14),

            // Featured Skills Card with Vector Computer Monitor Artwork
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const UIDesignersScreen(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Vector Monitor & Pen Tool Graphic
                      const Center(
                        child: _FeaturedDesignIllustration(),
                      ),

                      const SizedBox(height: 16),

                      // Card Title
                      const Text(
                        'UI/UX Design Masterclass',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF141A28),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Instructor / User Row
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ExpertProfileScreen(
                                    name: 'Sarah Jenkins',
                                    role: 'Senior UI Designer',
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF3B82F6),
                                  ),
                                  child: const Icon(
                                    Icons.person_rounded,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Sarah Jenkins',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF64748B),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Plus Person Badge
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Color(0xFFEEF2FF),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.person_add_alt_1_rounded,
                              size: 14,
                              color: Color(0xFF7555F6),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 28),

            // Top Mentors Section
            _buildSectionHeader(
              title: 'Top Mentors',
              action: 'View All',
              onActionTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const FindMentorScreen(),
                  ),
                );
              },
            ),

            // Mentors Row with Illustrated Circular Avatars
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMentorItem(
                    context: context,
                    name: 'Jessica',
                    role: 'Creative Director',
                  ),
                  _buildMentorItem(
                    context: context,
                    name: 'David L.',
                    role: 'Senior UI/UX Designer',
                  ),
                  _buildMentorItem(
                    context: context,
                    name: 'Sophie K.',
                    role: 'Lead Visual Designer',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Upcoming Sessions Section
            _buildSectionHeader(
              title: 'Upcoming Sessions',
              action: 'My Schedule',
              onActionTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ScheduleScreen(showBackButton: true),
                  ),
                );
              },
            ),

            const SizedBox(height: 6),

            // Session Card 1: Branding Workshop (Join)
            _buildUpcomingSessionCard(
              context: context,
              month: 'SEP',
              day: '14',
              title: 'Branding\nWorkshop',
              time: '10:00 AM - 11:30 AM',
              hasJoinButton: true,
              onActionTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Row(
                      children: [
                        Icon(Icons.videocam_rounded, color: Colors.white, size: 20),
                        SizedBox(width: 10),
                        Text('Connecting to Branding Workshop session...'),
                      ],
                    ),
                    backgroundColor: const Color(0xFF141927),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            // Session Card 2: Advanced Python API (Details)
            _buildUpcomingSessionCard(
              context: context,
              month: 'SEP',
              day: '15',
              title: 'Advanced\nPython\nAPI',
              time: '02:00 PM - 03:30 PM',
              hasJoinButton: false,
              onActionTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SessionDetailsScreen(
                      title: 'Advanced Python API Workshop',
                      dateMonth: 'SEP',
                      dateDay: '15',
                      timeRange: '02:00 PM - 03:30 PM',
                      durationText: '(90 min)',
                      participantName: 'David Kim',
                      participantRole: 'Senior Python Engineer',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required String action,
    VoidCallback? onActionTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF141A28),
            ),
          ),
          GestureDetector(
            onTap: onActionTap,
            child: Text(
              action,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF7B61FF),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DesignSkillsScreen(
              categoryTitle: '$label Skills',
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 66,
            height: 66,
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFFEEF2FF)
                  : Colors.white,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: isSelected
                    ? Colors.transparent
                    : const Color(0xFFE2E8F0),
                width: 1.2,
              ),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF141A28),
              size: 26,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF475569),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMentorItem({
    required BuildContext context,
    required String name,
    required String role,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ExpertProfileScreen(
              name: name,
              role: role,
              location: 'San Francisco, CA',
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFF1F5F9),
              border: Border.all(
                color: const Color(0xFFEDE9FE),
                width: 2.5,
              ),
            ),
            child: ClipOval(
              child: CustomPaint(
                painter: _IllustratedAvatarPainter(),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF141A28),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingSessionCard({
    required BuildContext context,
    required String month,
    required String day,
    required String title,
    required String time,
    required bool hasJoinButton,
    required VoidCallback onActionTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: const Color(0xFFE2E8F0),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Left Date Badge
            Container(
              width: 50,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFF1F5F9),
                  width: 1.5,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    month,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF7555F6),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    day,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF141A28),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // Middle: Title & Time
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF141A28),
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_rounded,
                        size: 13,
                        color: Color(0xFF94A3B8),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          time,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            // Right Action Button (Join or Details)
            GestureDetector(
              onTap: onActionTap,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: hasJoinButton ? 16 : 13,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: hasJoinButton
                      ? const Color(0xFF141927)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: hasJoinButton
                      ? null
                      : Border.all(
                          color: const Color(0xFFE2E8F0),
                          width: 1.2,
                        ),
                ),
                child: Text(
                  hasJoinButton ? 'Join' : 'Details',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: hasJoinButton
                        ? Colors.white
                        : const Color(0xFF141A28),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Vector Illustration of Computer Monitor with Bezier Pen Tool Anchor Nodes
class _FeaturedDesignIllustration extends StatelessWidget {
  const _FeaturedDesignIllustration();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 210,
      height: 140,
      child: CustomPaint(
        painter: _MonitorIllustrationPainter(),
      ),
    );
  }
}

class _MonitorIllustrationPainter extends CustomPainter {
  const _MonitorIllustrationPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final blackStroke = Paint()
      ..color = const Color(0xFF141A28)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final blackFill = Paint()
      ..color = const Color(0xFF141A28)
      ..style = PaintingStyle.fill;

    final blueScreenPaint = Paint()
      ..color = const Color(0xFF38BDF8)
      ..style = PaintingStyle.fill;

    final whiteFill = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // 1. Top Bezier Handle Line and Nodes
    final topY = h * 0.14;
    final leftNodeX = w * 0.28;
    final centerNodeX = w * 0.50;
    final rightNodeX = w * 0.72;

    // Horizontal handle line
    canvas.drawLine(Offset(leftNodeX, topY), Offset(rightNodeX, topY), blackStroke);

    // Diagonal lines connecting nodes to pen tip
    final diagPath = Path()
      ..moveTo(leftNodeX, topY)
      ..lineTo(centerNodeX, h * 0.26)
      ..lineTo(rightNodeX, topY);
    canvas.drawPath(diagPath, blackStroke);

    // 3 Square Anchor Nodes
    void drawAnchorNode(double x, double y) {
      final rect = Rect.fromCenter(center: Offset(x, y), width: 10, height: 10);
      canvas.drawRect(rect, whiteFill);
      canvas.drawRect(rect, blackStroke);
    }

    drawAnchorNode(leftNodeX, topY);
    drawAnchorNode(centerNodeX, topY);
    drawAnchorNode(rightNodeX, topY);

    // 2. Monitor Screen
    final screenLeft = w * 0.16;
    final screenTop = h * 0.28;
    final screenWidth = w * 0.68;
    final screenHeight = h * 0.52;

    final monitorRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(screenLeft, screenTop, screenWidth, screenHeight),
      const Radius.circular(10),
    );

    // Draw blue interior screen
    canvas.drawRRect(monitorRRect, blueScreenPaint);
    // Draw monitor black outer frame
    canvas.drawRRect(monitorRRect, blackStroke);

    // 3. Pen Tool on Screen
    final penPath = Path()
      ..moveTo(centerNodeX - 18, screenTop + screenHeight * 0.70)
      ..lineTo(centerNodeX - 18, screenTop + screenHeight * 0.35)
      ..lineTo(centerNodeX, screenTop + screenHeight * 0.02)
      ..lineTo(centerNodeX + 18, screenTop + screenHeight * 0.35)
      ..lineTo(centerNodeX + 18, screenTop + screenHeight * 0.70)
      ..close();
    canvas.drawPath(penPath, blackFill);

    // White pen slit accent
    final whiteAccent = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    canvas.drawLine(
      Offset(centerNodeX, screenTop + screenHeight * 0.14),
      Offset(centerNodeX, screenTop + screenHeight * 0.44),
      whiteAccent,
    );
    canvas.drawCircle(Offset(centerNodeX, screenTop + screenHeight * 0.34), 2.5, whiteFill);

    // Pen lower stem
    final handleRect = Rect.fromLTWH(
      centerNodeX - 7,
      screenTop + screenHeight * 0.68,
      14,
      screenHeight * 0.32,
    );
    canvas.drawRect(handleRect, blackFill);

    // 4. Monitor Stand & Base
    final standNeck = Rect.fromLTWH(
      centerNodeX - 8,
      screenTop + screenHeight,
      16,
      h * 0.08,
    );
    canvas.drawRect(standNeck, blackFill);

    final standBaseRRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(centerNodeX, screenTop + screenHeight + h * 0.08 + 3),
        width: 68,
        height: 8,
      ),
      const Radius.circular(4),
    );
    canvas.drawRRect(standBaseRRect, blackFill);

    // Chin vent line
    canvas.drawLine(
      Offset(screenLeft + 10, screenTop + screenHeight - 6),
      Offset(screenLeft + 26, screenTop + screenHeight - 6),
      Paint()
        ..color = Colors.white
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom vector illustrated avatar matching the design screenshot
class _IllustratedAvatarPainter extends CustomPainter {
  const _IllustratedAvatarPainter();

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

    // Sleeves / Orange Accents
    const accentColor = Color(0xFFFDBA74);
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
