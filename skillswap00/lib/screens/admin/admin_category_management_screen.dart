import 'package:flutter/material.dart';

class AdminCategoryManagementScreen extends StatefulWidget {
  const AdminCategoryManagementScreen({super.key});

  @override
  State<AdminCategoryManagementScreen> createState() =>
      _AdminCategoryManagementScreenState();
}

class _AdminCategoryManagementScreenState
    extends State<AdminCategoryManagementScreen> {
  final List<Map<String, dynamic>> _categories = [
    {
      'id': '1',
      'name': 'Design & Creative',
      'skillsCount': 124,
      'icon': Icons.palette_outlined,
      'color': Color(0xFF7555F6),
      'active': true,
      'description': 'UI/UX, Graphic Design, Figma, 3D Modeling & Illustration',
    },
    {
      'id': '2',
      'name': 'Programming & Tech',
      'skillsCount': 188,
      'icon': Icons.code_rounded,
      'color': Color(0xFF3B82F6),
      'active': true,
      'description': 'Flutter, React, Python, Backend, AI & Cloud Computing',
    },
    {
      'id': '3',
      'name': 'Languages',
      'skillsCount': 72,
      'icon': Icons.translate_rounded,
      'color': Color(0xFF10B981),
      'active': true,
      'description': 'Spanish, French, Japanese, German & English Fluency',
    },
    {
      'id': '4',
      'name': 'Business & Marketing',
      'skillsCount': 64,
      'icon': Icons.trending_up_rounded,
      'color': Color(0xFFF59E0B),
      'active': true,
      'description': 'Product Management, SEO, Digital Marketing & Growth',
    },
    {
      'id': '5',
      'name': 'Music & Audio',
      'skillsCount': 42,
      'icon': Icons.music_note_rounded,
      'color': Color(0xFFEC4899),
      'active': true,
      'description': 'Guitar, Piano, Vocal Training, Music Production & Mixing',
    },
    {
      'id': '6',
      'name': 'Photography & Video',
      'skillsCount': 38,
      'icon': Icons.camera_alt_outlined,
      'color': Color(0xFF8B5CF6),
      'active': true,
      'description': 'Portrait Photography, Lightroom, Premiere Pro & Cinematography',
    },
  ];

  void _showAddCategoryDialog() {
    final nameController = TextEditingController();
    final descController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Add Category',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.pop(ctx),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Category Name',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'e.g. Data Science & AI',
                  hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Description & Sub-skills',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: descController,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'e.g. Machine Learning, Python, Statistics...',
                  hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    if (nameController.text.trim().isNotEmpty) {
                      setState(() {
                        _categories.add({
                          'id': DateTime.now().millisecondsSinceEpoch.toString(),
                          'name': nameController.text.trim(),
                          'skillsCount': 0,
                          'icon': Icons.category_rounded,
                          'color': const Color(0xFF7555F6),
                          'active': true,
                          'description': descController.text.trim(),
                        });
                      });
                      Navigator.pop(ctx);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Category created successfully'),
                          backgroundColor: Color(0xFF10B981),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF141927),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Create Category',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF0F172A), size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Category Management',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded, color: Color(0xFF7555F6), size: 28),
            onPressed: _showAddCategoryDialog,
          ),
          const SizedBox(width: 8),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: const Color(0xFFF1F5F9), height: 1),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: _categories.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final cat = _categories[index];
          final bool isActive = cat['active'] as bool;

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: (cat['color'] as Color).withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    cat['icon'] as IconData,
                    color: cat['color'] as Color,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              cat['name'] as String,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF0F172A),
                              ),
                            ),
                          ),
                          Switch.adaptive(
                            value: isActive,
                            activeTrackColor: const Color(0xFF06B6D4),
                            activeThumbColor: Colors.white,
                            onChanged: (val) {
                              setState(() {
                                cat['active'] = val;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        cat['description'] as String,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF64748B),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${cat['skillsCount']} Skills Offered',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF475569),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddCategoryDialog,
        backgroundColor: const Color(0xFF141927),
        icon: const Icon(Icons.add_rounded, color: Colors.white),
        label: const Text(
          'Add Category',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
