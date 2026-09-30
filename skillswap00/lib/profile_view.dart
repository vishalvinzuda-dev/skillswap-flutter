import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 120),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF141A28),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFF1F5F9),
                        width: 1.5,
                      ),
                    ),
                    child: const Icon(
                      Icons.notifications_none_rounded,
                      color: Color(0xFF141A28),
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF7555F6),
                      width: 3,
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundColor: Color(0xFF38BDF8),
                    child: Icon(Icons.person, color: Colors.white, size: 60),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7555F6),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Sarah Jenkins',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF141A28),
              ),
            ),
            const SizedBox(height: 4),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.mail_outline_rounded,
                  size: 14,
                  color: Color(0xFF94A3B8),
                ),
                SizedBox(width: 4),
                Text(
                  'San Francisco, CA',
                  style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '24',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF141A28),
                          ),
                        ),
                        Text(
                          'SWAPS',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      color: Color(0xFFF1F5F9),
                      thickness: 1.5,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '12',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF141A28),
                          ),
                        ),
                        Text(
                          'SKILLS',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionHeader('Skills I Offer', Icons.chevron_left_rounded),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 12,
                  children: [
                    _buildSkillChip('UI Design', true),
                    _buildSkillChip('Prototyping', true),
                    _buildSkillChip('Figma', true),
                    _buildSkillChip('Photography', true),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionHeader('Want to Learn', Icons.chevron_left_rounded),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 12,
                  children: [
                    _buildSkillChip('French', false),
                    _buildSkillChip('Guitar', false),
                    _buildSkillChip('Public Speaking', false),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const EditProfileScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.edit_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                  label: const Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF141927),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF141A28),
            ),
          ),
          Icon(icon, color: const Color(0xFF7555F6)),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String label, bool isPrimary) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isPrimary
            ? const Color(0xFF7555F6).withValues(alpha: 0.1)
            : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isPrimary
              ? const Color(0xFF7555F6).withValues(alpha: 0.3)
              : const Color(0xFFF1F5F9),
          width: 1.5,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isPrimary ? const Color(0xFF7555F6) : const Color(0xFF64748B),
        ),
      ),
    );
  }
}
