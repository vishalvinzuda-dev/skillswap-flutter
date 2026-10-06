import 'package:flutter/material.dart';
import 'admin_widgets.dart';
import 'admin_category_management_screen.dart';
import '../edit_profile_screen.dart';

class AdminUsersView extends StatefulWidget {
  final VoidCallback? onAvatarTap;

  const AdminUsersView({super.key, this.onAvatarTap});

  @override
  State<AdminUsersView> createState() => _AdminUsersViewState();
}

class _AdminUsersViewState extends State<AdminUsersView> {
  // Navigation state between User Details & User Settings according to Figma prototype
  bool _showingSettings = false;
  Map<String, dynamic>? _selectedUser;

  // Search & Filter
  String _searchQuery = '';
  String _selectedStatus = 'All';
  final TextEditingController _searchController = TextEditingController();

  // Settings Toggles
  bool _maintenanceMode = false;
  bool _pushNotifications = true;
  bool _emailAlerts = false;

  final List<Map<String, dynamic>> _users = [
    {
      'id': '1',
      'name': 'Sarah Jenkins',
      'email': 'sarah.j@uxdesign.com',
      'status': 'Active',
      'joined': 'Joined Oct 12, 2023',
      'role': 'Senior Mentor',
    },
    {
      'id': '2',
      'name': 'Marcus Aurelius',
      'email': 'm.aurelius@stoic.io',
      'status': 'Pending',
      'joined': 'Joined Oct 14, 2023',
      'role': 'Learner',
    },
    {
      'id': '3',
      'name': 'David Chen',
      'email': 'd.chen@coder.net',
      'status': 'Suspended',
      'joined': 'Joined Oct 05, 2023',
      'role': 'Mentor',
    },
    {
      'id': '4',
      'name': 'Emily Watson',
      'email': 'e.watson@creative.com',
      'status': 'Active',
      'joined': 'Joined Sep 28, 2023',
      'role': 'Learner',
    },
    {
      'id': '5',
      'name': 'Alex Johnson',
      'email': 'alex.j@example.com',
      'status': 'Active',
      'joined': 'Joined Sep 24, 2023',
      'role': 'Learner',
    },
    {
      'id': '6',
      'name': 'Carlos Rivera',
      'email': 'carlos.r@datasci.org',
      'status': 'Active',
      'joined': 'Joined Sep 19, 2023',
      'role': 'Mentor',
    },
  ];

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
                const SizedBox(height: 16),
                const Text(
                  'Filter by Status',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 16),
                ...['All', 'Active', 'Pending', 'Suspended'].map((status) {
                  final isSelected = _selectedStatus == status;
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      status,
                      style: TextStyle(
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: isSelected ? const Color(0xFF7555F6) : const Color(0xFF0F172A),
                      ),
                    ),
                    trailing: isSelected
                        ? const Icon(
                            Icons.check_circle_rounded,
                            color: Color(0xFF7555F6),
                          )
                        : null,
                    onTap: () {
                      setState(() => _selectedStatus = status);
                      Navigator.pop(ctx);
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showUserActionSheet(Map<String, dynamic> user) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  user['name'] as String,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0F172A),
                  ),
                ),
                Text(
                  user['email'] as String,
                  style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                ),
                const SizedBox(height: 16),
                const Divider(height: 1, color: Color(0xFFF1F5F9)),
                ListTile(
                  leading: const Icon(Icons.settings_suggest_rounded, color: Color(0xFF7555F6)),
                  title: const Text('Open User Settings', style: TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: const Text('Manage account control & policies'),
                  onTap: () {
                    Navigator.pop(ctx);
                    setState(() {
                      _selectedUser = user;
                      _showingSettings = true;
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.manage_accounts_outlined, color: Color(0xFF16A34A)),
                  title: const Text('Change User Status', style: TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text('Current status: ${user['status']}'),
                  onTap: () {
                    Navigator.pop(ctx);
                    setState(() {
                      if (user['status'] == 'Active') {
                        user['status'] = 'Suspended';
                      } else {
                        user['status'] = 'Active';
                      }
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Updated ${user['name']} to ${user['status']}")),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showChangePasswordDialog() {
    final newPw = TextEditingController();
    final confirmPw = TextEditingController();

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
            top: 20,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 42,
                  height: 4.5,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Change Password',
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
              const Text('New Password', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF64748B))),
              const SizedBox(height: 8),
              TextField(
                controller: newPw,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Minimum 8 characters',
                  prefixIcon: const Icon(Icons.lock_outline_rounded, color: Color(0xFF94A3B8)),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Confirm Password', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF64748B))),
              const SizedBox(height: 8),
              TextField(
                controller: confirmPw,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Repeat new password',
                  prefixIcon: const Icon(Icons.lock_outline_rounded, color: Color(0xFF94A3B8)),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (newPw.text.length >= 6 && newPw.text == confirmPw.text) {
                      Navigator.pop(ctx);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Password updated successfully'),
                          backgroundColor: Color(0xFF10B981),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF141927),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 0,
                  ),
                  child: const Text('Update Password', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showProfileInfoModal() {
    final user = _selectedUser ?? _users.first;
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
            top: 20,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 42,
                height: 4.5,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Profile Information',
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
              Container(
                width: 68,
                height: 68,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF3B82F6),
                ),
                child: const Center(
                  child: Icon(Icons.person_rounded, color: Colors.white, size: 38),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                user['name'] as String,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF0F172A)),
              ),
              Text(
                user['email'] as String,
                style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFF1F5F9)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Role', style: TextStyle(color: Color(0xFF64748B), fontSize: 13)),
                        Text(user['role'] as String, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF0F172A))),
                      ],
                    ),
                    const Divider(height: 18, color: Color(0xFFE2E8F0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Status', style: TextStyle(color: Color(0xFF64748B), fontSize: 13)),
                        _buildStatusBadge(user['status'] as String),
                      ],
                    ),
                    const Divider(height: 18, color: Color(0xFFE2E8F0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Registration', style: TextStyle(color: Color(0xFF64748B), fontSize: 13)),
                        Text(user['joined'] as String, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF0F172A), fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(ctx);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const EditProfileScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit_rounded, color: Colors.white, size: 18),
                  label: const Text('Edit Account Profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF141927),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatusBadge(String status) {
    Color bg;
    Color textColor;

    switch (status) {
      case 'Active':
        bg = const Color(0xFFDCFCE7);
        textColor = const Color(0xFF16A34A);
        break;
      case 'Pending':
        bg = const Color(0xFFFEF3C7);
        textColor = const Color(0xFFD97706);
        break;
      case 'Suspended':
      default:
        bg = const Color(0xFFFEE2E2);
        textColor = const Color(0xFFDC2626);
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // If _showingSettings is true, render User Settings frame.
    // When Sign Out Account is tapped, it redirects right back to User Details frame!
    if (_showingSettings) {
      return _buildUserSettingsFrame();
    }
    return _buildUserDetailsFrame();
  }

  // FRAME 2: User Details (Main screen for USERS tab)
  Widget _buildUserDetailsFrame() {
    final filteredUsers = _users.where((user) {
      final matchesStatus = _selectedStatus == 'All' || user['status'] == _selectedStatus;
      final matchesQuery = _searchQuery.isEmpty ||
          (user['name'] as String).toLowerCase().contains(_searchQuery.toLowerCase()) ||
          (user['email'] as String).toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesStatus && matchesQuery;
    }).toList();

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Logo & Avatar
            AdminTopBar(onAvatarTap: widget.onAvatarTap),

            // Title: "User Details"
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 6, 24, 16),
              child: Text(
                'User Details',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                  letterSpacing: -0.6,
                ),
              ),
            ),

            // Search and Filter Bar Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
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
                        onChanged: (val) => setState(() => _searchQuery = val),
                        decoration: InputDecoration(
                          hintText: 'Search users by name or email...',
                          hintStyle: const TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 13,
                          ),
                          prefixIcon: const Icon(
                            Icons.search_rounded,
                            color: Color(0xFF94A3B8),
                            size: 20,
                          ),
                          suffixIcon: _searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear_rounded, size: 18),
                                  onPressed: () {
                                    _searchController.clear();
                                    setState(() => _searchQuery = '');
                                  },
                                )
                              : null,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: _showFilterModal,
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFFE2E8F0),
                          width: 1.2,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.tune_rounded,
                          color: Color(0xFF0F172A),
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Stat Cards Row: TOTAL USERS & ACTIVE TODAY
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  // TOTAL USERS
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF64748B).withValues(alpha: 0.04),
                            blurRadius: 14,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF6FF),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.groups_rounded,
                                color: Color(0xFF1D4ED8),
                                size: 24,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'TOTAL USERS',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF94A3B8),
                                  letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '2,482',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF0F172A),
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // ACTIVE TODAY
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF64748B).withValues(alpha: 0.04),
                            blurRadius: 14,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: const Color(0xFFECFEFF),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.bolt_rounded,
                                color: Color(0xFF06B6D4),
                                size: 24,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ACTIVE TODAY',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF94A3B8),
                                  letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '204',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF0F172A),
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // Section Header: "Recent Users" + "Showing 120"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Users',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3E8FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Showing 120',
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF7C3AED),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // User Cards List (Tapping any user redirects to User Settings, matching the Figma prototype!)
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: filteredUsers.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final user = filteredUsers[index];
                return InkWell(
                  onTap: () {
                    // Navigate to User Settings frame according to Figma prototype!
                    setState(() {
                      _selectedUser = user;
                      _showingSettings = true;
                    });
                  },
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF64748B).withValues(alpha: 0.035),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Blue circular avatar
                        Container(
                          width: 44,
                          height: 44,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF3B82F6),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.person_rounded,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    user['name'] as String,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF0F172A),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  _buildStatusBadge(user['status'] as String),
                                ],
                              ),
                              const SizedBox(height: 3),
                              Text(
                                user['email'] as String,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF64748B),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today_rounded,
                                    size: 12,
                                    color: Color(0xFF94A3B8),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    user['joined'] as String,
                                    style: const TextStyle(
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF94A3B8),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.more_vert_rounded,
                            color: Color(0xFF94A3B8),
                            size: 20,
                          ),
                          onPressed: () => _showUserActionSheet(user),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // FRAME 1: User Settings (Reached by tapping any user card from User Details)
  Widget _buildUserSettingsFrame() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar: Logo & Avatar
            AdminTopBar(onAvatarTap: widget.onAvatarTap),

            // Back button leading to User Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => setState(() => _showingSettings = false),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.arrow_back_rounded, size: 16, color: Color(0xFF0F172A)),
                          SizedBox(width: 4),
                          Text(
                            'User Details',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Page Title: "User Settings"
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 10, 24, 16),
              child: Text(
                'User Settings',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.6,
                  color: Color(0xFF0F172A),
                ),
              ),
            ),

            // SECTION 1: ACCOUNT CONTROL
            _buildSectionHeader('ACCOUNT CONTROL'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF64748B).withValues(alpha: 0.04),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildSettingsTile(
                      icon: Icons.person_pin_rounded,
                      title: 'Profile Information',
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                        color: Color(0xFFCBD5E1),
                        size: 22,
                      ),
                      onTap: _showProfileInfoModal,
                    ),
                    const Divider(height: 1, color: Color(0xFFF1F5F9), indent: 16, endIndent: 16),
                    _buildSettingsTile(
                      icon: Icons.lock_rounded,
                      title: 'Change Password',
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                        color: Color(0xFFCBD5E1),
                        size: 22,
                      ),
                      onTap: _showChangePasswordDialog,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // SECTION 2: PLATFORM MANAGEMENT
            _buildSectionHeader('PLATFORM MANAGEMENT'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF64748B).withValues(alpha: 0.04),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildSettingsTile(
                      icon: Icons.handyman_rounded,
                      title: 'Maintenance Mode',
                      subtitle: 'Offline for all users',
                      trailing: Switch.adaptive(
                        value: _maintenanceMode,
                        activeTrackColor: const Color(0xFF06B6D4),
                        activeThumbColor: Colors.white,
                        inactiveTrackColor: const Color(0xFFE2E8F0),
                        onChanged: (val) {
                          setState(() => _maintenanceMode = val);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                val
                                    ? 'Maintenance Mode ENABLED. Platform offline for users.'
                                    : 'Maintenance Mode DISABLED. Platform live.',
                              ),
                              backgroundColor: val ? const Color(0xFFEF4444) : const Color(0xFF10B981),
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(height: 1, color: Color(0xFFF1F5F9), indent: 16, endIndent: 16),
                    _buildSettingsTile(
                      icon: Icons.layers_rounded,
                      title: 'Category Management',
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                        color: Color(0xFFCBD5E1),
                        size: 22,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AdminCategoryManagementScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // SECTION 3: NOTIFICATIONS
            _buildSectionHeader('NOTIFICATIONS'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF64748B).withValues(alpha: 0.04),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildSettingsTile(
                      icon: Icons.notifications_rounded,
                      title: 'Push Notifications',
                      trailing: Switch.adaptive(
                        value: _pushNotifications,
                        activeTrackColor: const Color(0xFF06B6D4),
                        activeThumbColor: Colors.white,
                        inactiveTrackColor: const Color(0xFFE2E8F0),
                        onChanged: (val) {
                          setState(() => _pushNotifications = val);
                        },
                      ),
                    ),
                    const Divider(height: 1, color: Color(0xFFF1F5F9), indent: 16, endIndent: 16),
                    _buildSettingsTile(
                      icon: Icons.mark_email_unread_rounded,
                      title: 'Email Alerts',
                      trailing: Switch.adaptive(
                        value: _emailAlerts,
                        activeTrackColor: const Color(0xFF06B6D4),
                        activeThumbColor: Colors.white,
                        inactiveTrackColor: const Color(0xFFE2E8F0),
                        onChanged: (val) {
                          setState(() => _emailAlerts = val);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // SIGN OUT ACCOUNT BUTTON -> Redirects directly to User Details according to Figma prototype!
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Material(
                color: const Color(0xFF141927),
                borderRadius: BorderRadius.circular(24),
                child: InkWell(
                  onTap: () {
                    // Redirect directly to User Details frame according to Figma prototype!
                    setState(() {
                      _showingSettings = false;
                    });
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          _selectedUser != null
                              ? "Signed out '${_selectedUser!['name']}'. Redirected to User Details."
                              : 'Account signed out. Redirected to User Details.',
                        ),
                        backgroundColor: const Color(0xFF10B981),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Sign Out Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 0, 24, 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF8E9BAE),
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required Widget trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: const Color(0xFF0F172A),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF94A3B8),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}
