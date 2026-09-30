import 'package:flutter/material.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  Container(
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
                ],
              ),
            ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'September 2024',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF141A28),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
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
                            const SizedBox(width: 8),
                            Container(
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
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: ['MO', 'TU', 'WE', 'TH', 'FR', 'SA', 'SU'].map((
                        d,
                      ) {
                        return SizedBox(
                          width: 24,
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
                    const SizedBox(height: 12),
                    _buildCalendarRow([
                      '26',
                      '27',
                      '28',
                      '29',
                      '30',
                      '31',
                      '1',
                    ], isFadedRow: true),
                    _buildCalendarRow(['2', '3', '4', '5', '6', '7', '8']),
                    _buildCalendarRow([
                      '9',
                      '10',
                      '11',
                      '12',
                      '13',
                      '14',
                      '15',
                    ], selectedIndex: 3),
                    _buildCalendarRow([
                      '16',
                      '17',
                      '18',
                      '19',
                      '20',
                      '21',
                      '22',
                    ]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Upcoming Sessions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF141A28),
                    ),
                  ),
                  const Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7555F6),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildSessionCard(
              '12',
              'SEP',
              'UI Design\nWorkshop',
              '10:00 AM',
              'Elena G.',
              const Color(0xFF7555F6),
            ),
            _buildSessionCard(
              '15',
              'SEP',
              'French\nConversation',
              '02:30 PM',
              'Marcus T.',
              const Color(0xFFE2E8F0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarRow(
    List<String> days, {
    bool isFadedRow = false,
    int selectedIndex = -1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days.asMap().entries.map((entry) {
          int idx = entry.key;
          String day = entry.value;
          bool isSelected = idx == selectedIndex;
          bool isFaded =
              isFadedRow && (idx < 6); // Just to approximate the image
          return Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF7555F6) : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Text(
              day,
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
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSessionCard(
    String day,
    String month,
    String title,
    String time,
    String mentor,
    Color borderHighlight,
  ) {
    return Container(
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
                  day,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF141A28),
                  ),
                ),
                Text(
                  month,
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
                    title,
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
                        time,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const CircleAvatar(
                        radius: 6,
                        backgroundColor: Color(0xFF38BDF8),
                        child: Icon(Icons.person, size: 8, color: Colors.white),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        mentor,
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
            const Icon(Icons.chevron_left_rounded, color: Color(0xFF94A3B8)),
          ],
        ),
      ),
    );
  }
}
