import 'package:flutter/material.dart';
import '../requests/send_request_screen.dart';

class ExpertProfileScreen extends StatelessWidget {
  final String name;
  final String role;
  final String location;
  final int swapsCount;
  final int skillsCount;
  final List<String> skillsOffer;
  final List<String> wantToLearn;
  final String avatarUrl;

  const ExpertProfileScreen({
    super.key,
    this.name = 'Sarah Jenkins',
    this.role = 'Senior UI Designer',
    this.location = 'San Francisco, CA',
    this.swapsCount = 24,
    this.skillsCount = 12,
    this.skillsOffer = const [
      'UI Design',
      'Prototyping',
      'Figma',
      'Photography',
    ],
    this.wantToLearn = const [
      'French',
      'Guitar',
      'Public Speaking',
    ],
    this.avatarUrl = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFF1F5F9),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.chevron_left_rounded,
                        color: Color(0xFF141A28),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      'Expert Profile',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF141A28),
                      ),
                    ),
                  ),
                  // Share Button
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Profile link copied to clipboard!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.share_outlined,
                        color: Color(0xFF141A28),
                        size: 20,
                      ),
                    ),
                  ),
                  // More Menu Button
                  PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.more_vert_rounded,
                      color: Color(0xFF141A28),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'report',
                        child: Text('Report Profile'),
                      ),
                      const PopupMenuItem(
                        value: 'block',
                        child: Text('Block User'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 32),
                child: Column(
                  children: [
                    const SizedBox(height: 16),

                    // Profile Avatar with Purple Ring and Lock/Badge
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            width: 104,
                            height: 104,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF7555F6),
                                width: 3,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: CircleAvatar(
                                backgroundColor: const Color(0xFFF1F5F9),
                                child: Text(
                                  name.isNotEmpty ? name[0] : 'S',
                                  style: const TextStyle(
                                    fontSize: 38,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF7555F6),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Lock / Verified Icon Badge
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: const Color(0xFF7555F6),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2.5,
                              ),
                            ),
                            child: const Icon(
                              Icons.lock_rounded,
                              color: Colors.white,
                              size: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Name
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF141A28),
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Location
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 15,
                          color: Color(0xFF94A3B8),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Stats Card: 24 SWAPS | 12 SKILLS
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  '$swapsCount',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF141A28),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  'SWAPS',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                    color: Color(0xFF94A3B8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                            child: VerticalDivider(
                              color: Color(0xFFF1F5F9),
                              thickness: 1.5,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  '$skillsCount',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF141A28),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  'SKILLS',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                    color: Color(0xFF94A3B8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Section: Skills I Offer
                    _buildSectionHeader('Skills I Offer'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: skillsOffer
                              .map((skill) => _buildOfferChip(skill))
                              .toList(),
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Section: Want to Learn
                    _buildSectionHeader('Want to Learn'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: wantToLearn
                              .map((skill) => _buildLearnChip(skill))
                              .toList(),
                        ),
                      ),
                    ),

                    const SizedBox(height: 36),

                    // Request Swap / Connect Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF6D28D9),
                              Color(0xFF7555F6),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF7555F6)
                                  .withValues(alpha: 0.35),
                              blurRadius: 18,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => SendRequestScreen(
                                    recipientName: name,
                                    offeringSkill: skillsOffer.isNotEmpty
                                        ? skillsOffer.first
                                        : 'UI/UX Design',
                                  ),
                                ),
                              );
                            },
                            child: const Center(
                              child: Text(
                                'Request Skill Swap',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
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
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xFF141A28),
            ),
          ),
          const Icon(
            Icons.chevron_left_rounded,
            color: Color(0xFF94A3B8),
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildOfferChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F0FF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF7555F6).withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF7555F6),
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildLearnChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1.5,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF475569),
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
