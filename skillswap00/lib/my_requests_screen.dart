import 'package:flutter/material.dart';
import 'session_details_screen.dart';
import 'send_request_screen.dart';
import 'incoming_request_screen.dart';

class RequestItem {
  final String id;
  final String name;
  final String timestamp;
  final String leftLabel;
  final String offerSkill;
  final String rightLabel;
  final String wantSkill;
  String status; // 'Pending', 'Accepted', 'Completed', 'Declined'
  final String? note;

  RequestItem({
    required this.id,
    required this.name,
    required this.timestamp,
    this.leftLabel = 'THEY OFFER',
    required this.offerSkill,
    this.rightLabel = 'THEY WANT',
    required this.wantSkill,
    required this.status,
    this.note,
  });
}

class OutgoingRequestItem {
  final String name;
  final String timestamp;
  final String offeredSkill;
  final String wantedSkill;
  final String status;
  final String note;

  OutgoingRequestItem({
    required this.name,
    required this.timestamp,
    required this.offeredSkill,
    required this.wantedSkill,
    this.status = 'Pending',
    this.note = '',
  });
}

class MyRequestsScreen extends StatefulWidget {
  final OutgoingRequestItem? newlySentRequest;
  final int initialTabIndex;

  const MyRequestsScreen({
    super.key,
    this.newlySentRequest,
    this.initialTabIndex = 0,
  });

  @override
  State<MyRequestsScreen> createState() => _MyRequestsScreenState();
}

class _MyRequestsScreenState extends State<MyRequestsScreen> {
  late int _selectedTab;

  final List<RequestItem> _incomingRequests = [
    RequestItem(
      id: 'req_1',
      name: 'Marcus Aurelius',
      timestamp: 'Sent Today, 10:15 AM',
      leftLabel: 'THEY OFFER',
      offerSkill: 'Stoic Philosophy',
      rightLabel: 'THEY WANT',
      wantSkill: 'UI/UX Design',
      status: 'Pending',
      note:
          'I would love to learn UI/UX prototyping from you in exchange for structured discussions on Stoic ethics and mental resilience.',
    ),
    RequestItem(
      id: 'req_2',
      name: 'Sarah Jenkins',
      timestamp: 'Yesterday, 4:20 PM',
      leftLabel: 'THEY OFFER',
      offerSkill: 'React Native',
      rightLabel: 'THEY WANT',
      wantSkill: 'User Research',
      status: 'Accepted',
      note:
          'Hey! Looking forward to diving into user research frameworks together. I can help you build cross-platform mobile apps in return.',
    ),
    RequestItem(
      id: 'req_3',
      name: 'Kenji Sato',
      timestamp: 'Oct 12, 2023',
      leftLabel: 'SWAP',
      offerSkill: 'Calligraphy',
      rightLabel: 'FOR',
      wantSkill: 'Typography',
      status: 'Completed',
      note:
          'Wonderful exchange completed! Thanks for the deep dive into typography anatomy.',
    ),
  ];

  late List<RequestItem> _outgoingRequests;

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialTabIndex;

