import 'package:flutter/material.dart';
import '../../common/widgets/illustrated_avatar.dart';
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
    return IllustratedAvatar(
      size: 54,
      accentColor: accentColor,
    );
  }
}
