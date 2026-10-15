/// Global constants for the SkillSwap application
class AppConstants {
  AppConstants._();

  // App Identity
  static const String appName = 'SkillSwap';
  static const String appVersion = '0.1.0';

  // Layout & Spacing
  static const double defaultPadding = 24.0;
  static const double cardRadius = 16.0;
  static const double buttonRadius = 16.0;

  // Animation & Durations
  static const int splashDurationMs = 2400;
  static const int pageTransitionDurationMs = 300;
  static const int animationDurationShortMs = 150;
  static const int animationDurationMediumMs = 300;
  static const int animationDurationLongMs = 500;

  static const Duration splashDuration = Duration(milliseconds: splashDurationMs);
  static const Duration shortDuration = Duration(milliseconds: animationDurationShortMs);
  static const Duration normalDuration = Duration(milliseconds: animationDurationMediumMs);
  static const Duration longDuration = Duration(milliseconds: animationDurationLongMs);
}
