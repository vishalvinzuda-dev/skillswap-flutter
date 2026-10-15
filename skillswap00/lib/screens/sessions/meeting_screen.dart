import 'dart:async';
import 'package:flutter/material.dart';
import '../../common/widgets/illustrated_avatar.dart';

/// Interactive Live / Upcoming Meeting Screen matching the SkillSwap Video Call UI
class MeetingScreen extends StatefulWidget {
  final String title;
  final String participantName;
  final String participantRole;
  final String durationText;
  final String timeRange;

  const MeetingScreen({
    super.key,
    this.title = 'UI Design Mentorship',
    this.participantName = 'Marcus Sterling',
    this.participantRole = 'Expert UI/UX Designer',
    this.durationText = '(90 min)',
    this.timeRange = '02:00 PM - 03:30 PM',
  });

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  // Timer state (starts at 12:45 to match design, ticks upwards)
  late int _elapsedSeconds;
  Timer? _callTimer;

  // In-call toggles
  bool _isMuted = false;
  bool _isVideoOn = true;
  bool _isSpeakerOn = true;
  bool _isFrontCamera = true;
  bool _isTileExpanded = false;

  // Mock in-meeting chat messages
  final List<Map<String, String>> _chatMessages = [
    {
      'sender': 'Marcus Sterling',
      'text': 'Hey! Ready when you are with the Figma links.',
      'time': '12:40 PM',
    },
    {
      'sender': 'You',
      'text': 'Just pulled up the design system components!',
      'time': '12:42 PM',
    },
  ];

  @override
  void initState() {
    super.initState();
    // 12 minutes and 45 seconds = 765 seconds
    _elapsedSeconds = 765;
    _startTimer();
  }

