import 'package:flutter/material.dart';
import 'admin_widgets.dart';

class SkillRequestData {
  final String id;
  final String categoryTag;
  final Color tagBgColor;
  final Color tagTextColor;
  final String title;
  final String shortDescription;
  final String fullDescription;
  final String requesterName;
  final String timeAgo;
  final String category;
  final String level;
  final String sessions;
  String status;

  SkillRequestData({
    required this.id,
    required this.categoryTag,
    required this.tagBgColor,
    required this.tagTextColor,
    required this.title,
    required this.shortDescription,
    required this.fullDescription,
    required this.requesterName,
    required this.timeAgo,
    required this.category,
    required this.level,
    required this.sessions,
    required this.status,
  });
}

class AdminSkillsView extends StatefulWidget {
  final VoidCallback? onAvatarTap;

  const AdminSkillsView({super.key, this.onAvatarTap});

  @override
  State<AdminSkillsView> createState() => _AdminSkillsViewState();
}

class _AdminSkillsViewState extends State<AdminSkillsView> {
  String _selectedTab = 'Pending';

  final List<SkillRequestData> _requests = [
    SkillRequestData(
      id: '1',
      categoryTag: 'AI & TECH',
      tagBgColor: const Color(0xFFE0F7FA),
      tagTextColor: const Color(0xFF00BCD4),
      title: 'Advanced Prompt Engineering',
      shortDescription:
          'Comprehensive techniques for LLM optimization including chain-of-thought,...',
      fullDescription:
          'Comprehensive techniques for LLM optimization including chain-of-thought, retrieval-augmented generation (RAG), few-shot prompting, and evaluation frameworks for enterprise applications.',
      requesterName: 'Alex M.',
      timeAgo: '2 hours ago',
      category: 'Artificial Intelligence & NLP',
      level: 'Advanced',
      sessions: '4 Sessions • 1 hr each',
      status: 'Pending',
    ),
    SkillRequestData(
      id: '2',
      categoryTag: 'DESIGN',
      tagBgColor: const Color(0xFFEDE9FE),
      tagTextColor: const Color(0xFF7C3AED),
      title: 'Motion Principles in UX',
      shortDescription:
          'Teaching the fundamental laws of animation applied to digital interfaces to...',
      fullDescription:
          'Teaching the fundamental laws of animation applied to digital interfaces to enhance usability, provide feedback, and create polished micro-interactions in mobile and web apps.',
      requesterName: 'Sarah J.',
      timeAgo: '5 hours ago',
      category: 'UI/UX & Product Design',
      level: 'Intermediate',
      sessions: '3 Sessions • 45 mins each',
      status: 'Pending',
    ),
    SkillRequestData(
      id: '3',
      categoryTag: 'BUSINESS',
      tagBgColor: const Color(0xFFFEF3C7),
      tagTextColor: const Color(0xFFD97706),
      title: 'Ethical Negotiation',
      shortDescription:
          'Focusing on win-win scenarios and long-term relationship building in professional...',
      fullDescription:
          'Focusing on win-win scenarios and long-term relationship building in professional contracts, salary discussions, and cross-team partnerships.',
      requesterName: 'David C.',
      timeAgo: 'Yesterday',
      category: 'Business & Leadership',
      level: 'All Levels',
      sessions: '2 Sessions • 1.5 hrs each',
      status: 'Pending',
    ),
    SkillRequestData(
      id: '4',
      categoryTag: 'AI & TECH',
      tagBgColor: const Color(0xFFE0F7FA),
      tagTextColor: const Color(0xFF00BCD4),
      title: 'Full-Stack GraphQL APIs',
      shortDescription:
          'Building performant GraphQL microservices with Apollo Server and schema federation...',
      fullDescription:
          'Building performant GraphQL microservices with Apollo Server, schema federation, rate limiting, and real-time WebSocket subscriptions.',
      requesterName: 'Carlos Rivera',
      timeAgo: '2 days ago',
      category: 'Cloud & Tech',
      level: 'Advanced',
      sessions: '5 Sessions • 1 hr each',
      status: 'Approved',
    ),
    SkillRequestData(
      id: '5',
      categoryTag: 'DESIGN',
      tagBgColor: const Color(0xFFEDE9FE),
      tagTextColor: const Color(0xFF7C3AED),
      title: 'Design Systems with Figma Tokens',
      shortDescription:
          'Implementing multi-brand design tokens, sync with GitHub, and component governance...',
      fullDescription:
          'Implementing multi-brand design tokens, sync with GitHub, and component governance for large cross-functional teams.',
      requesterName: 'Jessica Lee',
      timeAgo: '3 days ago',
      category: 'UI/UX Design',
      level: 'Intermediate',
      sessions: '3 Sessions • 1 hr each',
      status: 'Approved',
    ),
    SkillRequestData(
      id: '6',
      categoryTag: 'BUSINESS',
      tagBgColor: const Color(0xFFFEF3C7),
      tagTextColor: const Color(0xFFD97706),
      title: 'High-Frequency Crypto Arbitrage',
      shortDescription:
          'Automated pump trading bots and unregulated speculative schemes violating rules...',
      fullDescription:
          'High-risk speculative financial schemes that do not meet platform community and safety guidelines.',
      requesterName: 'Anonymous Trader',
      timeAgo: '4 days ago',
      category: 'Finance',
      level: 'Unspecified',
      sessions: '1 Session • 30 mins',
      status: 'Rejected',
    ),
  ];

