
import 'package:flutter/material.dart';
import 'admin_category_management_screen.dart';

class AdminQuickActionsSheet extends StatelessWidget {
  final VoidCallback onNavigateToUsers;
  final VoidCallback onNavigateToSkills;

  const AdminQuickActionsSheet({
    super.key,
    required this.onNavigateToUsers,
    required this.onNavigateToSkills,
  });

  static void show(BuildContext context, {
    required VoidCallback onNavigateToUsers,
    required VoidCallback onNavigateToSkills,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => AdminQuickActionsSheet(
        onNavigateToUsers: onNavigateToUsers,
        onNavigateToSkills: onNavigateToSkills,
      ),
    );
  }

  void _showBroadcastDialog(BuildContext context) {
    Navigator.pop(context);
    final titleController = TextEditingController();
    final msgController = TextEditingController();

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
                    'Platform Announcement',
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
              const Text('Announcement Title', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF64748B))),
              const SizedBox(height: 6),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'e.g. Scheduled Platform Update',
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Message Body', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF64748B))),
              const SizedBox(height: 6),
              TextField(
                controller: msgController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Type announcement message sent to all active users...',
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (titleController.text.trim().isNotEmpty) {
                      Navigator.pop(ctx);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Announcement broadcasted to 2,482 users!'),
                          backgroundColor: Color(0xFF10B981),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.campaign_rounded, color: Colors.white),
                  label: const Text('Send Broadcast', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF141927),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                    elevation: 0,
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Quick Admin Actions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0F172A),
                letterSpacing: -0.4,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Create new records or broadcast platform updates',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildActionTile(
                    icon: Icons.person_add_rounded,
                    color: const Color(0xFFDCFCE7),
                    iconColor: const Color(0xFF16A34A),
                    title: 'Add User',
                    subtitle: 'Create manual account',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigateToUsers();
                    },
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _buildActionTile(
                    icon: Icons.category_rounded,
                    color: const Color(0xFFE0F2FE),
                    iconColor: const Color(0xFF0284C7),
                    title: 'New Category',
                    subtitle: 'Expand skill domains',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AdminCategoryManagementScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: _buildActionTile(
                    icon: Icons.verified_user_rounded,
                    color: const Color(0xFFF3E8FF),
                    iconColor: const Color(0xFF9333EA),
                    title: 'Skill Requests',
                    subtitle: 'Review incoming requests',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigateToSkills();
                    },
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _buildActionTile(
                    icon: Icons.campaign_rounded,
                    color: const Color(0xFFFEF3C7),
                    iconColor: const Color(0xFFD97706),
                    title: 'Broadcast',
                    subtitle: 'Alert all active users',
                    onTap: () => _showBroadcastDialog(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required Color color,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