  void _startTimer() {
    _callTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _elapsedSeconds++;
        });
      }
    });
  }

  @override
  void dispose() {
    _callTimer?.cancel();
    super.dispose();
  }

  String _formatCallDuration(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E131F),
      body: SafeArea(
        child: Stack(
          children: [
            // Main Video Canvas
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  if (_isTileExpanded) {
                    setState(() {
                      _isTileExpanded = false;
                    });
                  }
                },
                child: Container(
                  color: const Color(0xFF0E131F),
                ),
              ),
            ),

            // Top App Bar: Back button, Session Title & Live Timer
            Positioned(
              top: 16,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  // Circular Back Button
                  GestureDetector(
                    onTap: () => _confirmExitCall(context),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF222B3D),
                        border: Border.all(
                          color: const Color(0xFF334155).withValues(alpha: 0.5),
                          width: 1.2,
                        ),
                      ),
                      child: const Icon(
                        Icons.chevron_left_rounded,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Session Title & Live Recording / Call Duration
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: -0.2,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            // Red Live Recording Dot
                            Container(
                              width: 7,
                              height: 7,
                              decoration: const BoxDecoration(
                                color: Color(0xFFEF4444),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            // Duration text (e.g. 12:45)
                            Text(
                              _formatCallDuration(_elapsedSeconds),
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFCBD5E1),
                                letterSpacing: 0.3,
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

            // Video Preview Tile (Top-Right as per screenshot)
            Positioned(
              top: 90,
              right: 24,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isTileExpanded = !_isTileExpanded;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 260),
                  curve: Curves.easeInOut,
                  width: _isTileExpanded ? MediaQuery.of(context).size.width - 48 : 150,
                  height: _isTileExpanded ? 280 : 195,
                  decoration: BoxDecoration(
                    color: const Color(0xFF212B3B),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: const Color(0xFF334155).withValues(alpha: 0.8),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.45),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Video Feed / Avatar
                      if (_isVideoOn)
                        Positioned(
                          bottom: -15,
                          child: SizedBox(
                            width: _isTileExpanded ? 210 : 140,
                            height: _isTileExpanded ? 260 : 190,
                            child: const CustomPaint(
                              painter: IllustratedAvatarPainter(),
                            ),
                          ),
                        )
                      else
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.videocam_off_rounded,
                                color: Color(0xFF94A3B8),
                                size: 36,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Video Paused',
                                style: TextStyle(
                                  color: Color(0xFF94A3B8),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                      // Top right indicators on video tile
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.45),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _isTileExpanded
                                ? Icons.fullscreen_exit_rounded
                                : Icons.fullscreen_rounded,
                            color: Colors.white.withValues(alpha: 0.85),
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Floating Participant Badge (Bottom-Left above control dock)
            Positioned(
              left: 24,
              bottom: 114,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF141C2B).withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xFF263348),
                    width: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.35),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Avatar with online status indicator
                    Stack(
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A364C),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: const CustomPaint(
                              painter: IllustratedAvatarPainter(),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: const Color(0xFF10B981),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF141C2B),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 12),

                    // Name and Role
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.participantName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: -0.2,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          widget.participantRole,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Control Bar Dock
            Positioned(
              left: 20,
              right: 20,
              bottom: 24,
              child: Container(
                height: 74,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFF161E2E),
                  borderRadius: BorderRadius.circular(37),
                  border: Border.all(
                    color: const Color(0xFF28364C),
                    width: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.5),
                      blurRadius: 24,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // 1. Microphone Toggle Button
                    _buildDockButton(
                      icon: _isMuted ? Icons.mic_off_rounded : Icons.mic_rounded,
                      backgroundColor: _isMuted
                          ? const Color(0xFFEF4444)
                          : const Color(0xFF263246),
                      iconColor: Colors.white,
                      onTap: () {
                        setState(() {
                          _isMuted = !_isMuted;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              _isMuted ? 'Microphone muted' : 'Microphone unmuted',
                            ),
                            duration: const Duration(seconds: 1),
                            backgroundColor: const Color(0xFF1F293D),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      },
                    ),

                    // 2. Purple Clock / Session Details Button
                    _buildDockButton(
                      icon: Icons.access_time_filled_rounded,
                      backgroundColor: const Color(0xFF7555F6),
                      iconColor: Colors.white,
                      onTap: () => _showSessionInfoSheet(context),
                    ),

                    // 3. Calendar Agenda / Notes Button
                    _buildDockButton(
                      icon: Icons.calendar_month_rounded,
                      backgroundColor: const Color(0xFF263246),
                      iconColor: Colors.white,
                      onTap: () => _showAgendaSheet(context),
                    ),

                    // 4. More Options (...) Button
                    _buildDockButton(
                      icon: Icons.more_horiz_rounded,
                      backgroundColor: const Color(0xFF263246),
                      iconColor: Colors.white,
                      onTap: () => _showMoreOptionsSheet(context),
                    ),

                    // 5. End Call Red Button
                    _buildDockButton(
                      icon: Icons.call_end_rounded,
                      backgroundColor: const Color(0xFFF43F5E),
                      iconColor: Colors.white,
                      onTap: () => _confirmExitCall(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDockButton({
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 22,
        ),
      ),
    );
  }

  // Session Info Sheet (Purple Clock Button)
  void _showSessionInfoSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF141C2B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFF334155),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.circle, color: Color(0xFF10B981), size: 8),
                      SizedBox(width: 5),
                      Text(
                        'Live Session',
                        style: TextStyle(
                          color: Color(0xFF10B981),
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  _formatCallDuration(_elapsedSeconds),
                  style: const TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF1E283A),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF2A374E)),
              ),
              child: Column(
                children: [
                  _buildInfoRow('Mentor', widget.participantName),
                  const Divider(color: Color(0xFF2A374E), height: 18),
                  _buildInfoRow('Role', widget.participantRole),
                  const Divider(color: Color(0xFF2A374E), height: 18),
                  _buildInfoRow('Scheduled Time', widget.timeRange),
                  const Divider(color: Color(0xFF2A374E), height: 18),
                  _buildInfoRow('Total Duration', widget.durationText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  // Agenda & Notes Sheet (Calendar Button)
  void _showAgendaSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF141C2B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
          24,
          20,
          24,
          MediaQuery.of(ctx).viewInsets.bottom + 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFF334155),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Meeting Agenda & Topics',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 16),
            _buildAgendaItem('1. Portfolio project breakdown & walkthrough', true),
            _buildAgendaItem('2. Design system component structure review', true),
            _buildAgendaItem('3. Interactive prototype polish & micro-interactions', false),
            _buildAgendaItem('4. Next career steps & Q&A discussion', false),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF1E283A),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFF2A374E)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.edit_note_rounded, color: Color(0xFF94A3B8)),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white, fontSize: 13),
                      decoration: InputDecoration(
                        hintText: 'Add a meeting note...',
                        hintStyle: TextStyle(color: Color(0xFF64748B), fontSize: 13),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Color(0xFF7555F6),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_upward_rounded, color: Colors.white, size: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgendaItem(String text, bool isCompleted) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            isCompleted ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
            color: isCompleted ? const Color(0xFF10B981) : const Color(0xFF64748B),
            size: 18,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: isCompleted ? const Color(0xFFCBD5E1) : const Color(0xFF94A3B8),
                fontSize: 13,
                fontWeight: FontWeight.w500,
                decoration: isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // More Options Action Sheet (...)
  void _showMoreOptionsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF141C2B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setModalState) => Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFF334155),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              _buildOptionTile(
                icon: _isVideoOn ? Icons.videocam_rounded : Icons.videocam_off_rounded,
                title: _isVideoOn ? 'Turn Off Video' : 'Turn On Video',
                iconColor: _isVideoOn ? const Color(0xFF7555F6) : const Color(0xFFEF4444),
                onTap: () {
                  setState(() {
                    _isVideoOn = !_isVideoOn;
                  });
                  setModalState(() {});
                  Navigator.pop(ctx);
                },
              ),
              _buildOptionTile(
                icon: Icons.flip_camera_ios_rounded,
                title: _isFrontCamera ? 'Switch to Back Camera' : 'Switch to Front Camera',
                iconColor: const Color(0xFF38BDF8),
                onTap: () {
                  setState(() {
                    _isFrontCamera = !_isFrontCamera;
                  });
                  setModalState(() {});
                  Navigator.pop(ctx);
                },
              ),
              _buildOptionTile(
                icon: _isSpeakerOn ? Icons.volume_up_rounded : Icons.volume_mute_rounded,
                title: _isSpeakerOn ? 'Switch to Earpiece' : 'Switch to Speaker',
                iconColor: const Color(0xFFF59E0B),
                onTap: () {
                  setState(() {
                    _isSpeakerOn = !_isSpeakerOn;
                  });
                  setModalState(() {});
                  Navigator.pop(ctx);
                },
              ),
              _buildOptionTile(
                icon: Icons.chat_bubble_outline_rounded,
                title: 'In-Call Messages',
                iconColor: const Color(0xFF10B981),
                onTap: () {
                  Navigator.pop(ctx);
                  _showChatSheet(context);
                },
              ),
              _buildOptionTile(
                icon: Icons.screen_share_rounded,
                title: 'Share Screen',
                iconColor: const Color(0xFFA855F7),
                onTap: () {
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Screen sharing requested...'),
                      backgroundColor: Color(0xFF7555F6),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: Color(0xFF64748B),
        size: 20,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onTap: onTap,
    );
  }

  // In-call Chat Sheet
  void _showChatSheet(BuildContext context) {
    final textController = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF141C2B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setChatState) => Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            20,
            20,
            MediaQuery.of(ctx).viewInsets.bottom + 20,
          ),
          child: SizedBox(
            height: 380,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFF334155),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'In-Call Messages',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: ListView.builder(
                    itemCount: _chatMessages.length,
                    itemBuilder: (ctx, i) {
                      final msg = _chatMessages[i];
                      final isMe = msg['sender'] == 'You';
                      return Align(
                        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: isMe
                                ? const Color(0xFF7555F6)
                                : const Color(0xFF1E283A),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            crossAxisAlignment:
                                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                            children: [
                              Text(
                                msg['text']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                msg['time']!,
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.6),
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E283A),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFF2A374E)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: textController,
                          style: const TextStyle(color: Colors.white, fontSize: 13),
                          decoration: const InputDecoration(
                            hintText: 'Type a message...',
                            hintStyle: TextStyle(color: Color(0xFF64748B), fontSize: 13),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (textController.text.trim().isNotEmpty) {
                            setState(() {
                              _chatMessages.add({
                                'sender': 'You',
                                'text': textController.text.trim(),
                                'time': 'Just now',
                              });
                            });
                            setChatState(() {});
                            textController.clear();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Color(0xFF7555F6),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // End Call Confirmation Dialog
  void _confirmExitCall(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        backgroundColor: const Color(0xFF161E2E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Leave Meeting?',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        content: const Text(
          'Are you sure you want to leave this session? You can rejoin anytime before it concludes.',
          style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx),
            child: const Text(
              'Stay in Call',
              style: TextStyle(color: Color(0xFFCBD5E1), fontWeight: FontWeight.w600),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF4444),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pop(dialogCtx);
              Navigator.pop(context);
            },
            child: const Text(
              'Leave Call',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

/// Convenience alias if referenced as UpcomingMeetingScreen
typedef UpcomingMeetingScreen = MeetingScreen;
