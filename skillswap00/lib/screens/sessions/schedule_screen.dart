import 'package:flutter/material.dart';

class ScheduleDayItem {
  final String dayName;
  final String dayNumber;
  final bool isSelected;

  const ScheduleDayItem({
    required this.dayName,
    required this.dayNumber,
    this.isSelected = false,
  });
}

class ScheduleEventItem {
  final String time;
  final String title;
  final String subtitle;
  final String duration;
  final String? location;
  final bool isHighlightCard;
  final bool isBlueAvatar;
  final String participantName;
  final String participantRole;

  const ScheduleEventItem({
    required this.time,
    required this.title,
    required this.subtitle,
    required this.duration,
    this.location,
    this.isHighlightCard = false,
    this.isBlueAvatar = false,
    required this.participantName,
    required this.participantRole,
  });
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
  int _selectedDayIndex = 2; // Wednesday 26 selected by default
  int _selectedEventIndex = 0; // First slot selected by default

  final List<ScheduleDayItem> _days = const [
    ScheduleDayItem(dayName: 'MON', dayNumber: '24'),
    ScheduleDayItem(dayName: 'TUE', dayNumber: '25'),
    ScheduleDayItem(dayName: 'WED', dayNumber: '26', isSelected: true),
    ScheduleDayItem(dayName: 'THU', dayNumber: '27'),
    ScheduleDayItem(dayName: 'FRI', dayNumber: '28'),
  ];

  final List<ScheduleEventItem> _events = const [
    ScheduleEventItem(
      time: '10:00',
      title: 'UI Design Session',
      subtitle: 'with Sarah Jenkins',
      duration: '60 min',
      location: 'Zoom',
      isHighlightCard: true,
      isBlueAvatar: true,
      participantName: 'Sarah Jenkins',
      participantRole: 'Senior UI Designer',
    ),
    ScheduleEventItem(
      time: '14:30',
      title: 'Python Basics',
      subtitle: 'with Marcus Chen',
      duration: '45 min',
      location: 'Local Cafe',
      isHighlightCard: false,
      isBlueAvatar: false,
      participantName: 'Marcus Chen',
      participantRole: 'Lead Visual Designer',
    ),
    ScheduleEventItem(
      time: '17:00',
      title: 'Guitar Practice',
      subtitle: 'with James Wilson',
      duration: '90 min',
      location: null,
      isHighlightCard: false,
      isBlueAvatar: false,
      participantName: 'James Wilson',
      participantRole: 'Musician & Guitarist',
    ),
  ];

  void _confirmReschedule() {
    final selectedDay = _days[_selectedDayIndex];
    final selectedEvent = _events[_selectedEventIndex];

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Session rescheduled to ${selectedDay.dayName} ${selectedDay.dayNumber} at ${selectedEvent.time}!',
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

                  // Title: "Reschedule"
                  const Text(
                    'Reschedule',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF141A28),
                      letterSpacing: -0.3,
                    ),
                  ),

                  // Calendar Add Button
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Select custom date from calendar'),
                          backgroundColor: const Color(0xFF7555F6),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    },
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
                    const SizedBox(height: 12),

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
                            'Select Time',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF7555F6),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Timeline Event List
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: List.generate(_events.length, (index) {
                          final event = _events[index];
                          final isLast = index == _events.length - 1;
                          final isSelected = _selectedEventIndex == index;
                          return _buildTimelineItem(event, isLast, index, isSelected);
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

  Widget _buildTimelineItem(
    ScheduleEventItem event,
    bool isLast,
    int index,
    bool isSelected,
  ) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Time Column with vertical connecting line
          SizedBox(
            width: 52,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.time,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: isSelected ? const Color(0xFF7555F6) : const Color(0xFF141A28),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18, top: 8, bottom: 8),
                      child: Container(
                        width: 1.5,
                        color: const Color(0xFFE2E8F0),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Right Event Card (Tap to select for rescheduling)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: GestureDetector(
                onTap: () {
                  setState(() => _selectedEventIndex = index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFEEF4FF)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF7555F6)
                          : const Color(0xFFE2E8F0),
                      width: isSelected ? 2 : 1.2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: isSelected
                            ? const Color(0xFF7555F6).withValues(alpha: 0.1)
                            : Colors.black.withValues(alpha: 0.02),
                        blurRadius: isSelected ? 12 : 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Event Info & Badges
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    event.title,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF141A28),
                                    ),
                                  ),
                                ),
                                if (isSelected)
                                  const Icon(
                                    Icons.check_circle_rounded,
                                    color: Color(0xFF7555F6),
                                    size: 18,
                                  ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Text(
                              event.subtitle,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF64748B),
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Tag Badges
                            Wrap(
                              spacing: 8,
                              runSpacing: 6,
                              children: [
                                // Duration Chip
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.white
                                        : const Color(0xFFF1F5F9),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.access_time_rounded,
                                        size: 13,
                                        color: isSelected
                                            ? const Color(0xFF7555F6)
                                            : const Color(0xFF64748B),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        event.duration,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          color: isSelected
                                              ? const Color(0xFF7555F6)
                                              : const Color(0xFF475569),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Location / App Chip
                                if (event.location != null)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.white
                                          : const Color(0xFFF1F5F9),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          event.location == 'Zoom'
                                              ? Icons.videocam_rounded
                                              : Icons.location_on_rounded,
                                          size: 13,
                                          color: const Color(0xFF64748B),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          event.location!,
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF475569),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 12),

                      // Avatar
                      event.isBlueAvatar
                          ? Container(
                              width: 42,
                              height: 42,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF38BDF8),
                              ),
                              child: const Icon(
                                Icons.person_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                            )
                          : Container(
                              width: 42,
                              height: 42,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFF8FAFC),
                              ),
                              child: Center(
                                child: CustomPaint(
                                  size: const Size(36, 36),
                                  painter: IllustratedAvatarPainter(),
                                ),
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
    );
  }
}

// Backward compatibility alias so existing imports of ScheduleScreen continue working
typedef ScheduleScreen = RescheduleScreen;

class IllustratedAvatarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double cx = size.width / 2;
    final double cy = size.height / 2;

    final hairPaint = Paint()..color = const Color(0xFF5D4037);
    final skinPaint = Paint()..color = const Color(0xFFFFCC80);
    final beardPaint = Paint()..color = const Color(0xFF8D6E63);
    final shirtPaint = Paint()..color = const Color(0xFFE2E8F0);

    canvas.drawCircle(Offset(cx, cy - 2), 11, hairPaint);
    canvas.drawCircle(Offset(cx, cy - 1), 9, skinPaint);
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: 8),
      0,
      3.14,
      false,
      beardPaint..strokeWidth = 3..style = PaintingStyle.stroke,
    );

    final shirtRect = Rect.fromCenter(
      center: Offset(cx, cy + 15),
      width: 24,
      height: 12,
    );
    canvas.drawArc(shirtRect, 3.14, 3.14, true, shirtPaint..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
