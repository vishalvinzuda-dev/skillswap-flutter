import 'package:flutter/material.dart';
import 'design_skills_screen.dart';

class CategoryItem {
  final String title;
  final String skillsCount;
  final IconData icon;

  const CategoryItem({
    required this.title,
    required this.skillsCount,
    required this.icon,
  });
}

class TopCategoriesScreen extends StatefulWidget {
  final bool showBackButton;

  const TopCategoriesScreen({
    super.key,
    this.showBackButton = true,
  });

  @override
  State<TopCategoriesScreen> createState() => _TopCategoriesScreenState();
}

class _TopCategoriesScreenState extends State<TopCategoriesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<CategoryItem> _allCategories = const [
    CategoryItem(
      title: 'Design',
      skillsCount: '1.2k+ Skills',
      icon: Icons.rocket_launch_rounded,
    ),
    CategoryItem(
      title: 'Development',
      skillsCount: '2.5k+ Skills',
      icon: Icons.code_rounded,
    ),
    CategoryItem(
      title: 'Marketing',
      skillsCount: '840 Skills',
      icon: Icons.campaign_rounded,
    ),
    CategoryItem(
      title: 'Business',
      skillsCount: '1.1k+ Skills',
      icon: Icons.trending_up_rounded,
    ),
    CategoryItem(
      title: 'Music',
      skillsCount: '620 Skills',
      icon: Icons.music_note_rounded,
    ),
    CategoryItem(
      title: 'Cooking',
      skillsCount: '450 Skills',
      icon: Icons.restaurant_rounded,
    ),
    CategoryItem(
      title: 'Languages',
      skillsCount: '900+ Skills',
      icon: Icons.translate_rounded,
    ),
    CategoryItem(
      title: 'Fitness',
      skillsCount: '780 Skills',
      icon: Icons.fitness_center_rounded,
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredCategories = _allCategories.where((category) {
      return category.title.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    final bool canPop = widget.showBackButton && Navigator.canPop(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (canPop)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
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
                    ),
                  const Text(
                    'Top Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF141A28),
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
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
                  decoration: InputDecoration(
                    hintText: 'Search for any skill...',
                    hintStyle: const TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: Color(0xFF94A3B8),
                      size: 22,
                    ),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear_rounded, size: 18),
                            color: const Color(0xFF94A3B8),
                            onPressed: () {
                              _searchController.clear();
                              setState(() => _searchQuery = '');
                            },
                          )
                        : null,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ),

            // Categories Grid
            Expanded(
              child: filteredCategories.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.category_outlined,
                            size: 56,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'No categories found',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.fromLTRB(24, 4, 24, 28),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.95,
                      ),
                      itemCount: filteredCategories.length,
                      itemBuilder: (context, index) {
                        final item = filteredCategories[index];
                        return _buildCategoryCard(context, item);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, CategoryItem item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DesignSkillsScreen(
              categoryTitle: '${item.title} Skills',
            ),
          ),
        );
      },
      child: Container(
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
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFF1F5F9),
                  width: 1,
                ),
              ),
              child: Center(
                child: Icon(
                  item.icon,
                  color: const Color(0xFF141A28),
                  size: 26,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF141A28),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item.skillsCount,
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