  void _approveRequest(SkillRequestData item) {
    final previousStatus = item.status;
    setState(() {
      item.status = 'Approved';
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Skill '${item.title}' approved successfully!"),
        backgroundColor: const Color(0xFF14B8A6),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        action: SnackBarAction(
          label: 'UNDO',
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              item.status = previousStatus;
            });
          },
        ),
      ),
    );
  }

  void _rejectRequest(SkillRequestData item) {
    final previousStatus = item.status;
    setState(() {
      item.status = 'Rejected';
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Skill '${item.title}' rejected."),
        backgroundColor: const Color(0xFFEF4444),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        action: SnackBarAction(
          label: 'UNDO',
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              item.status = previousStatus;
            });
          },
        ),
      ),
    );
  }

  void _restoreToPending(SkillRequestData item) {
    setState(() {
      item.status = 'Pending';
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Skill '${item.title}' moved back to Pending."),
        backgroundColor: const Color(0xFF6366F1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _showRequestDetailsModal(SkillRequestData item) {
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
            top: 14,
            bottom: MediaQuery.of(ctx).padding.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag handle
              Center(
                child: Container(
                  width: 44,
                  height: 4.5,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Badge & Status row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: item.tagBgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item.categoryTag,
                      style: TextStyle(
                        color: item.tagTextColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: item.status == 'Approved'
                          ? const Color(0xFFDCFCE7)
                          : item.status == 'Rejected'
                              ? const Color(0xFFFFE4E6)
                              : const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      item.status,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: item.status == 'Approved'
                            ? const Color(0xFF16A34A)
                            : item.status == 'Rejected'
                                ? const Color(0xFFE11D48)
                                : const Color(0xFF64748B),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Title
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 14),

              // Requester row
              Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF3B82F6),
                    ),
                    child: const Icon(
                      Icons.person_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Requested by ${item.requesterName}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      Text(
                        item.timeAgo,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Description
              const Text(
                'Full Proposal Details',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item.fullDescription,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 16),

              // Extra specs
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFF1F5F9)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildSpecItem('Category', item.category),
                    _buildSpecDivider(),
                    _buildSpecItem('Level', item.level),
                    _buildSpecDivider(),
                    _buildSpecItem('Sessions', item.sessions.split('•').first.trim()),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Action buttons inside sheet
              if (item.status == 'Pending') ...[
                Row(
                  children: [
                    Expanded(
                      child: Material(
                        color: const Color(0xFF17C2D8),
                        borderRadius: BorderRadius.circular(16),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(ctx);
                            _approveRequest(item);
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: const SizedBox(
                            height: 48,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.check_rounded, color: Colors.white, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Approve',
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
                    const SizedBox(width: 12),
                    Expanded(
                      child: Material(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(16),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(ctx);
                            _rejectRequest(item);
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: const SizedBox(
                            height: 48,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.close_rounded, color: Color(0xFF475569), size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Reject',
                                  style: TextStyle(
                                    color: Color(0xFF475569),
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
              ] else ...[
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pop(ctx);
                      _restoreToPending(item);
                    },
                    icon: const Icon(Icons.undo_rounded, size: 18),
                    label: const Text('Move Back to Pending'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF6C5CE7),
                      side: const BorderSide(color: Color(0xFFCBD5E1)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildSpecItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF94A3B8),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12.5,
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildSpecDivider() {
    return Container(
      width: 1,
      height: 28,
      color: const Color(0xFFE2E8F0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredRequests =
        _requests.where((r) => r.status == _selectedTab).toList();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Admin Top Bar matching master page design
          AdminTopBar(onAvatarTap: widget.onAvatarTap),

          // Title: "Skill Requests"
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 6, 24, 16),
            child: Text(
              'Skill Requests',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0F172A),
                letterSpacing: -0.6,
              ),
            ),
          ),

          // Tabs: Pending / Approved / Rejected
          _buildTabBar(),

          // Divider below tabs
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFF1F5F9),
          ),

          // List of Cards
          Expanded(
            child: filteredRequests.isEmpty
                ? _buildEmptyState()
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
                    itemCount: filteredRequests.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return _buildRequestCard(filteredRequests[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTabItem('Pending'),
          _buildTabItem('Approved'),
          _buildTabItem('Rejected'),
        ],
      ),
    );
  }

  Widget _buildTabItem(String tabName) {
    final isSelected = _selectedTab == tabName;
    final activeColor = const Color(0xFF6C5CE7);
    final inactiveColor = const Color(0xFF8E9BAE);

    return InkWell(
      onTap: () => setState(() => _selectedTab = tabName),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              tabName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                color: isSelected ? activeColor : inactiveColor,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 3.5,
              width: 58,
              decoration: BoxDecoration(
                color: isSelected ? activeColor : Colors.transparent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestCard(SkillRequestData item) {
    final isPending = item.status == 'Pending';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: const Color(0xFFF1F5F9),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.035),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Category Tag on left, Circle Chevron on right
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: item.tagBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  item.categoryTag,
                  style: TextStyle(
                    color: item.tagTextColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
              InkWell(
                onTap: () => _showRequestDetailsModal(item),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF8FAFC),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.chevron_right_rounded,
                      size: 20,
                      color: Color(0xFFCBD5E1),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Skill Title
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0F172A),
              letterSpacing: -0.3,
            ),
          ),

          const SizedBox(height: 6),

          // Short Description
          Text(
            item.shortDescription,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.4,
              color: Color(0xFF64748B),
              fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 14),

          // Requester Info Row
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF3B82F6),
                ),
                child: const Center(
                  child: Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Requested by ${item.requesterName}',
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    item.timeAgo,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Action Buttons Row
          if (isPending) ...[
            Row(
              children: [
                // Approve Button (Cyan)
                Expanded(
                  child: Material(
                    color: const Color(0xFF17C2D8),
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      onTap: () => _approveRequest(item),
                      borderRadius: BorderRadius.circular(16),
                      child: const SizedBox(
                        height: 46,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: Colors.white,
                              size: 19,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Approve',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Reject Button (Light Grey)
                Expanded(
                  child: Material(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      onTap: () => _rejectRequest(item),
                      borderRadius: BorderRadius.circular(16),
                      child: const SizedBox(
                        height: 46,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.close_rounded,
                              color: Color(0xFF475569),
                              size: 19,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Reject',
                              style: TextStyle(
                                color: Color(0xFF475569),
                                fontSize: 14,
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
          ] else if (item.status == 'Approved') ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCFCE7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle_rounded,
                        color: Color(0xFF16A34A),
                        size: 16,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Approved',
                        style: TextStyle(
                          color: Color(0xFF16A34A),
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton.icon(
                  onPressed: () => _restoreToPending(item),
                  icon: const Icon(Icons.undo_rounded, size: 16),
                  label: const Text('Move to Pending'),
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ] else ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFE4E6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.cancel_rounded,
                        color: Color(0xFFE11D48),
                        size: 16,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Rejected',
                        style: TextStyle(
                          color: Color(0xFFE11D48),
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton.icon(
                  onPressed: () => _restoreToPending(item),
                  icon: const Icon(Icons.refresh_rounded, size: 16),
                  label: const Text('Restore Request'),
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF6C5CE7),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_outline_rounded,
                size: 40,
                color: Color(0xFF94A3B8),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'No $_selectedTab Requests',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'There are no skill requests in the $_selectedTab queue.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
