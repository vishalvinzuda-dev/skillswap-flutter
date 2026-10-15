import 'package:flutter/material.dart';
import 'session_details_screen.dart';
import 'meeting_screen.dart';
import '../mentors/find_mentor_screen.dart';

class ScheduleDayItem {
  final String dayName;
  final String dayNumber;
  final DateTime date;
  final bool isSelected;
  final bool hasEvents;

  const ScheduleDayItem({
    required this.dayName,
    required this.dayNumber,
    required this.date,
    this.isSelected = false,
    this.hasEvents = false,
  });
}

class ScheduleEventItem {
  final String id;
  final String time;
  final String timeRange;
  final String title;
  final String subtitle;
  final String duration;
  final String? location;
  final bool isHighlightCard;
  final bool isBlueAvatar;
  final String participantName;
  final String participantRole;
  final DateTime date;
  final String status;

  const ScheduleEventItem({
    required this.id,
    required this.time,
    required this.timeRange,
    required this.title,
    required this.subtitle,
    required this.duration,
    this.location,
    this.isHighlightCard = false,
    this.isBlueAvatar = false,
    required this.participantName,
    required this.participantRole,
    required this.date,
    this.status = 'Confirmed',
  });
}

class ScheduleScreen extends StatefulWidget {
  final bool showBackButton;

  const ScheduleScreen({
    super.key,
    this.showBackButton = true,
  });

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late DateTime _selectedDate;

