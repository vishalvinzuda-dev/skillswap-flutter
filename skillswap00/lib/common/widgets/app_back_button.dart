import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

/// Reusable rounded back button used across Auth, Details, and Form screens
class AppBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color borderColor;
  final Color iconColor;
  final double size;

  const AppBackButton({
    super.key,
    this.onTap,
    this.borderColor = AppColors.border,
    this.iconColor = AppColors.textPrimary,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigator.of(context).pop(),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Icon(
            Icons.chevron_left_rounded,
            color: iconColor,
            size: 24,
          ),
        ),
      ),
    );
  }
}
