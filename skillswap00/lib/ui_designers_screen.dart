import 'package:flutter/material.dart';
import 'expert_profile_screen.dart';

class DesignerModel {
  final String name;
  final String role;
  final String location;
  final int swapsCount;
  final int skillsCount;
  final List<String> tags;
  final List<String> wantToLearn;
  final String swapType;
  final bool isOnline;
  final bool hasActionPlus;
  final Color? tagColor;
  final Color? tagBgColor;

  const DesignerModel({
    required this.name,
    required this.role,
    required this.location,
    required this.swapsCount,
    required this.skillsCount,
    required this.tags,
    required this.wantToLearn,
    required this.swapType,
    this.isOnline = true,
    this.hasActionPlus = true,
    this.tagColor,
    this.tagBgColor,
  });
}

class UIDesignersScreen extends StatefulWidget {
  final String skillCategory;

  const UIDesignersScreen({
    super.key,
    this.skillCategory = 'UI Designers',
  });

  @override
  State<UIDesignersScreen> createState() => _UIDesignersScreenState();
}

class _UIDesignersScreenState extends State<UIDesignersScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<DesignerModel> _designers = const [
    DesignerModel(
      name: 'Sarah Jenkins',
      role: 'SENIOR UI DESIGNER',
      location: 'San Francisco, CA',
      swapsCount: 24,
      skillsCount: 12,
      tags: ['Figma', 'Prototyping', 'Design Systems'],
      wantToLearn: ['French', 'Guitar', 'Public Speaking'],
      swapType: 'Swap only',
      isOnline: true,
      hasActionPlus: true,
    ),
    DesignerModel(
      name: 'Marcus Sterling',
      role: 'EXPERT UI/UX DESIGNER',
      location: 'London, UK',
      swapsCount: 18,
      skillsCount: 9,
      tags: ['Visual Arts', 'Branding', 'UI Layout'],
      wantToLearn: ['React Native', 'Blender 3D', 'Sound Design'],
      swapType: 'Swap only',
      isOnline: true,
      hasActionPlus: true,
    ),
    DesignerModel(
      name: 'Alex Rivera',
      role: 'PRODUCT DESIGNER',
      location: 'New York, NY',
      swapsCount: 15,
      skillsCount: 8,
      tags: ['Motion', 'Micro-interactions'],
      wantToLearn: ['Creative Writing', 'Piano', 'Data Viz'],
      swapType: 'Swap or Mentoring',
      isOnline: false,
      hasActionPlus: false,
      tagColor: Color(0xFFDC2626),
      tagBgColor: Color(0xFFFEE2E2),
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredDesigners = _designers.where((d) {
      final query = _searchQuery.toLowerCase();
      final matchesName = d.name.toLowerCase().contains(query);
      final matchesRole = d.role.toLowerCase().contains(query);
      final matchesTag =
          d.tags.any((tag) => tag.toLowerCase().contains(query));
      return matchesName || matchesRole || matchesTag;
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
                      widget.skillCategory,
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
                    hintText: 'Search UI experts...',
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

            // Experts List
            Expanded(
              child: filteredDesigners.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_search_outlined,
                            size: 56,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'No designers found',
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
                      padding: const EdgeInsets.fromLTRB(24, 4, 24, 32),
                      itemCount: filteredDesigners.length,
                      itemBuilder: (context, index) {
                        final designer = filteredDesigners[index];
                        return _buildDesignerCard(context, designer);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesignerCard(BuildContext context, DesignerModel designer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Avatar + Info
          Row(
            children: [
              // Avatar with Glowing Purple Border & Online Dot
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: designer.isOnline
                            ? const Color(0xFF7555F6)
                            : const Color(0xFFE2E8F0),
                        width: 2.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: CircleAvatar(
                        backgroundColor: const Color(0xFFF8FAFC),
                        child: Text(
                          designer.name.isNotEmpty ? designer.name[0] : 'U',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: designer.isOnline
                                ? const Color(0xFF7555F6)
                                : const Color(0xFF64748B),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (designer.isOnline)
                    Container(
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration(
                        color: const Color(0xFF22C55E),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(width: 16),

              // Name and Role
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      designer.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF141A28),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      designer.role,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.8,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Skill Tags Row
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: designer.tags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: designer.tagBgColor ??
                                const Color(0xFFF3F0FF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: designer.tagColor ??
                                  const Color(0xFF7555F6),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // Divider
          const Divider(
            color: Color(0xFFF1F5F9),
            thickness: 1.2,
            height: 1,
          ),

          const SizedBox(height: 14),

          // Footer: Swap label + View Profile Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                designer.swapType,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF141A28),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ExpertProfileScreen(
                        name: designer.name,
                        role: designer.role,
                        location: designer.location,
                        swapsCount: designer.swapsCount,
                        skillsCount: designer.skillsCount,
                        skillsOffer: designer.tags,
                        wantToLearn: designer.wantToLearn,
                      ),
                    ),
                  );
                },
                child: designer.hasActionPlus
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF7555F6),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF7555F6)
                                  .withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'View Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.add_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'View Profile',
                            style: TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 2),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: Color(0xFF64748B),
                            size: 18,
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
