import 'package:flutter/material.dart';
import 'admin_widgets.dart';

class AdminSkillsView extends StatefulWidget {
  final VoidCallback? onAvatarTap;

  const AdminSkillsView({super.key, this.onAvatarTap});

  @override
  State<AdminSkillsView> createState() => _AdminSkillsViewState();
}

class _AdminSkillsViewState extends State<AdminSkillsView> {
  String _selectedTab = 'Pending';

  final List<Map<String, dynamic>> _skills = [
    {
      'id': '1',
      'skill': 'React Advanced Patterns',
      'category': 'Programming & Tech',
      'mentor': 'Sarah M.',
      'mentorEmail': 'sarah.m@dev.io',
      'experience': '5+ Years',
      'portfolio': 'github.com/sarahm',
      'submitted': '15m ago',
      'status': 'Pending',
      'description': 'React Server Components, Redux Toolkit, Custom Hooks & Testing',
    },
    {
      'id': '2',
      'skill': 'Flutter & Dart Mastery',
      'category': 'Mobile Development',
      'mentor': 'David Kim',
      'mentorEmail': 'david.k@flutter.dev',
      'experience': '4 Years',
      'portfolio': 'portfolio.davidkim.design',
      'submitted': '2h ago',
      'status': 'Pending',
      'description': 'Clean Architecture, Riverpod, Bloc, Custom Painters & Animations',
    },
    {
      'id': '3',
      'skill': 'Figma Design Systems',
      'category': 'Design & Creative',
      'mentor': 'Jessica Lee',
      'mentorEmail': 'jessica@uiux.co',
      'experience': '6 Years',
      'portfolio': 'behance.net/jesslee',
      'submitted': '4h ago',
      'status': 'Pending',
      'description': 'Auto-layout, Tokens, Variables, Component Libraries & Hand-off',
    },
    {
      'id': '4',
      'skill': 'Python for Data Science',
      'category': 'Data Science & AI',
      'mentor': 'Carlos Rivera',
      'mentorEmail': 'carlos@datasci.org',
      'experience': '3 Years',
      'portfolio': 'kaggle.com/carlosr',
      'submitted': '1d ago',
      'status': 'Approved',
      'description': 'Pandas, NumPy, Matplotlib, Scikit-Learn & Jupyter workflows',
    },
    {
      'id': '5',
      'skill': 'Conversational Spanish',
      'category': 'Languages',
      'mentor': 'Elena Rostova',
      'mentorEmail': 'elena.r@language.com',
      'experience': 'Native Speaker',
      'portfolio': 'DELE C2 Certified',
      'submitted': '2d ago',
      'status': 'Approved',
      'description': 'Fluency, Accent reduction, Grammar & Cultural immersion',
    },
    {
      'id': '6',
      'skill': 'Crypto Trading Secrets',
      'category': 'Business & Finance',
      'mentor': 'Anonymous X',
      'mentorEmail': 'anon@web3.eth',
      'experience': 'Unknown',
      'portfolio': 'None provided',
      'submitted': '3d ago',
      'status': 'Rejected',
      'description': 'Get rich quick crypto signals and speculative pump strategies',
    },
  ];

  void _approveSkill(Map<String, dynamic> item) {
    setState(() {
      item['status'] = 'Approved';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Skill '${item['skill']}' approved for ${item['mentor']}!"),
        backgroundColor: const Color(0xFF10B981),
      ),
    );
  }

  void _rejectSkill(Map<String, dynamic> item) {
    setState(() {
      item['status'] = 'Rejected';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Skill '${item['skill']}' rejected."),
        backgroundColor: const Color(0xFFEF4444),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _skills.where((s) => s['status'] == _selectedTab).toList();
    final pendingCount = _skills.where((s) => s['status'] == 'Pending').length;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AdminTopBar(onAvatarTap: widget.onAvatarTap),

          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Skill Approvals',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF141A28),
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$pendingCount skills pending manual review',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF64748B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Tab Selector
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                _buildTabItem('Pending', 'Pending ($pendingCount)'),
                _buildTabItem('Approved', 'Approved'),
                _buildTabItem('Rejected', 'Rejected'),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Skills List
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.verified_outlined,
                          size: 56,
                          color: const Color(0xFF94A3B8).withValues(alpha: 0.5),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'No $_selectedTab skills found',
                          style: const TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
                    itemCount: filtered.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 14),
                    itemBuilder: (context, index) {
                      final item = filtered[index];
                      final isPending = item['status'] == 'Pending';

                      return Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: const Color(0xFFF1F5F9),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF64748B).withValues(alpha: 0.04),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['skill'] as String,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF0F172A),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF7555F6).withValues(alpha: 0.1),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          item['category'] as String,
                                          style: const TextStyle(
                                            color: Color(0xFF7555F6),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  item['submitted'] as String,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF94A3B8),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),
                            Text(
                              item['description'] as String,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFF475569),
                                height: 1.35,
                              ),
                            ),

                            const SizedBox(height: 14),

                            // Mentor info card
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8FAFC),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 16,
                                    backgroundColor: const Color(0xFF0F172A),
                                    child: Text(
                                      (item['mentor'] as String).substring(0, 1),
                                      style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['mentor'] as String,
                                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF0F172A)),
                                        ),
                                        Text(
                                          'Exp: ${item['experience']} • ${item['portfolio']}',
                                          style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            if (isPending) ...[
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: () => _rejectSkill(item),
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: const Color(0xFFEF4444),
                                        side: const BorderSide(color: Color(0xFFFCA5A5)),
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                      ),
                                      child: const Text('Reject', style: TextStyle(fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () => _approveSkill(item),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF10B981),
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                      ),
                                      child: const Text('Approve', style: TextStyle(fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String key, String title) {
    final isSelected = _selectedTab == key;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = key),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected ? const Color(0xFF0F172A) : const Color(0xFF64748B),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
