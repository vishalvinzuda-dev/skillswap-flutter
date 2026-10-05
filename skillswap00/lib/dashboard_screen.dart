import 'package:flutter/material.dart';
import 'home_view.dart';
import 'search_view.dart';
import 'calendar_view.dart';
import 'profile_view.dart';

class SkillSwapDashboard extends StatefulWidget {
  const SkillSwapDashboard({super.key});

  @override
  State<SkillSwapDashboard> createState() => _SkillSwapDashboardState();
}

class _SkillSwapDashboardState extends State<SkillSwapDashboard> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          IndexedStack(
            index: _navIndex,
            children: const [
              HomeView(),
              SearchView(),
              CalendarView(),
              ProfileView(),
            ],
          ),

          // Floating Bottom Nav
          Positioned(
            left: 24,
            right: 24,
            bottom: 24,
            child: Container(
              height: 72,
              decoration: BoxDecoration(
                color: const Color(0xFF141927),
                borderRadius: BorderRadius.circular(36),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(Icons.home_rounded, 0),
                  _buildNavItem(Icons.search_rounded, 1),
                  _buildNavItem(Icons.calendar_month_rounded, 2),
                  _buildNavItem(Icons.person_outline_rounded, 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _navIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _navIndex = index),
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF7555F6) : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          icon,
          color: isSelected ? const Color(0xFF141A28) : const Color(0xFF64748B),
          size: 24,
        ),
      ),
    );
  }
}
