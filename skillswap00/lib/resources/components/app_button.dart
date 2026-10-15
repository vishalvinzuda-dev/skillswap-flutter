import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
import '../theme/app_styles.dart';

enum AppButtonVariant { primary, outlined, secondary, ghost }

/// Highly customizable and reusable action button for SkillSwap
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isOutlined;
  final bool isLoading;
  final Widget? icon;
  final double height;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final EdgeInsets? padding;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isOutlined = false,
    this.isLoading = false,
    this.icon,
    this.height = 52,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 16,
    this.padding,
  });

  // Secondary variant constructor
  factory AppButton.secondary({
    Key? key,
    required String text,
    required VoidCallback? onPressed,
    Widget? icon,
    bool isLoading = false,
    double height = 52,
  }) =>
      AppButton(
        key: key,
        text: text,
        onPressed: onPressed,
        variant: AppButtonVariant.secondary,
        icon: icon,
        isLoading: isLoading,
        height: height,
      );

  // Outlined variant constructor
  factory AppButton.outlined({
    Key? key,
    required String text,
    required VoidCallback? onPressed,
    Widget? icon,
    bool isLoading = false,
    double height = 52,
  }) =>
      AppButton(
        key: key,
        text: text,
        onPressed: onPressed,
        isOutlined: true,
        variant: AppButtonVariant.outlined,
        icon: icon,
        isLoading: isLoading,
        height: height,
      );

  @override
  Widget build(BuildContext context) {
    final effectiveIsOutlined = isOutlined || variant == AppButtonVariant.outlined;
    final effectiveBg = backgroundColor ??
        (variant == AppButtonVariant.secondary
            ? AppColors.darkNavBg
            : AppColors.primary);

    final effectiveTextColor = textColor ??
        (effectiveIsOutlined
            ? (backgroundColor ?? AppColors.primary)
            : Colors.white);

    final labelWidget = isLoading
        ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2.2,
              valueColor: AlwaysStoppedAnimation<Color>(effectiveTextColor),
            ),
          )
        : Text(
            text,
            style: AppStyles.buttonText.copyWith(
              color: effectiveTextColor,
              fontSize: height <= 44 ? 14 : 16,
            ),
          );

    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: effectiveBg,
      foregroundColor: effectiveTextColor,
      elevation: 0,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );

    final outlinedStyle = OutlinedButton.styleFrom(
      foregroundColor: effectiveTextColor,
      side: BorderSide(color: backgroundColor ?? AppColors.primary, width: 1.2),
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );

    Widget button;

    if (effectiveIsOutlined) {
      if (icon != null && !isLoading) {
        button = OutlinedButton.icon(
          onPressed: isLoading ? null : onPressed,
          icon: icon!,
          style: outlinedStyle,
          label: labelWidget,
        );
      } else {
        button = OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: outlinedStyle,
          child: labelWidget,
        );
      }
    } else {
      if (icon != null && !isLoading) {
        button = ElevatedButton.icon(
          onPressed: isLoading ? null : onPressed,
          icon: icon!,
          style: buttonStyle,
          label: labelWidget,
        );
      } else {
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: buttonStyle,
          child: labelWidget,
        );
      }
    }

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: button,
    );
  }
}
