import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'dashboard_screen.dart';
import 'splash_screen.dart'; // For SkillSwapEmblemPainter

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _goToLogin() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  void _nextPage() {
    if (_currentIndex < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const SkillSwapDashboard()),
      );
    }
  }

  void _skip() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const SkillSwapDashboard()),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            SizedBox(
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (_currentIndex < 3)
                    TextButton(
                      onPressed: _skip,
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: Color(0xFF8C8D9E)),
                      ),
                    )
                  else
                    const SizedBox(height: 48, width: 48), // Spacer
                ],
              ),
            ),

            // Icon
            Container(
              width: 56,
              height: 56,
              margin: const EdgeInsets.only(bottom: 16),
              child: CustomPaint(painter: SkillSwapEmblemPainter()),
            ),

            // Page View
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                children: const [
                  _GoalStep(),
                  _InterestsStep(),
                  _LevelStep(),
                  _ProfileStep(),
                ],
              ),
            ),

            // Dots
            _buildDots(),
            const SizedBox(height: 24),

            // Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _currentIndex == 2
                        ? const Color(0xFF141927)
                        : const Color(0xFF7555F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _currentIndex == 2 ? 'Get Started' : 'Next',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (_currentIndex != 2) ...[
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),

            // Log In text
            if (_currentIndex == 3)
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Color(0xFF8C8D9E), fontSize: 13),
                    ),
                    GestureDetector(
                      onTap: _goToLogin,
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          color: Color(0xFF7555F6),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else
              const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        final isActive = index == _currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 24 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF7555F6) : const Color(0xFFE2E4EB),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

// ----------------- STEP 1 -----------------
class _GoalStep extends StatefulWidget {
  const _GoalStep();
  @override
  State<_GoalStep> createState() => _GoalStepState();
}

class _GoalStepState extends State<_GoalStep> {
  int _selected = 2; // Default to 'Both' like image
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Text(
            'What is your goal?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF141A28),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Choose how you want to use\nSkillSwap.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Color(0xFF737A8C)),
          ),
          const SizedBox(height: 32),
          _buildCard(
            0,
            'Learn a Skill',
            'Explore courses and find\nexperts',
            Icons.school_outlined,
            const Color(0xFF7555F6).withValues(alpha: 0.1),
          ),
          const SizedBox(height: 12),
          _buildCard(
            1,
            'Teach a Skill',
            'Share your knowledge and\nearn',
            Icons.lightbulb_outline,
            const Color(0xFF00B3D6).withValues(alpha: 0.1),
          ),
          const SizedBox(height: 12),
          _buildCard(
            2,
            'Both',
            'Master new skills and help\nothers',
            Icons.swap_horiz_rounded,
            const Color(0xFF7555F6).withValues(alpha: 0.1),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    int index,
    String title,
    String subtitle,
    IconData icon,
    Color iconBg,
  ) {
    bool isSelected = _selected == index;
    return GestureDetector(
      onTap: () => setState(() => _selected = index),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF7555F6).withValues(alpha: 0.04)
              : Colors.white,
          border: Border.all(
            color: isSelected
                ? const Color(0xFF7555F6)
                : const Color(0xFFE2E4EB),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isSelected
                    ? const Color(0xFF7555F6)
                    : const Color(0xFF64748B),
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF141A28),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF737A8C),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isSelected
                  ? const Color(0xFF7555F6)
                  : const Color(0xFFD1D5DB),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}

// ----------------- STEP 2 -----------------
class _InterestsStep extends StatefulWidget {
  const _InterestsStep();
  @override
  State<_InterestsStep> createState() => _InterestsStepState();
}

class _InterestsStepState extends State<_InterestsStep> {
  final List<String> interests = [
    'UI Design',
    'Python',
    'Photography',
    'Public Speaking',
    'Guitar',
    'Marketing',
    'Data Science',
    'Cooking',
    'Yoga',
    'Writing',
  ];
  final Set<String> _selected = {
    'UI Design',
    'Public Speaking',
    'Data Science',
  }; // Defaults

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Text(
            'Pick your interests',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF141A28),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Select at least 3 topics to personalize\nyour feed.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Color(0xFF737A8C)),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 8,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: interests.map((interest) {
              bool isSelected = _selected.contains(interest);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      _selected.remove(interest);
                    } else {
                      _selected.add(interest);
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF7555F6) : Colors.white,
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF7555F6)
                          : const Color(0xFFE2E4EB),
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        interest,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF141A28),
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                      if (isSelected) ...[
                        const SizedBox(width: 6),
                        const Icon(Icons.check, color: Colors.white, size: 14),
                      ],
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// ----------------- STEP 3 -----------------
class _LevelStep extends StatefulWidget {
  const _LevelStep();
  @override
  State<_LevelStep> createState() => _LevelStepState();
}

class _LevelStepState extends State<_LevelStep> {
  int _selected = 1; // Intermediate
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Text(
            'What is your level?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF141A28),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'This helps us find the right mentors\nor students for you.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Color(0xFF737A8C)),
          ),
          const SizedBox(height: 32),
          _buildCard(
            0,
            'Beginner',
            'Just starting out',
            Icons.eco_outlined,
            const Color(0xFF7555F6).withValues(alpha: 0.1),
          ),
          const SizedBox(height: 12),
          _buildCard(
            1,
            'Intermediate',
            'Have some\nexperience',
            Icons.school_outlined,
            const Color(0xFF7555F6).withValues(alpha: 0.1),
          ),
          const SizedBox(height: 12),
          _buildCard(
            2,
            'Expert',
            'Deep knowledge\nand skills',
            Icons.military_tech_outlined,
            const Color(0xFF7555F6).withValues(alpha: 0.1),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    int index,
    String title,
    String subtitle,
    IconData icon,
    Color iconBg,
  ) {
    bool isSelected = _selected == index;
    return GestureDetector(
      onTap: () => setState(() => _selected = index),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF7555F6).withValues(alpha: 0.04)
              : Colors.white,
          border: Border.all(
            color: isSelected
                ? const Color(0xFF7555F6)
                : const Color(0xFFE2E4EB),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isSelected
                    ? const Color(0xFF7555F6)
                    : const Color(0xFF64748B),
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF141A28),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF737A8C),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected
                  ? const Color(0xFF7555F6)
                  : const Color(0xFFD1D5DB),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}

// ----------------- STEP 4 -----------------
class _ProfileStep extends StatelessWidget {
  const _ProfileStep();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Tell us about\nyourself',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Color(0xFF141A28),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Help us personalize your experience.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Color(0xFF737A8C)),
            ),
            const SizedBox(height: 32),
            _buildField('Full Name *', 'e.g. Alex Johnson'),
            const SizedBox(height: 16),
            _buildField('Location', 'City, Country'),
            const SizedBox(height: 16),
            _buildField(
              'Email *',
              'name@example.com',
              icon: Icons.mail_outline,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, String hint, {IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF141A28),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
            prefixIcon: icon != null
                ? Icon(icon, color: const Color(0xFF9CA3AF), size: 18)
                : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE2E4EB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF7555F6)),
            ),
          ),
        ),
      ],
    );
  }
}
