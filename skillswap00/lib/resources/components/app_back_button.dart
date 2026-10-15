import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

/// Reusable rounded back button used across Auth, Details, and Form screens
class AppBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color borderColor;
  final Color iconColor;
  final Color backgroundColor;
  final double size;
  final double borderRadius;

  const AppBackButton({
    super.key,
    this.onTap,
    this.borderColor = AppColors.border,
    this.iconColor = AppColors.textPrimary,
    this.backgroundColor = Colors.white,
    this.size = 40,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap ?? () => Navigator.of(context).pop(),
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Center(
            child: Icon(
              Icons.chevron_left_rounded,
              color: iconColor,
              size: size * 0.6,
            ),
          ),
        ),
      ),
    );
  }
}
