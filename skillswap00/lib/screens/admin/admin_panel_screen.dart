import 'package:flutter/material.dart';
import 'admin_dashboard_view.dart';
import 'admin_users_view.dart';
import 'admin_skills_view.dart';
import 'admin_settings_view.dart';
import 'admin_quick_actions_sheet.dart';

class AdminPanelScreen extends StatefulWidget {
  final int initialIndex;

  const AdminPanelScreen({super.key, this.initialIndex = 0});

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTabSelected(int index) {
    setState(() => _currentIndex = index);
  }

  void _openQuickActions() {
    AdminQuickActionsSheet.show(
      context,
      onNavigateToUsers: () => setState(() => _currentIndex = 1),
      onNavigateToSkills: () => setState(() => _currentIndex = 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Stack(
        children: [
          // Content pages
          IndexedStack(
            index: _currentIndex,
            children: [
              AdminDashboardView(
                onAvatarTap: () => setState(() => _currentIndex = 3),
                onNavigateToUsers: () => setState(() => _currentIndex = 1),
                onNavigateToSkills: () => setState(() => _currentIndex = 2),
              ),
              AdminUsersView(
                onAvatarTap: () => setState(() => _currentIndex = 3),
              ),
              AdminSkillsView(
                onAvatarTap: () => setState(() => _currentIndex = 3),
              ),
              AdminSettingsView(
                onAvatarTap: () => setState(() => _currentIndex = 3),
              ),
            ],
          ),

          // Floating bottom navigation pill matching the design
          Positioned(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).padding.bottom + 12,
            child: _buildBottomNav(),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 0: Home
          _buildNavItem(
            icon: Icons.home_rounded,
            label: 'Home',
            isSelected: _currentIndex == 0,
            onTap: () => _onTabSelected(0),
          ),

          // 1: Users
          _buildNavItem(
            icon: Icons.groups_rounded,
            label: _currentIndex == 1 ? 'USERS' : 'Users',
            isSelected: _currentIndex == 1,
            onTap: () => _onTabSelected(1),
            dotsAbove: _currentIndex == 1 ? 3 : 0,
          ),

          // Center: '+' button
          GestureDetector(
            onTap: _openQuickActions,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF141927),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF141927).withValues(alpha: 0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 26,
              ),
            ),
          ),

          // 2: Skills
          _buildNavItem(
            icon: Icons.layers_rounded,
            label: 'Skills',
            isSelected: _currentIndex == 2,
            onTap: () => _onTabSelected(2),
          ),

          // 3: Settings
          _buildNavItem(
            icon: Icons.settings_rounded,
            label: _currentIndex == 3 ? 'SETTINGS' : 'Settings',
            isSelected: _currentIndex == 3,
            onTap: () => _onTabSelected(3),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    int dotsAbove = 0,
  }) {
    final activeColor = const Color(0xFF7555F6);
    final inactiveColor = const Color(0xFF94A3B8);

    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (dotsAbove > 0 && isSelected)
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    dotsAbove,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 1.5),
                      width: 3.5,
                      height: 3.5,
                      decoration: BoxDecoration(
                        color: activeColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              )
            else
              const SizedBox(height: 5.5),
            Icon(
              icon,
              size: 24,
              color: isSelected ? activeColor : inactiveColor,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected ? activeColor : inactiveColor,
                letterSpacing: isSelected && (label == 'USERS' || label == 'SETTINGS') ? 0.3 : 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