  static const List<String> _monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  static const List<String> _monthShort = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC',
  ];

  static const List<String> _weekdayShort = [
    'MON',
    'TUE',
    'WED',
    'THU',
    'FRI',
    'SA',
    'SU',
  ];

  late final List<ScheduleEventItem> _allEvents;

  @override
  void initState() {
    super.initState();
    // Default to September 14, 2024 to match Home screen's Branding Workshop session
    _selectedDate = DateTime(2024, 9, 14);

    _allEvents = [
      ScheduleEventItem(
        id: '1',
        time: '10:00 AM',
        timeRange: '10:00 AM - 11:30 AM',
        title: 'UI Design Workshop',
        subtitle: 'with Elena G.',
        duration: '90 min',
        location: 'Zoom',
        isHighlightCard: true,
        isBlueAvatar: false,
        participantName: 'Elena G.',
        participantRole: 'Senior UI/UX Designer',
        date: DateTime(2024, 9, 12),
        status: 'Confirmed',
      ),
      ScheduleEventItem(
        id: '2',
        time: '10:00 AM',
        timeRange: '10:00 AM - 11:30 AM',
        title: 'Branding Workshop',
        subtitle: 'with Sarah Jenkins',
        duration: '90 min',
        location: 'Zoom',
        isHighlightCard: true,
        isBlueAvatar: true,
        participantName: 'Sarah Jenkins',
        participantRole: 'Senior Brand & Visual Designer',
        date: DateTime(2024, 9, 14),
        status: 'Confirmed',
      ),
      ScheduleEventItem(
        id: '3',
        time: '02:00 PM',
        timeRange: '02:00 PM - 03:30 PM',
        title: 'Advanced Python API Workshop',
        subtitle: 'with David Kim',
        duration: '90 min',
        location: 'Google Meet',
        isHighlightCard: false,
        isBlueAvatar: false,
        participantName: 'David Kim',
        participantRole: 'Senior Python Engineer',
        date: DateTime(2024, 9, 15),
        status: 'Confirmed',
      ),
      ScheduleEventItem(
        id: '4',
        time: '04:00 PM',
        timeRange: '04:00 PM - 05:00 PM',
        title: 'French Conversation Practice',
        subtitle: 'with Marcus T.',
        duration: '60 min',
        location: 'Zoom',
        isHighlightCard: false,
        isBlueAvatar: false,
        participantName: 'Marcus T.',
        participantRole: 'Language Mentor',
        date: DateTime(2024, 9, 15),
        status: 'Confirmed',
      ),
      ScheduleEventItem(
        id: '5',
        time: '11:30 AM',
        timeRange: '11:30 AM - 12:30 PM',
        title: 'UI/UX Wireframing & Feedback',
        subtitle: 'with Marcus Sterling',
        duration: '60 min',
        location: 'Local Cafe',
        isHighlightCard: false,
        isBlueAvatar: false,
        participantName: 'Marcus Sterling',
        participantRole: 'Lead Visual Designer',
        date: DateTime(2024, 9, 16),
        status: 'Confirmed',
      ),
      ScheduleEventItem(
        id: '6',
        time: '05:00 PM',
        timeRange: '05:00 PM - 06:30 PM',
        title: 'Guitar Practice & Theory',
        subtitle: 'with James Wilson',
        duration: '90 min',
        location: 'Music Studio',
        isHighlightCard: false,
        isBlueAvatar: false,
        participantName: 'James Wilson',
        participantRole: 'Musician & Guitarist',
        date: DateTime(2024, 9, 17),
        status: 'Confirmed',
      ),
      ScheduleEventItem(
        id: '7',
        time: '11:00 AM',
        timeRange: '11:00 AM - 12:30 PM',
        title: 'Mobile App Architecture',
        subtitle: 'with Alex Rivera',
        duration: '90 min',
        location: 'Zoom',
        isHighlightCard: true,
        isBlueAvatar: true,
        participantName: 'Alex Rivera',
        participantRole: 'Lead Flutter Developer',
        date: DateTime(2024, 9, 19),
        status: 'Confirmed',
      ),
      ScheduleEventItem(
        id: '8',
        time: '02:00 PM',
        timeRange: '02:00 PM - 03:30 PM',
        title: 'UI Design Mentorship & Portfolio Review',
        subtitle: 'with Marcus Sterling',
        duration: '90 min',
        location: 'Google Meet',
        isHighlightCard: false,
        isBlueAvatar: false,
        participantName: 'Marcus Sterling',
        participantRole: 'Expert UI/UX Designer',
        date: DateTime(2024, 9, 24),
        status: 'Confirmed',
      ),
      ScheduleEventItem(
        id: '9',
        time: '04:00 PM',
        timeRange: '04:00 PM - 05:30 PM',
        title: 'Python Basics & Machine Learning',
        subtitle: 'with Dr. Sophia Wang',
        duration: '90 min',
        location: 'Zoom',
        isHighlightCard: false,
        isBlueAvatar: false,
        participantName: 'Dr. Sophia Wang',
        participantRole: 'AI & Data Scientist',
        date: DateTime(2024, 9, 28),
        status: 'Confirmed',
      ),
    ];
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _hasEventOn(DateTime date) {
    return _allEvents.any((e) => _isSameDay(e.date, date));
  }

  List<ScheduleEventItem> get _selectedDayEvents {
    final list = _allEvents.where((e) => _isSameDay(e.date, _selectedDate)).toList();
    list.sort((a, b) => a.time.compareTo(b.time));
    return list;
  }

  DateTime get _weekStart {
    return _selectedDate.subtract(Duration(days: _selectedDate.weekday - 1));
  }

  void _previousWeek() {
    setState(() {
      _selectedDate = _selectedDate.subtract(const Duration(days: 7));
    });
  }

  void _nextWeek() {
    setState(() {
      _selectedDate = _selectedDate.add(const Duration(days: 7));
    });
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF7555F6),
              onPrimary: Colors.white,
              onSurface: Color(0xFF141A28),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentEvents = _selectedDayEvents;
    final weekStart = _weekStart;
    final weekDays = List.generate(7, (i) => weekStart.add(Duration(days: i)));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  if (widget.showBackButton && Navigator.canPop(context))
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
                    )
                  else
                    const SizedBox(width: 44),

                  // Title: "My Schedule"
                  const Text(
                    'My Schedule',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF141A28),
                      letterSpacing: -0.3,
                    ),
                  ),

                  // Calendar Picker Button
                  GestureDetector(
                    onTap: _pickDate,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFF5F3FF),
                        border: Border.all(
                          color: const Color(0xFFEDE9FE),
                          width: 1.2,
                        ),
                      ),
                      child: const Icon(
                        Icons.calendar_month_rounded,
                        color: Color(0xFF7555F6),
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),

                    // Month & Week Navigation Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${_monthNames[_selectedDate.month - 1]} ${_selectedDate.year}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF141A28),
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: _previousWeek,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xFFE2E8F0)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.chevron_left_rounded,
                                    size: 18,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: _nextWeek,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xFFE2E8F0)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.chevron_right_rounded,
                                    size: 18,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Weekly Day Strip
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: weekDays.map((dayDate) {
                          final isSelected = _isSameDay(_selectedDate, dayDate);
                          final hasEvents = _hasEventOn(dayDate);
                          final dayName = _weekdayShort[dayDate.weekday - 1];
                          final dayNumber = '${dayDate.day}';

                          return GestureDetector(
                            onTap: () => setState(() => _selectedDate = dayDate),
                            child: Column(
                              children: [
                                Text(
                                  dayName,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: isSelected
                                        ? FontWeight.w800
                                        : FontWeight.w600,
                                    color: isSelected
                                        ? const Color(0xFF7555F6)
                                        : const Color(0xFF94A3B8),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  width: 42,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? const Color(0xFF7555F6)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: isSelected
                                        ? [
                                            BoxShadow(
                                              color: const Color(0xFF7555F6)
                                                  .withValues(alpha: 0.35),
                                              blurRadius: 10,
                                              offset: const Offset(0, 4),
                                            ),
                                          ]
                                        : [],
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Text(
                                        dayNumber,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                          color: isSelected
                                              ? Colors.white
                                              : const Color(0xFF141A28),
                                        ),
                                      ),
                                      if (hasEvents)
                                        Positioned(
                                          bottom: 6,
                                          child: Container(
                                            width: 4,
                                            height: 4,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: isSelected
                                                  ? Colors.white
                                                  : const Color(0xFF7555F6),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Section Header: Scheduled Sessions
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Scheduled Sessions',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF141A28),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF7555F6).withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '${currentEvents.length}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF7555F6),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const FindMentorScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              '+ Book Session',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF7555F6),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Event Timeline or Empty State
                    if (currentEvents.isEmpty)
                      _buildEmptyScheduleState()
                    else
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: List.generate(currentEvents.length, (index) {
                            final event = currentEvents[index];
                            final isLast = index == currentEvents.length - 1;
                            return _buildTimelineItem(event, isLast);
                          }),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // Bottom Book New Session Button
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const FindMentorScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add_rounded, color: Colors.white, size: 20),
                  label: const Text(
                    'Book New Session',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7555F6),
                    elevation: 4,
                    shadowColor: const Color(0xFF7555F6).withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
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

  Widget _buildEmptyScheduleState() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                color: Color(0xFFF5F3FF),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.event_available_rounded,
                size: 32,
                color: Color(0xFF7555F6),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'No Sessions on ${_selectedDate.day} ${_monthShort[_selectedDate.month - 1]}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFF141A28),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Your schedule is clear for this day! Check other dates or explore mentors to book a new skill swap.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF94A3B8),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const FindMentorScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.search_rounded, size: 16),
              label: const Text('Find a Mentor'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7555F6),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem(ScheduleEventItem event, bool isLast) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Time Column with vertical connecting line
          SizedBox(
            width: 64,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.time,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF141A28),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
                      child: Container(
                        width: 1.5,
                        color: const Color(0xFFE2E8F0),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 4),

          // Right Event Card
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
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
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Badges Row
                    Row(
                      children: [
                        // Status Badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFECFDF5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 5,
                                height: 5,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF10B981),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                event.status,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF10B981),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (event.location != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1F5F9),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  event.location == 'Zoom' ||
                                          event.location == 'Google Meet'
                                      ? Icons.videocam_rounded
                                      : Icons.place_rounded,
                                  size: 11,
                                  color: const Color(0xFF64748B),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  event.location!,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF475569),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        const Spacer(),
                        Text(
                          event.duration,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Title
                    Text(
                      event.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF141A28),
                        height: 1.25,
                      ),
                    ),

                    const SizedBox(height: 6),

                    // Time Range
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time_rounded,
                          size: 13,
                          color: Color(0xFF94A3B8),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          event.timeRange,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF94A3B8),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Mentor & Avatar Row
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: event.isBlueAvatar
                                ? const Color(0xFF38BDF8)
                                : const Color(0xFF7555F6),
                          ),
                          child: Center(
                            child: Text(
                              event.participantName.isNotEmpty
                                  ? event.participantName[0]
                                  : 'M',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                event.participantName,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF141A28),
                                ),
                              ),
                              Text(
                                event.participantRole,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // Action Buttons Row: Join Meeting & View Details
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => MeetingScreen(
                                    title: event.title,
                                    participantName: event.participantName,
                                    participantRole: event.participantRole,
                                    durationText: '(${event.duration})',
                                    timeRange: event.timeRange,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 38,
                              decoration: BoxDecoration(
                                color: const Color(0xFF141927),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.videocam_rounded,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'Join Meeting',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SessionDetailsScreen(
                                  title: event.title,
                                  status: event.status,
                                  dateMonth: _monthShort[event.date.month - 1],
                                  dateDay: '${event.date.day}',
                                  dateYearText:
                                      '${_weekdayShort[event.date.weekday - 1]}, ${event.date.year}',
                                  timeRange: event.timeRange,
                                  durationText: '(${event.duration})',
                                  participantName: event.participantName,
                                  participantRole: event.participantRole,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 38,
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFE2E8F0),
                                width: 1.2,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Details',
                                style: TextStyle(
                                  color: Color(0xFF141A28),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RescheduleScreen(
                                  participantName: event.participantName,
                                  participantRole: event.participantRole,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8FAFC),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFE2E8F0),
                                width: 1.2,
                              ),
                            ),
                            child: const Icon(
                              Icons.history_rounded,
                              size: 18,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RescheduleScreen extends StatefulWidget {
  final bool showBackButton;
  final String? participantName;
  final String? participantRole;

  const RescheduleScreen({
    super.key,
    this.showBackButton = true,
    this.participantName,
    this.participantRole,
  });

  @override
  State<RescheduleScreen> createState() => _RescheduleScreenState();
}

class _RescheduleScreenState extends State<RescheduleScreen> {
  int _selectedDayIndex = 2;
  int _selectedSlotIndex = 0;

  final List<ScheduleDayItem> _days = [
    ScheduleDayItem(
      dayName: 'MON',
      dayNumber: '24',
      date: DateTime(2024, 9, 24),
    ),
    ScheduleDayItem(
      dayName: 'TUE',
      dayNumber: '25',
      date: DateTime(2024, 9, 25),
    ),
    ScheduleDayItem(
      dayName: 'WED',
      dayNumber: '26',
      date: DateTime(2024, 9, 26),
      isSelected: true,
    ),
    ScheduleDayItem(
      dayName: 'THU',
      dayNumber: '27',
      date: DateTime(2024, 9, 27),
    ),
    ScheduleDayItem(
      dayName: 'FRI',
      dayNumber: '28',
      date: DateTime(2024, 9, 28),
    ),
  ];

  final List<Map<String, String>> _availableSlots = [
    {
      'time': '10:00 AM',
      'duration': '60 min',
      'platform': 'Zoom Call',
      'label': 'Morning Session',
    },
    {
      'time': '02:30 PM',
      'duration': '45 min',
      'platform': 'Google Meet',
      'label': 'Afternoon Session',
    },
    {
      'time': '05:00 PM',
      'duration': '90 min',
      'platform': 'Zoom Call',
      'label': 'Evening Deep Dive',
    },
  ];

  void _confirmReschedule() {
    final selectedDay = _days[_selectedDayIndex];
    final selectedSlot = _availableSlots[_selectedSlotIndex];

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Session rescheduled to ${selectedDay.dayName} ${selectedDay.dayNumber} at ${selectedSlot['time']}!',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF10B981),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        duration: const Duration(seconds: 3),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (widget.showBackButton && Navigator.canPop(context))
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
                    )
                  else
                    const SizedBox(width: 44),

                  const Text(
                    'Reschedule',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF141A28),
                      letterSpacing: -0.3,
                    ),
                  ),

                  const SizedBox(width: 44),
                ],
              ),
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),

                    // Participant Info header
                    if (widget.participantName != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF7555F6),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    widget.participantName![0],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
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
                                      widget.participantName!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF141A28),
                                      ),
                                    ),
                                    Text(
                                      widget.participantRole ?? 'Mentor',
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Color(0xFF64748B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    const SizedBox(height: 20),

                    // Weekly Day Strip
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(_days.length, (index) {
                          final day = _days[index];
                          final isSelected = _selectedDayIndex == index;
                          return GestureDetector(
                            onTap: () => setState(() => _selectedDayIndex = index),
                            child: Column(
                              children: [
                                Text(
                                  day.dayName,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: isSelected
                                        ? FontWeight.w800
                                        : FontWeight.w600,
                                    color: isSelected
                                        ? const Color(0xFF7555F6)
                                        : const Color(0xFF94A3B8),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  width: 44,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? const Color(0xFF7555F6)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: isSelected
                                        ? [
                                            BoxShadow(
                                              color: const Color(0xFF7555F6)
                                                  .withValues(alpha: 0.35),
                                              blurRadius: 10,
                                              offset: const Offset(0, 4),
                                            ),
                                          ]
                                        : [],
                                  ),
                                  child: Center(
                                    child: Text(
                                      day.dayNumber,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: isSelected
                                            ? Colors.white
                                            : const Color(0xFF141A28),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Section Title: Select New Slot
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Available Slots',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF141A28),
                            ),
                          ),
                          Text(
                            'Choose Time',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF7555F6),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Slots List
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: List.generate(_availableSlots.length, (index) {
                          final slot = _availableSlots[index];
                          final isSelected = _selectedSlotIndex == index;
                          return GestureDetector(
                            onTap: () => setState(() => _selectedSlotIndex = index),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFF7555F6).withValues(alpha: 0.06)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFF7555F6)
                                      : const Color(0xFFE2E8F0),
                                  width: isSelected ? 2 : 1.2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    isSelected
                                        ? Icons.radio_button_checked_rounded
                                        : Icons.radio_button_off_rounded,
                                    color: isSelected
                                        ? const Color(0xFF7555F6)
                                        : const Color(0xFF94A3B8),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          slot['time']!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF141A28),
                                          ),
                                        ),
                                        Text(
                                          '${slot['label']} • ${slot['platform']}',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF64748B),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF1F5F9),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      slot['duration']!,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF64748B),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Confirmation Button
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  onPressed: _confirmReschedule,
                  icon: const Icon(Icons.check_rounded, color: Colors.white, size: 20),
                  label: const Text(
                    'Confirm Reschedule',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7555F6),
                    elevation: 4,
                    shadowColor: const Color(0xFF7555F6).withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
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
