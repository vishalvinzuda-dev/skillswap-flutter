import 'package:flutter/material.dart';
import 'admin_widgets.dart';
import 'admin_activity_log_screen.dart';

class AdminDashboardView extends StatelessWidget {
  final VoidCallback? onAvatarTap;
  final VoidCallback? onNavigateToUsers;
  final VoidCallback? onNavigateToSkills;

  const AdminDashboardView({
    super.key,
    this.onAvatarTap,
    this.onNavigateToUsers,
    this.onNavigateToSkills,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 110),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar: Logo & Avatar
            AdminTopBar(onAvatarTap: onAvatarTap),

            // Page Title: "Admin Dashboard"
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 8, 24, 20),
              child: Text(
                'Admin Dashboard',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.6,
                  color: Color(0xFF0F172A),
                ),
              ),
            ),

            // 2x2 Stat Cards Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Total Users
                      Expanded(
                        child: StatCard(
                          icon: Icons.people_alt_rounded,
                          label: 'Total Users',
                          value: '2,482',
                          topTrailing: const StatPillBadge(
                            backgroundColor: Color(0xFFDCFCE7),
                          ),
                          onTap: onNavigateToUsers,
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Active Swaps
                      Expanded(
                        child: StatCard(
                          icon: Icons.sync_rounded,
                          label: 'Active Swaps',
                          value: '73',
                          topTrailing: const StatPillBadge(
                            backgroundColor: Color(0xFFE0F2FE),
                          ),
                          onTap: onNavigateToSkills,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      // Total Mentors
                      Expanded(
                        child: StatCard(
                          icon: Icons.groups_rounded,
                          label: 'Total Mentors',
                          value: '326',
                          onTap: onNavigateToUsers,
                        ),
                      ),
                      const SizedBox(width: 16),
                      // New Signups
                      Expanded(
                        child: StatCard(
                          icon: Icons.person_add_rounded,
                          label: 'New Signups',
                          value: '24',
                          topTrailing: const StatPillBadge(
                            backgroundColor: Colors.transparent,
                            text: 'Today',
                            textColor: Color(0xFF64748B),
                          ),
                          onTap: onNavigateToUsers,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Recent Activity Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
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
                      color: const Color(0xFF64748B).withValues(alpha: 0.04),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recent Activity',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.3,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const AdminActivityLogScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'View All',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF7555F6),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // Activity 1: New user registered
                    ActivityTile(
                      icon: Icons.person_add_alt_1_rounded,
                      iconBackgroundColor: const Color(0xFFDCFCE7),
                      title: 'New user registered',
                      subtitle: 'Alex Johnson joined the platform',
                      timeAgo: '2m ago',
                      onTap: onNavigateToUsers,
                    ),

                    // Activity 2: Skill 'React' approved
                    ActivityTile(
                      icon: Icons.verified_rounded,
                      iconBackgroundColor: const Color(0xFFE0F2FE),
                      title: "Skill 'React' approved",
                      subtitle: 'Verified for mentor Sarah M.',
                      timeAgo: '15m ago',
                      onTap: onNavigateToSkills,
                    ),

                    // Activity 3: Swap completed
                    ActivityTile(
                      icon: Icons.handshake_rounded,
                      iconBackgroundColor: const Color(0xFFF3E8FF),
                      title: 'Swap completed',
                      subtitle: 'UI Design for Python Basics',
                      timeAgo: '1h ago',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AdminActivityLogScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
