import 'package:flutter/material.dart';

class AdminActivityLogScreen extends StatefulWidget {
  const AdminActivityLogScreen({super.key});

  @override
  State<AdminActivityLogScreen> createState() => _AdminActivityLogScreenState();
}

class _AdminActivityLogScreenState extends State<AdminActivityLogScreen> {
  String _selectedFilter = 'All';

  final List<Map<String, dynamic>> _activities = [
    {
      'type': 'user',
      'icon': Icons.person_add_rounded,
      'color': Color(0xFFDCFCE7),
      'title': 'New user registered',
      'subtitle': 'Alex Johnson joined the platform',
      'time': '2m ago',
      'details': 'Registered via Google OAuth from San Francisco, CA',
    },
    {
      'type': 'skill',
      'icon': Icons.verified_rounded,
      'color': Color(0xFFE0F2FE),
      'title': "Skill 'React' approved",
      'subtitle': 'Verified for mentor Sarah M.',
      'time': '15m ago',
      'details': '5 years experience, portfolio verified at github.com/sarahm',
    },
    {
      'type': 'swap',
      'icon': Icons.handshake_rounded,
      'color': Color(0xFFF3E8FF),
      'title': 'Swap completed',
      'subtitle': 'UI Design for Python Basics',
      'time': '1h ago',
      'details': 'Between Michael Chang and Emily Watson (5★ rating given)',
    },
    {
      'type': 'skill',
      'icon': Icons.verified_rounded,
      'color': Color(0xFFE0F2FE),
      'title': "Skill 'Flutter & Dart' approved",
      'subtitle': 'Verified for mentor David K.',
      'time': '2h ago',
      'details': 'Senior Mobile Dev, verified through GitHub repository portfolio',
    },
    {
      'type': 'user',
      'icon': Icons.person_add_rounded,
      'color': Color(0xFFDCFCE7),
      'title': 'New mentor application',
      'subtitle': 'Carlos Rivera applied for Data Science mentor',
      'time': '3h ago',
      'details': 'Submitted 3 published papers and Coursera certificate',
    },
    {
      'type': 'system',
      'icon': Icons.settings_suggest_rounded,
      'color': Color(0xFFFEF3C7),
      'title': 'Maintenance window scheduled',
      'subtitle': 'System maintenance set for Sunday 02:00 AM UTC',
      'time': '5h ago',
      'details': 'Automated database indexing and cache warmup scheduled',
    },
    {
      'type': 'swap',
      'icon': Icons.handshake_rounded,
      'color': Color(0xFFF3E8FF),
      'title': 'Swap requested',
      'subtitle': 'Figma Prototyping for Spanish Conversation',
      'time': '6h ago',
      'details': 'Request pending mentor confirmation',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredList = _selectedFilter == 'All'
        ? _activities
        : _activities.where((a) {
            if (_selectedFilter == 'Users') return a['type'] == 'user';
            if (_selectedFilter == 'Skills') return a['type'] == 'skill';
            if (_selectedFilter == 'Swaps') return a['type'] == 'swap';
            if (_selectedFilter == 'System') return a['type'] == 'system';
            return true;
          }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF0F172A), size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Activity History',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: const Color(0xFFF1F5F9), height: 1),
        ),
      ),
      body: Column(
        children: [
          // Filter Row
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['All', 'Users', 'Skills', 'Swaps', 'System'].map((filter) {
                  final isSelected = _selectedFilter == filter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(filter),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) setState(() => _selectedFilter = filter);
                      },
                      selectedColor: const Color(0xFF7555F6),
                      backgroundColor: const Color(0xFFF8FAFC),
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : const Color(0xFF64748B),
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: isSelected ? Colors.transparent : const Color(0xFFE2E8F0),
                        ),
                      ),
                      showCheckmark: false,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Activity list
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: filteredList.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = filteredList[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: item['color'] as Color,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              item['icon'] as IconData,
                              size: 20,
                              color: const Color(0xFF0F172A),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title'] as String,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Color(0xFF0F172A),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  item['subtitle'] as String,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            item['time'] as String,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF94A3B8),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      if (item['details'] != null) ...[
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            item['details'] as String,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF475569),
                              height: 1.4,
                            ),
                          ),
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
}
