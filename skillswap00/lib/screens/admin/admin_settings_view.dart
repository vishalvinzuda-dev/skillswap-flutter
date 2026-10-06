import 'package:flutter/material.dart';
import 'admin_widgets.dart';
import '../auth/login_screen.dart';
import '../profile/edit_profile_screen.dart';

class AdminSettingsView extends StatefulWidget {
  final VoidCallback? onAvatarTap;

  const AdminSettingsView({super.key, this.onAvatarTap});

  @override
  State<AdminSettingsView> createState() => _AdminSettingsViewState();
}

class _AdminSettingsViewState extends State<AdminSettingsView> {
  String _adminEmail = 'john@skillswap.com';

  void _showEditEmailDialog() {
    final emailController = TextEditingController(text: _adminEmail);

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
                    'Email Address',
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
                'Admin Email Address',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.mail_outline_rounded, color: Color(0xFF94A3B8)),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    final newEmail = emailController.text.trim();
                    if (newEmail.isNotEmpty && newEmail.contains('@')) {
                      setState(() => _adminEmail = newEmail);
                      Navigator.pop(ctx);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Email address updated successfully'),
                          backgroundColor: Color(0xFF10B981),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF141927),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Save Email',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
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

  void _showChangePasswordDialog() {
    final currentPw = TextEditingController();
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
              const Text(
                'Current Password',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: currentPw,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '••••••••',
                  prefixIcon: const Icon(Icons.lock_outline_rounded, color: Color(0xFF94A3B8)),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'New Password',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: newPw,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Minimum 8 characters',
                  prefixIcon: const Icon(Icons.lock_outline_rounded, color: Color(0xFF94A3B8)),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Confirm Password',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: confirmPw,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Repeat new password',
                  prefixIcon: const Icon(Icons.lock_outline_rounded, color: Color(0xFF94A3B8)),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Update Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
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

  void _showHelpCenterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
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
                    'Help Center',
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
              _buildHelpItem(
                icon: Icons.question_answer_rounded,
                title: 'SkillSwap Guidelines',
                subtitle: 'Platform rules and swap agreement protocols',
              ),
              const SizedBox(height: 12),
              _buildHelpItem(
                icon: Icons.shield_rounded,
                title: 'Admin Moderation',
                subtitle: 'Resolving disputes and managing user strikes',
              ),
              const SizedBox(height: 12),
              _buildHelpItem(
                icon: Icons.support_agent_rounded,
                title: 'Technical Support',
                subtitle: 'Contact system engineering at support@skillswap.app',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHelpItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEDE9FE),
            ),
            child: Icon(icon, color: const Color(0xFF7C3AED), size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    fontSize: 12,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showAboutSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 42,
                height: 4.5,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 24),
              const SkillSwapLogo(size: 32),
              const SizedBox(height: 16),
              const Text(
                'SkillSwap Administrator Portal',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Version 2.4.0 (Build 342)',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF94A3B8),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFF1F5F9)),
                ),
                child: const Text(
                  'SkillSwap is a collaborative peer-learning platform empowering individuals to exchange knowledge, skills, and expertise.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF475569),
                    height: 1.45,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(ctx),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF0F172A),
                    side: const BorderSide(color: Color(0xFFE2E8F0)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text('Close', style: TextStyle(fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _confirmLogOut() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        title: const Text(
          'Log Out',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F172A),
          ),
        ),
        content: const Text(
          'Are you sure you want to log out from the SkillSwap Admin Panel?',
          style: TextStyle(color: Color(0xFF64748B)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF4444),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text(
              'Log Out',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar: Logo & Avatar
              AdminTopBar(onAvatarTap: widget.onAvatarTap),

              // Title: "Settings"
              const Padding(
                padding: EdgeInsets.fromLTRB(24, 6, 24, 16),
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.6,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ),

              // Header divider
              const Divider(
                height: 1,
                thickness: 1,
                color: Color(0xFFF1F5F9),
              ),

              // SECTION 1: ACCOUNT
              _buildSectionHeader('ACCOUNT'),

              // 1.1: Edit Profile
              _buildSettingsRow(
                leading: const AdminAvatar(size: 36),
                title: 'Edit Profile',
                trailing: const Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFF94A3B8),
                  size: 22,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EditProfileScreen(),
                    ),
                  );
                },
              ),

              _buildDivider(),

              // 1.2: Email Address
              _buildSettingsRow(
                leading: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF1F5F9),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.mail_rounded,
                      color: Color(0xFF0F172A),
                      size: 18,
                    ),
                  ),
                ),
                title: 'Email Address',
                trailing: Text(
                  _adminEmail,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF94A3B8),
                  ),
                ),
                onTap: _showEditEmailDialog,
              ),

              _buildDivider(),

              // 1.3: Change Password
              _buildSettingsRow(
                leading: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF1F5F9),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.lock_rounded,
                      color: Color(0xFF0F172A),
                      size: 18,
                    ),
                  ),
                ),
                title: 'Change Password',
                trailing: const Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFF94A3B8),
                  size: 22,
                ),
                onTap: _showChangePasswordDialog,
              ),

              // SECTION 2: SUPPORT
              _buildSectionHeader('SUPPORT', topPadding: 32),

              // 2.1: Help Center
              _buildSettingsRow(
                leading: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF1F5F9),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.help_rounded,
                      color: Color(0xFF0F172A),
                      size: 20,
                    ),
                  ),
                ),
                title: 'Help Center',
                trailing: const Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFF94A3B8),
                  size: 22,
                ),
                onTap: _showHelpCenterSheet,
              ),

              _buildDivider(),

              // 2.2: About SkillSwap
              _buildSettingsRow(
                leading: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF1F5F9),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.info_rounded,
                      color: Color(0xFF0F172A),
                      size: 20,
                    ),
                  ),
                ),
                title: 'About SkillSwap',
                trailing: const Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFF94A3B8),
                  size: 22,
                ),
                onTap: _showAboutSheet,
              ),

              _buildDivider(),

              // 2.3: Log Out
              _buildSettingsRow(
                leading: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFEE2E2),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.logout_rounded,
                      color: Color(0xFFEF4444),
                      size: 19,
                    ),
                  ),
                ),
                title: 'Log Out',
                titleColor: const Color(0xFFEF4444),
                trailing: const SizedBox.shrink(),
                onTap: _confirmLogOut,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, {double topPadding = 24}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, topPadding, 24, 12),
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

  Widget _buildSettingsRow({
    required Widget leading,
    required String title,
    Color titleColor = const Color(0xFF0F172A),
    required Widget trailing,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: Row(
          children: [
            leading,
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: titleColor,
                ),
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Divider(
        height: 1,
        thickness: 1,
        color: Color(0xFFF1F5F9),
      ),
    );
  }
}
