import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  AppStyles._();

  static const TextStyle headingLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle headingSmall = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyRegular = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodyBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textMuted,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
