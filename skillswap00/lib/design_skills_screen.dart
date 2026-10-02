import 'package:flutter/material.dart';
import 'ui_designers_screen.dart';

class SkillRecommendation {
  final String title;
  final String description;
  final IconData icon;
  final bool isInitiallyAdded;

  const SkillRecommendation({
    required this.title,
    required this.description,
    required this.icon,
    this.isInitiallyAdded = false,
  });
}

class DesignSkillsScreen extends StatefulWidget {
  final String categoryTitle;

  const DesignSkillsScreen({
    super.key,
    this.categoryTitle = 'Design Skills',
  });

  @override
  State<DesignSkillsScreen> createState() => _DesignSkillsScreenState();
}

class _DesignSkillsScreenState extends State<DesignSkillsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final Set<String> _addedSkills = {'UX Research'};

  final List<SkillRecommendation> _recommendedSkills = const [
    SkillRecommendation(
      title: 'UI Design',
      description: 'User interfaces...',
      icon: Icons.dashboard_customize_outlined,
      isInitiallyAdded: false,
    ),
    SkillRecommendation(
      title: 'UX Research',
      description: 'User personas, interviews...',
      icon: Icons.manage_search_rounded,
      isInitiallyAdded: true,
    ),
    SkillRecommendation(
      title: 'Motion Graphics',
      description: 'After Effects, Lottie, and...',
      icon: Icons.movie_creation_outlined,
      isInitiallyAdded: false,
    ),
    SkillRecommendation(
      title: 'Illustration',
      description: 'Digital character design...',
      icon: Icons.palette_outlined,
      isInitiallyAdded: false,
    ),
    SkillRecommendation(
      title: 'Logo Design',
      description: 'Brand identity and vector...',
      icon: Icons.crop_free_rounded,
      isInitiallyAdded: false,
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _toggleSkill(String title) {
    setState(() {
      if (_addedSkills.contains(title)) {
        _addedSkills.remove(title);
      } else {
        _addedSkills.add(title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredSkills = _recommendedSkills.where((skill) {
      return skill.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          skill.description.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

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
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFF1F5F9),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.chevron_left_rounded,
                        color: Color(0xFF141A28),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      widget.categoryTitle,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF141A28),
                      ),
                    ),
                  ),
                  // Dark circular filter button matching design
                  Container(
                    width: 42,
                    height: 42,
                    decoration: const BoxDecoration(
                      color: Color(0xFF141927),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.filter_alt_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xFFF1F5F9),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (val) => setState(() => _searchQuery = val),
                  decoration: const InputDecoration(
                    hintText: 'Search Design skills...',
                    hintStyle: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Color(0xFF94A3B8),
                      size: 22,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ),

            // Content list
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Fluid Gradient Banner ("Visual Arts & UI")
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
                          height: 145,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF4C1D95),
                                Color(0xFF6D28D9),
                                Color(0xFF7C3AED),
                                Color(0xFF8B5CF6),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF7C3AED)
                                    .withValues(alpha: 0.35),
                                blurRadius: 18,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Stack(
                              children: [
                                // Organic wave decoration
                                CustomPaint(
                                  size: const Size(double.infinity, 145),
                                  painter: _FluidWavePainter(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Glassmorphism icon
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white
                                              .withValues(alpha: 0.22),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white
                                                .withValues(alpha: 0.3),
                                            width: 1,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.rocket_launch_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Visual Arts & UI',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
                                              letterSpacing: -0.2,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            '8.4k members active now',
                                            style: TextStyle(
                                              color: Colors.white
                                                  .withValues(alpha: 0.85),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Section Title
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'RECOMMENDED SKILLS',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.1,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Skills List
                    ...filteredSkills.map((skill) {
                      final bool isAdded = _addedSkills.contains(skill.title);
                      return _buildSkillItem(skill, isAdded);
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillItem(SkillRecommendation skill, bool isAdded) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFF1F5F9),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.015),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon Box
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: const Color(0xFFF1F5F9),
                width: 1,
              ),
            ),
            child: Icon(
              skill.icon,
              color: const Color(0xFF141A28),
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          // Texts
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                // Tapping navigates to UI Designers screen!
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => UIDesignersScreen(
                      skillCategory: skill.title,
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skill.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF141A28),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    skill.description,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF94A3B8),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          // Toggle Action Button
          GestureDetector(
            onTap: () => _toggleSkill(skill.title),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isAdded
                    ? const Color(0xFFEDE9FE)
                    : const Color(0xFF7555F6),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isAdded ? Icons.check_rounded : Icons.add_rounded,
                color: isAdded
                    ? const Color(0xFF7555F6)
                    : Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FluidWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = Colors.white.withValues(alpha: 0.12)
      ..style = PaintingStyle.fill;

    final path1 = Path();
    path1.moveTo(size.width * 0.45, 0);
    path1.cubicTo(
      size.width * 0.55,
      size.height * 0.3,
      size.width * 0.75,
      size.height * 0.4,
      size.width,
      size.height * 0.2,
    );
    path1.lineTo(size.width, 0);
    path1.close();
    canvas.drawPath(path1, paint1);

    final paint2 = Paint()
      ..color = Colors.white.withValues(alpha: 0.08)
      ..style = PaintingStyle.fill;

    final path2 = Path();
    path2.moveTo(size.width * 0.3, size.height);
    path2.cubicTo(
      size.width * 0.5,
      size.height * 0.55,
      size.width * 0.8,
      size.height * 0.8,
      size.width,
      size.height * 0.45,
    );
    path2.lineTo(size.width, size.height);
    path2.close();
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
