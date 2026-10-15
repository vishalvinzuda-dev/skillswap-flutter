import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
import '../theme/app_styles.dart';

enum AppBadgeVariant { primary, success, warning, danger, neutral, dark }

/// Reusable badge / pill / tag component for status indicators and skill chips
class AppBadge extends StatelessWidget {
  final String label;
  final Widget? icon;
  final AppBadgeVariant variant;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  const AppBadge({
    super.key,
    required this.label,
    this.icon,
    this.variant = AppBadgeVariant.neutral,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    this.onTap,
  });

  // Factory constructor for Skill Tag
  factory AppBadge.skill(
    String label, {
    Key? key,
    VoidCallback? onTap,
    bool isSelected = false,
  }) =>
      AppBadge(
        key: key,
        label: label,
        variant: isSelected ? AppBadgeVariant.primary : AppBadgeVariant.neutral,
        onTap: onTap,
      );

  // Status factories
  factory AppBadge.success(String label, {Key? key}) =>
      AppBadge(key: key, label: label, variant: AppBadgeVariant.success);

  factory AppBadge.warning(String label, {Key? key}) =>
      AppBadge(key: key, label: label, variant: AppBadgeVariant.warning);

  factory AppBadge.danger(String label, {Key? key}) =>
      AppBadge(key: key, label: label, variant: AppBadgeVariant.danger);

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color text;

    switch (variant) {
      case AppBadgeVariant.primary:
        bg = AppColors.primaryMuted;
        text = AppColors.primary;
        break;
      case AppBadgeVariant.success:
        bg = AppColors.successLight;
        text = AppColors.success;
        break;
      case AppBadgeVariant.warning:
        bg = AppColors.warningLight;
        text = AppColors.warning;
        break;
      case AppBadgeVariant.danger:
        bg = AppColors.dangerLight;
        text = AppColors.danger;
        break;
      case AppBadgeVariant.dark:
        bg = AppColors.darkNavBg;
        text = Colors.white;
        break;
      case AppBadgeVariant.neutral:
        bg = AppColors.surfaceMuted;
        text = AppColors.textSecondary;
        break;
    }

    final effectiveBg = backgroundColor ?? bg;
    final effectiveText = textColor ?? text;

    Widget badge = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: effectiveBg,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: AppStyles.caption.copyWith(
              color: effectiveText,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: badge,
      );
    }

    return badge;
  }
}
