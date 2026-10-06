import 'package:flutter/material.dart';
import 'expert_profile_screen.dart';

class MentorModel {
  final String id;
  final String name;
  final String role;
  final String category;
  final List<String> tags;
  final Color avatarShirtColor;

  const MentorModel({
    required this.id,
    required this.name,
    required this.role,
    required this.category,
    required this.tags,
    this.avatarShirtColor = const Color(0xFFFDBA74),
  });
}

class FindMentorScreen extends StatefulWidget {
  const FindMentorScreen({super.key});

  @override
  State<FindMentorScreen> createState() => _FindMentorScreenState();
}

class _FindMentorScreenState extends State<FindMentorScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'Design';
  String _searchQuery = '';

  final List<String> _categories = const ['Design', 'Coding', 'Marketing'];

  final List<MentorModel> _allMentors = const [
    MentorModel(
      id: 'm_1',
      name: 'Alex Rivera',
      role: 'Senior Product Designer',
      category: 'Design',
      tags: ['UI/UX Design', 'Figma'],
      avatarShirtColor: Color(0xFFFDBA74),
    ),
    MentorModel(
      id: 'm_2',
      name: 'Jessica Wong',
      role: 'Creative Director',
      category: 'Design',
      tags: ['Branding', 'Strategy'],
      avatarShirtColor: Color(0xFFFDBA74),
    ),
    MentorModel(
      id: 'm_3',
      name: 'Marcus Chen',
      role: 'Lead Visual Designer',
      category: 'Design',
      tags: ['Typography', 'Motion'],
      avatarShirtColor: Color(0xFFFDBA74),
    ),
    MentorModel(
      id: 'm_4',
      name: 'David Kim',
      role: 'Staff Mobile Engineer',
      category: 'Coding',
      tags: ['Flutter', 'React Native'],
      avatarShirtColor: Color(0xFF93C5FD),
    ),
    MentorModel(
      id: 'm_5',
      name: 'Sophia Patel',
      role: 'VP of Growth & Acquisition',
      category: 'Marketing',
      tags: ['Content Strategy', 'SEO'],
      avatarShirtColor: Color(0xFF86EFAC),
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Filter mentors by search query and category
    final filteredMentors = _allMentors.where((mentor) {
      final matchesSearch = mentor.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          mentor.role.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          mentor.tags.any((tag) => tag.toLowerCase().contains(_searchQuery.toLowerCase()));

      final matchesCategory = _selectedCategory == 'All' || mentor.category == _selectedCategory;

      return matchesSearch && (_searchQuery.isNotEmpty || matchesCategory);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Navigation & Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Find Mentor',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF141A28),
                            letterSpacing: -0.4,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Level up your skills today',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFE2E8F0),
                    width: 1.2,
                  ),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (val) => setState(() => _searchQuery = val.trim()),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF141A28),
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Color(0xFF64748B),
                      size: 22,
                    ),
                    hintText: 'Search by name or skill',
                    hintStyle: TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Category Filter Chips (Horizontally Scrollable to prevent overflow)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: _categories.map((category) {
                  final bool isSelected = _selectedCategory == category && _searchQuery.isEmpty;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategory = category;
                          _searchQuery = '';
                          _searchController.clear();
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF7555F6)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF7555F6)
                                : const Color(0xFFE2E8F0),
                            width: 1.2,
                          ),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: const Color(0xFF7555F6)
                                        .withValues(alpha: 0.25),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ]
                              : [],
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF64748B),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 24),

            // Section Header: Top Mentors & See all
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Top Mentors',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF141A28),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = 'All';
                        _searchQuery = '';
                        _searchController.clear();
                      });
                    },
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF7555F6),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Mentors List
            Expanded(
              child: filteredMentors.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_search_rounded,
                            size: 52,
                            color: const Color(0xFFCBD5E1),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'No mentors found',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                      itemCount: filteredMentors.length,
                      itemBuilder: (context, index) {
                        final mentor = filteredMentors[index];
                        return _buildMentorCard(mentor);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMentorCard(MentorModel mentor) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ExpertProfileScreen(
              name: mentor.name,
              role: mentor.role,
              skillsOffer: mentor.tags,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Illustrated Avatar + Info
            Row(
              children: [
                _buildIllustratedAvatar(mentor.avatarShirtColor),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mentor.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF141A28),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        mentor.role,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // Bottom Tags Row
            Wrap(
              spacing: 8,
              children: mentor.tags.map((tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFE2E8F0),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    tag,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF334155),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Custom vector illustrated avatar matching Image 2
  Widget _buildIllustratedAvatar(Color accentColor) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CustomPaint(
          painter: _IllustratedAvatarPainter(accentColor: accentColor),
        ),
      ),
    );
  }
}

class _IllustratedAvatarPainter extends CustomPainter {
  final Color accentColor;

  _IllustratedAvatarPainter({required this.accentColor});

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
