import 'package:flutter/material.dart';
import 'my_requests_screen.dart';

class SkillOption {
  final String id;
  final String title;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;

  const SkillOption({
    required this.id,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
  });
}

class SendRequestScreen extends StatefulWidget {
  final String recipientName;
  final String offeringSkill;
  final String avatarUrl;

  const SendRequestScreen({
    super.key,
    this.recipientName = 'Marcus Aurelius',
    this.offeringSkill = 'STOIC PHILOSOPHY',
    this.avatarUrl = '',
  });

  @override
  State<SendRequestScreen> createState() => _SendRequestScreenState();
}

class _SendRequestScreenState extends State<SendRequestScreen> {
  final TextEditingController _noteController = TextEditingController();
  String _selectedSkillId = 'ui_ux';

  final List<SkillOption> _skills = const [
    SkillOption(
      id: 'ui_ux',
      title: 'UI/UX Design',
      icon: Icons.code_rounded,
      iconColor: Color(0xFF4F46E5),
      iconBgColor: Color(0xFFEEF2FF),
    ),
    SkillOption(
      id: 'python',
      title: 'Python Programming',
      icon: Icons.terminal_rounded,
      iconColor: Color(0xFF06B6D4),
      iconBgColor: Color(0xFFECFEFF),
    ),
    SkillOption(
      id: 'spanish',
      title: 'Spanish Conversation',
      icon: Icons.translate_rounded,
      iconColor: Color(0xFFEF4444),
      iconBgColor: Color(0xFFFEE2E2),
    ),
  ];

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _handleSendRequest() {
    final selectedSkill = _skills.firstWhere(
      (s) => s.id == _selectedSkillId,
      orElse: () => _skills.first,
    );

    // Provide visual feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Request sent to ${widget.recipientName} for ${selectedSkill.title}!',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF4F46E5),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
      ),
    );

    // Navigate to MyRequestsScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => MyRequestsScreen(
          newlySentRequest: OutgoingRequestItem(
            name: widget.recipientName,
            timestamp: 'Just now',
            offeredSkill: selectedSkill.title,
            wantedSkill: widget.offeringSkill,
            status: 'Pending',
            note: _noteController.text.trim().isNotEmpty
                ? _noteController.text.trim()
                : "Explain why you'd like to swap skills and what your goals are...",
          ),
          initialTabIndex: 1, // Focus on Outgoing tab to see the sent request
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Navigation Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFFE2E8F0),
                          width: 1.2,
                        ),
                      ),
                      child: const Icon(
                        Icons.chevron_left_rounded,
                        color: Color(0xFF141A28),
                        size: 24,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Send Request',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF141A28),
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Recipient User Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFE2E8F0),
                          width: 1.2,
                        ),
                      ),
                      child: Row(
                        children: [
                          // Blue Profile Avatar matching the design
                          Container(
                            width: 58,
                            height: 58,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFDBEAFE),
                            ),
                            child: Center(
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF3B82F6),
                                ),
                                child: const Icon(
                                  Icons.person_rounded,
                                  color: Colors.white,
                                  size: 34,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.recipientName,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF141A28),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    const Text(
                                      'Offering:  ',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF94A3B8),
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFEEF2FF),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          widget.offeringSkill.toUpperCase(),
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Color(0xFF4F46E5),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w800,
                                            letterSpacing: 0.6,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Section Title: Select your skill to swap
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Select your skill to swap',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF141A28),
                          ),
                        ),
                        const Text(
                          'Choose one',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // Skill Options List
                    ..._skills.map((skill) {
                      final bool isSelected = _selectedSkillId == skill.id;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedSkillId = skill.id;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFF8F7FF)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF4F46E5)
                                    : const Color(0xFFE2E8F0),
                                width: isSelected ? 2 : 1.2,
                              ),
                            ),
                            child: Row(
                              children: [
                                // Skill Icon Container
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: skill.iconBgColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    skill.icon,
                                    color: skill.iconColor,
                                    size: 22,
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Text(
                                    skill.title,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF141A28),
                                    ),
                                  ),
                                ),
                                // Selection Radio
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isSelected
                                        ? const Color(0xFF4F46E5)
                                        : Colors.transparent,
                                    border: isSelected
                                        ? null
                                        : Border.all(
                                            color: const Color(0xFFCBD5E1),
                                            width: 1.8,
                                          ),
                                  ),
                                  child: isSelected
                                      ? const Icon(
                                          Icons.check_rounded,
                                          color: Colors.white,
                                          size: 16,
                                        )
                                      : null,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),

                    const SizedBox(height: 20),

                    // Section Title: Personal Note
                    const Text(
                      'Personal Note',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF141A28),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Personal Note Input Box
                    Container(
                      height: 140,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: const Color(0xFFE2E8F0),
                          width: 1.2,
                        ),
                      ),
                      child: TextField(
                        controller: _noteController,
                        maxLines: 5,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF141A28),
                          height: 1.4,
                        ),
                        decoration: const InputDecoration(
                          hintText:
                              "Explain why you'd like to swap skills and what your goals are...",
                          hintStyle: TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 14,
                            height: 1.4,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),

            // Bottom Sticky Button
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _handleSendRequest,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F46E5),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shadowColor: const Color(0xFF4F46E5).withValues(alpha: 0.35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Send Request',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.2,
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
}
