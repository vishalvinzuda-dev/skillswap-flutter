import 'package:flutter/material.dart';
import '../../sessions/session_details_screen.dart';
import '../../profile/edit_profile_screen.dart';

class CalendarSessionItem {
  final String id;
  final DateTime date;
  final String title;
  final String time;
  final String timeRange;
  final String durationText;
  final String mentor;
  final String mentorRole;
  final String status;
  final Color highlightColor;

  const CalendarSessionItem({
    required this.id,
    required this.date,
    required this.title,
    required this.time,
    required this.timeRange,
    required this.durationText,
    required this.mentor,
    required this.mentorRole,
    this.status = 'Confirmed',
    required this.highlightColor,
  });

  String get day => date.day.toString();
  String get month => CalendarView.monthShortNames[date.month - 1];
  String get dateYearText =>
      '${CalendarView.weekdayNames[date.weekday - 1]}, ${date.year}';
}

class _CalendarDayData {
  final DateTime date;
  final bool isCurrentMonth;

  const _CalendarDayData({required this.date, required this.isCurrentMonth});
}

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  static const List<String> monthNames = [
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

  static const List<String> monthShortNames = [
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

  static const List<String> weekdayNames = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late DateTime _currentMonth;
  late DateTime _selectedDate;
  bool _showAllSessions = false;

  late final List<CalendarSessionItem> _sessions;

  @override
  void initState() {
    super.initState();
    // Default to September 2024 to match app initial design state
    _currentMonth = DateTime(2024, 9, 1);
    _selectedDate = DateTime(2024, 9, 12);

    _sessions = [
      CalendarSessionItem(
        id: '1',
        date: DateTime(2024, 9, 12),
        title: 'UI Design\nWorkshop',
        time: '10:00 AM',
        timeRange: '10:00 - 11:30 AM',
        durationText: '(90 min)',
        mentor: 'Elena G.',
        mentorRole: 'Senior UI/UX Designer',
        status: 'Confirmed',
        highlightColor: const Color(0xFF7555F6),
      ),
      CalendarSessionItem(
        id: '2',
        date: DateTime(2024, 9, 15),
        title: 'French\nConversation',
        time: '02:30 PM',
        timeRange: '14:30 - 15:30',
        durationText: '(60 min)',
        mentor: 'Marcus T.',
        mentorRole: 'Language Mentor',
        status: 'Confirmed',
        highlightColor: const Color(0xFFE2E8F0),
      ),
      CalendarSessionItem(
        id: '3',
        date: DateTime(2024, 9, 19),
        title: 'Mobile App\nArchitecture',
        time: '11:00 AM',
        timeRange: '11:00 - 12:30 PM',
        durationText: '(90 min)',
        mentor: 'Alex Rivera',
        mentorRole: 'Lead Flutter Developer',
        status: 'Confirmed',
        highlightColor: const Color(0xFF10B981),
      ),
      CalendarSessionItem(
        id: '4',
        date: DateTime(2024, 9, 24),
        title: 'UI Design Mentorship &\nPortfolio Review',
        time: '02:00 PM',
        timeRange: '14:00 - 15:30',
        durationText: '(90 min)',
        mentor: 'Marcus Sterling',
        mentorRole: 'Expert UI/UX Designer',
        status: 'Confirmed',
        highlightColor: const Color(0xFF7C3AED),
      ),
      CalendarSessionItem(
        id: '5',
        date: DateTime(2024, 9, 28),
        title: 'Python Basics &\nMachine Learning',
        time: '04:00 PM',
        timeRange: '16:00 - 17:30',
        durationText: '(90 min)',
        mentor: 'Dr. Sophia Wang',
        mentorRole: 'AI & Data Scientist',
        status: 'Confirmed',
        highlightColor: const Color(0xFFF59E0B),
      ),
      CalendarSessionItem(
        id: '6',
        date: DateTime(2024, 10, 5),
        title: 'Design Systems in Figma',
        time: '01:00 PM',
        timeRange: '13:00 - 14:00',
        durationText: '(60 min)',
        mentor: 'Sarah Jenkins',
        mentorRole: 'Product Designer',
        status: 'Confirmed',
        highlightColor: const Color(0xFF38BDF8),
      ),
      CalendarSessionItem(
        id: '7',
        date: DateTime(2024, 10, 18),
        title: 'Flutter Animations Deep Dive',
        time: '03:30 PM',
        timeRange: '15:30 - 17:00',
        durationText: '(90 min)',
        mentor: 'Elena G.',
        mentorRole: 'Senior UI/UX Designer',
        status: 'Confirmed',
        highlightColor: const Color(0xFF7555F6),
      ),
    ];
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _hasSessionOn(DateTime date) {
    return _sessions.any((s) => _isSameDay(s.date, date));
  }

  List<CalendarSessionItem> get _visibleSessions {
    if (_showAllSessions) {
      final list = List<CalendarSessionItem>.from(_sessions);
      list.sort((a, b) => a.date.compareTo(b.date));
      return list;
    }

    final upcomingFromSelected = _sessions.where((s) {
      final sessionDay = DateTime(s.date.year, s.date.month, s.date.day);
      final selectedDay = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
      );
      return !sessionDay.isBefore(selectedDay);
    }).toList();

    upcomingFromSelected.sort((a, b) => a.date.compareTo(b.date));

    if (upcomingFromSelected.isNotEmpty) {
      return upcomingFromSelected;
    }

    final onDay = _sessions
        .where((s) => _isSameDay(s.date, _selectedDate))
        .toList();
    if (onDay.isNotEmpty) {
      return onDay;
    }

    return [];
  }

  void _goToPreviousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
    });
  }

  void _goToNextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final visibleSessions = _visibleSessions;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top App Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Calendar',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF141A28),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const EditProfileScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF7555F6).withValues(alpha: 0.3),
                          width: 2,
                        ),
                      ),
                      child: const CircleAvatar(
                        backgroundColor: Color(0xFFE2E8F0),
                        child: Icon(Icons.person, color: Color(0xFF7555F6)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Calendar Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: const Color(0xFFF1F5F9),
                    width: 1.5,
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
                  children: [
                    // Month & Navigation Arrows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${CalendarView.monthNames[_currentMonth.month - 1]} ${_currentMonth.year}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF141A28),
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: _goToPreviousMonth,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xFFF1F5F9),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.chevron_left_rounded,
                                  size: 16,
                                  color: Color(0xFF94A3B8),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: _goToNextMonth,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xFFF1F5F9),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.chevron_right_rounded,
                                  size: 16,
                                  color: Color(0xFF94A3B8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Day of Week Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: ['MO', 'TU', 'WE', 'TH', 'FR', 'SA', 'SU'].map((
                        d,
                      ) {
                        return SizedBox(
                          width: 32,
                          child: Text(
                            d,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF94A3B8),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 10),

                    // Dynamic Calendar Grid
                    ..._buildCalendarDays(),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Upcoming Sessions Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _showAllSessions ? 'All Sessions' : 'Upcoming Sessions',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF141A28),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        _showAllSessions = !_showAllSessions;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        _showAllSessions ? 'Upcoming Only' : 'View All',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7555F6),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Sessions List or Empty State
            if (visibleSessions.isEmpty)
              _buildEmptySessionState()
            else
              ...visibleSessions.map((session) => _buildSessionCard(session)),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCalendarDays() {
    final year = _currentMonth.year;
    final month = _currentMonth.month;

    // Number of days in current month
    final daysInMonth = DateTime(year, month + 1, 0).day;

    // Weekday of the 1st day of the month (1 = Mon ... 7 = Sun)
    final firstWeekday = DateTime(year, month, 1).weekday;

    // Number of leading days from the previous month
    final leadingCount = firstWeekday - 1;
    final prevMonthLastDay = DateTime(year, month, 0).day;

    final List<_CalendarDayData> dayList = [];

    // 1. Leading days from previous month
    final prevMonthDate = DateTime(year, month - 1, 1);
    for (int i = leadingCount - 1; i >= 0; i--) {
      final d = prevMonthLastDay - i;
      dayList.add(
        _CalendarDayData(
          date: DateTime(prevMonthDate.year, prevMonthDate.month, d),
          isCurrentMonth: false,
        ),
      );
    }

    // 2. Current month days
    for (int d = 1; d <= daysInMonth; d++) {
      dayList.add(
        _CalendarDayData(date: DateTime(year, month, d), isCurrentMonth: true),
      );
    }

    // 3. Trailing days to complete the 7-day row
    final remaining = dayList.length % 7 == 0 ? 0 : 7 - (dayList.length % 7);
    final nextMonthDate = DateTime(year, month + 1, 1);
    for (int d = 1; d <= remaining; d++) {
      dayList.add(
        _CalendarDayData(
          date: DateTime(nextMonthDate.year, nextMonthDate.month, d),
          isCurrentMonth: false,
        ),
      );
    }

    // Build Rows
    final List<Widget> rows = [];
    for (int i = 0; i < dayList.length; i += 7) {
      final week = dayList.sublist(i, i + 7);
      rows.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: week.map((dayData) => _buildDayCell(dayData)).toList(),
          ),
        ),
      );
    }

    return rows;
  }

  Widget _buildDayCell(_CalendarDayData dayData) {
    final date = dayData.date;
    final isSelected = _isSameDay(_selectedDate, date);
    final isFaded = !dayData.isCurrentMonth;
    final hasSession = _hasSessionOn(date);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          _selectedDate = date;
          _showAllSessions = false;
          if (!dayData.isCurrentMonth) {
            _currentMonth = DateTime(date.year, date.month, 1);
          }
        });
      },
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF7555F6) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              '${date.day}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                color: isSelected
                    ? Colors.white
                    : (isFaded
                          ? const Color(0xFFCBD5E1)
                          : const Color(0xFF141A28)),
              ),
            ),
            if (hasSession)
              Positioned(
                bottom: 2,
                child: Container(
                  width: 3.5,
                  height: 3.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? Colors.white : const Color(0xFF7555F6),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptySessionState() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xFFF5F3FF),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.calendar_today_rounded,
                size: 28,
                color: Color(0xFF7555F6),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'No sessions scheduled for ${_selectedDate.day} ${CalendarView.monthShortNames[_selectedDate.month - 1]}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF141A28),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Select a highlighted date with a dot or view all scheduled sessions.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
            ),
            const SizedBox(height: 14),
            GestureDetector(
              onTap: () {
                setState(() {
                  _showAllSessions = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF7555F6).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'View All Sessions',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7555F6),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionCard(CalendarSessionItem session) {
    final bool isSelectedDate = _isSameDay(session.date, _selectedDate);
    final Color borderHighlight = isSelectedDate
        ? const Color(0xFF7555F6)
        : session.highlightColor;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SessionDetailsScreen(
              title: session.title.replaceAll('\n', ' '),
              status: session.status,
              dateMonth: session.month,
              dateDay: session.day,
              dateYearText: session.dateYearText,
              timeRange: session.timeRange,
              durationText: session.durationText,
              participantName: session.mentor,
              participantRole: session.mentorRole,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 4,
                decoration: BoxDecoration(
                  color: borderHighlight,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    session.day,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF141A28),
                    ),
                  ),
                  Text(
                    session.month,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              const VerticalDivider(color: Color(0xFFF1F5F9), thickness: 1.5),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      session.title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF141A28),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time_rounded,
                          size: 12,
                          color: Color(0xFF94A3B8),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          session.time,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const CircleAvatar(
                          radius: 6,
                          backgroundColor: Color(0xFF38BDF8),
                          child: Icon(
                            Icons.person,
                            size: 8,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          session.mentor,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded, color: Color(0xFF94A3B8)),
            ],
          ),
        ),
      ),
    );
  }
}