    _outgoingRequests = [
      if (widget.newlySentRequest != null)
        RequestItem(
          id: 'req_new',
          name: widget.newlySentRequest!.name,
          timestamp: widget.newlySentRequest!.timestamp,
          leftLabel: 'YOU OFFER',
          offerSkill: widget.newlySentRequest!.offeredSkill,
          rightLabel: 'YOU WANT',
          wantSkill: widget.newlySentRequest!.wantedSkill,
          status: widget.newlySentRequest!.status,
          note: widget.newlySentRequest!.note,
        ),
      RequestItem(
        id: 'out_1',
        name: 'Alex Rivera',
        timestamp: 'Oct 14, 2023',
        leftLabel: 'YOU OFFER',
        offerSkill: 'UI/UX Design',
        rightLabel: 'YOU WANT',
        wantSkill: 'Motion Graphics',
        status: 'Accepted',
        note:
            'Hi Alex, I want to learn micro-interactions and motion curves in After Effects.',
      ),
      RequestItem(
        id: 'out_2',
        name: 'Elena Rostova',
        timestamp: 'Sep 28, 2023',
        leftLabel: 'YOU OFFER',
        offerSkill: 'Prototyping',
        rightLabel: 'YOU WANT',
        wantSkill: 'Russian Language',
        status: 'Completed',
        note: 'Completed 4 conversational sessions.',
      ),
    ];
  }

  void _handleAcceptRequest(RequestItem item) {
    setState(() {
      item.status = 'Accepted';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Accepted swap request from ${item.name}!'),
        backgroundColor: const Color(0xFF10B981),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _navigateToSchedule(RequestItem item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SessionDetailsScreen(
          participantName: item.name,
          title: '${item.offerSkill} & ${item.wantSkill} Swap',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentList =
        _selectedTab == 0 ? _incomingRequests : _outgoingRequests;

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
                    'My Requests',
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

            // Segmented Tab Selector (Incoming / Outgoing)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Container(
                height: 48,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF2F6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedTab = 0),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                            color: _selectedTab == 0
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: _selectedTab == 0
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.04),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Center(
                            child: Text(
                              'Incoming',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: _selectedTab == 0
                                    ? FontWeight.w700
                                    : FontWeight.w600,
                                color: _selectedTab == 0
                                    ? const Color(0xFF4F46E5)
                                    : const Color(0xFF64748B),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedTab = 1),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                            color: _selectedTab == 1
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: _selectedTab == 1
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.04),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Center(
                            child: Text(
                              'Outgoing',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: _selectedTab == 1
                                    ? FontWeight.w700
                                    : FontWeight.w600,
                                color: _selectedTab == 1
                                    ? const Color(0xFF4F46E5)
                                    : const Color(0xFF64748B),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Request Cards List
            Expanded(
              child: currentList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.inbox_outlined,
                            size: 56,
                            color: const Color(0xFFCBD5E1),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _selectedTab == 0
                                ? 'No incoming requests yet'
                                : 'No outgoing requests yet',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF64748B),
                            ),
                          ),
                          const SizedBox(height: 16),
                          if (_selectedTab == 1)
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const SendRequestScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4F46E5),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text('Send New Request'),
                            ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                      itemCount: currentList.length,
                      itemBuilder: (context, index) {
                        final item = currentList[index];
                        return _buildRequestCard(item);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestCard(RequestItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Avatar, Name & Timestamp, Status
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFDBEAFE),
                ),
                child: Center(
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF3B82F6),
                    ),
                    child: const Icon(
                      Icons.person_rounded,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF141A28),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      item.timestamp,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),
              _buildStatusBadge(item.status),
            ],
          ),

          // Inner Swap Info Box
          _buildSwapInfoBox(item),

          // Card Bottom Action
          _buildCardBottomAction(item),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color textColor;
    switch (status.toLowerCase()) {
      case 'pending':
        textColor = const Color(0xFFEF4444); // Red/Coral
        break;
      case 'accepted':
        textColor = const Color(0xFF10B981); // Green
        break;
      case 'completed':
        textColor = const Color(0xFF475569); // Slate Dark
        break;
      case 'declined':
        textColor = const Color(0xFF94A3B8); // Gray
        break;
      default:
        textColor = const Color(0xFF64748B);
    }

    return Text(
      status,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
    );
  }

  Widget _buildSwapInfoBox(RequestItem item) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          // Left Offer Skill
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.leftLabel,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF94A3B8),
                    letterSpacing: 0.6,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.offerSkill,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF141A28),
                  ),
                ),
              ],
            ),
          ),

          // Middle Swap Symbol (<>)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              '<>',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF94A3B8).withValues(alpha: 0.8),
                letterSpacing: -2,
              ),
            ),
          ),

          // Right Wanted Skill
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.rightLabel,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF94A3B8),
                    letterSpacing: 0.6,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.wantSkill,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF4F46E5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardBottomAction(RequestItem item) {
    if (item.status == 'Pending') {
      return Row(
        children: [
          // Accept Button
          Expanded(
            child: SizedBox(
              height: 44,
              child: ElevatedButton(
                onPressed: () => _handleAcceptRequest(item),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F46E5),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Accept',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // View Details Button
          Expanded(
            child: SizedBox(
              height: 44,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => IncomingRequestScreen(
                        senderName: item.name,
                        senderOffering: item.offerSkill,
                        requestedSkill: item.wantSkill,
                        personalNote: item.note ??
                            "Greetings Alex! I've been following your UI/UX case studies and I'm really impressed by your approach to architecture. I'd love to swap some Stoic wisdom for some design feedback on my latest project. Looking forward to connecting!",
                        timestamp: item.timestamp,
                      ),
                    ),
                  ).then((result) {
                    if (result == 'declined') {
                      setState(() {
                        item.status = 'Declined';
                      });
                    }
                  });
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF141A28),
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                    color: Color(0xFFE2E8F0),
                    width: 1.2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'View Details',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    } else if (item.status == 'Accepted') {
      return SizedBox(
        width: double.infinity,
        height: 44,
        child: ElevatedButton(
          onPressed: () => _navigateToSchedule(item),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFEEF2FF),
            foregroundColor: const Color(0xFF4F46E5),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Schedule Session',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    } else if (item.status == 'Completed') {
      return Row(
        children: const [
          Icon(
            Icons.check_circle_rounded,
            color: Color(0xFF10B981),
            size: 16,
          ),
          SizedBox(width: 8),
          Text(
            'Exchange successful',
            style: TextStyle(
              color: Color(0xFF10B981),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    } else {
      // Declined or Cancelled
      return Text(
        'Request ${item.status.toLowerCase()}',
        style: const TextStyle(
          color: Color(0xFF94A3B8),
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      );
    }
  }
}
