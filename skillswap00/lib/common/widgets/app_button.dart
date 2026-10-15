import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

/// Reusable primary and outlined action button for SkillSwap
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isOutlined;
  final Widget? icon;
  final double height;
  final Color? backgroundColor;
  final Color? textColor;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.icon,
    this.height = 52,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBg = backgroundColor ?? AppColors.primary;
    final effectiveTextColor = textColor ?? (isOutlined ? AppColors.primary : Colors.white);

    if (isOutlined) {
      if (icon != null) {
        return SizedBox(
          width: double.infinity,
          height: height,
          child: OutlinedButton.icon(
            onPressed: onPressed,
            icon: icon!,
            style: OutlinedButton.styleFrom(
              foregroundColor: effectiveTextColor,
              side: BorderSide(color: effectiveBg),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            label: Text(
              text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: effectiveTextColor,
              ),
            ),
          ),
        );
      }
      return SizedBox(
        width: double.infinity,
        height: height,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: effectiveTextColor,
            side: BorderSide(color: effectiveBg),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: effectiveTextColor,
            ),
          ),
        ),
      );
    }

    if (icon != null) {
      return SizedBox(
        width: double.infinity,
        height: height,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: icon!,
          style: ElevatedButton.styleFrom(
            backgroundColor: effectiveBg,
            foregroundColor: effectiveTextColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          label: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: effectiveTextColor,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: effectiveBg,
          foregroundColor: effectiveTextColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: effectiveTextColor,
          ),
        ),
      ),
    );
  }
}
