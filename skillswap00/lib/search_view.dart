import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFF1F5F9),
                    width: 1.5,
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search skills or mentors...',
                    hintStyle: const TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(
                      Icons.mail_outline_rounded,
                      color: Color(0xFF94A3B8),
                      size: 20,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF7555F6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.tune_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Searches',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF141A28),
                    ),
                  ),
                  const Text(
                    'Clear All',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Wrap(
                spacing: 8,
                runSpacing: 12,
                children: [
                  _buildSearchChip('Figma Pro'),
                  _buildSearchChip('React.js'),
                  _buildSearchChip('Product Management'),
                  _buildSearchChip('Photography'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Suggested for You',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF141A28),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildSuggestedCard(
              tag: 'INTERMEDIATE',
              tagColor: const Color(0xFF7555F6),
              title: 'Advanced App Layouts',
              mentor: 'Elena Gilbert',
            ),
            _buildSuggestedCard(
              tag: 'BEGINNER',
              tagColor: const Color(0xFF38BDF8),
              title: 'Barista Fundamentals',
              mentor: 'Marcus Thorne',
            ),
            _buildSuggestedCard(
              tag: 'FREE',
              tagColor: const Color(0xFF7555F6),
              title: 'Modern Pottery',
              mentor: 'Sophie Chen',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(width: 6),
          const Icon(Icons.close_rounded, size: 14, color: Color(0xFF94A3B8)),
        ],
      ),
    );
  }

  Widget _buildSuggestedCard({
    required String tag,
    required Color tagColor,
    required String title,
    required String mentor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.psychology_outlined,
            size: 40,
            color: Color(0xFF38BDF8),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: tagColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: tagColor,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF141A28),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 8,
                      backgroundColor: Color(0xFF38BDF8),
                      child: Icon(Icons.person, size: 10, color: Colors.white),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      mentor,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_left_rounded, color: Color(0xFF94A3B8)),
        ],
      ),
    );
  }
}
