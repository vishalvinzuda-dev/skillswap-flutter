import 'package:flutter/material.dart';

/// Centralized color palette and design system tokens for SkillSwap
class AppColors {
  AppColors._();

  // Primary & Brand Colors
  static const Color primary = Color(0xFF7555F6);
  static const Color primaryLight = Color(0xFF8B6DF8);
  static const Color primaryDark = Color(0xFF6366F1);
  static const Color splashPurple = Color(0xFF7859FA);
  static const Color seedColor = Color(0xFF7B61FF);
  static const Color indigo = Color(0xFF4F46E5);
  static const Color primaryMuted = Color(0xFFEEF2FF);

  // Backgrounds & Surfaces (Light)
  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Colors.white;
  static const Color cardBg = Colors.white;
  static const Color surfaceMuted = Color(0xFFF1F5F9);

  // Backgrounds & Surfaces (Dark)
  static const Color backgroundDark = Color(0xFF0F172A);
  static const Color surfaceDark = Color(0xFF1E293B);
  static const Color cardBgDark = Color(0xFF1E293B);
  static const Color darkNavBg = Color(0xFF141927);

  // Text Colors
  static const Color textPrimary = Color(0xFF141A28);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textMuted = Color(0xFF94A3B8);
  static const Color textLight = Color(0xFF8C8D9E);
  static const Color textOnPrimary = Colors.white;
  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFF94A3B8);

  // Borders & Dividers
  static const Color border = Color(0xFFE2E8F0);
  static const Color borderLight = Color(0xFFF1F5F9);
  static const Color borderDark = Color(0xFF334155);

  // Semantic Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color successLight = Color(0xFFECFDF5);
  static const Color danger = Color(0xFFEF4444);
  static const Color dangerLight = Color(0xFFFEF2F2);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFFFBEB);
  static const Color info = Color(0xFF38BDF8);
  static const Color infoLight = Color(0xFFF0F9FF);

  // Accent & Tag Colors
  static const Color pink = Color(0xFFEC4899);
  static const Color avatarAccent = Color(0xFFFDBA74);
  static const Color orange = Color(0xFFF97316);
  static const Color cyan = Color(0xFF06B6D4);
  static const Color purple = Color(0xFF8B5CF6);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF7555F6), Color(0xFF6366F1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient splashGradient = LinearGradient(
    colors: [Color(0xFF7859FA), Color(0xFF5A3FE6)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient cardAccentGradient = LinearGradient(
    colors: [Color(0xFFF8FAFC), Color(0xFFF1F5F9)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
