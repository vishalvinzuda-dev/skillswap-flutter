import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

/// Reusable card container used for mentors, sessions, skills, and widgets
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final double borderRadius;
  final double elevation;
  final List<BoxShadow>? boxShadow;
  final double? width;
  final double? height;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.borderRadius = 16.0,
    this.elevation = 0,
    this.boxShadow,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBg = backgroundColor ?? AppColors.cardBg;
    final effectiveBorder = borderColor ?? AppColors.border;

    Widget cardContent = Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: effectiveBg,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderWidth > 0
            ? Border.all(color: effectiveBorder, width: borderWidth)
            : null,
        boxShadow: boxShadow ??
            (elevation > 0
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04 * elevation),
                      blurRadius: 8 * elevation,
                      offset: Offset(0, 2 * elevation),
                    ),
                  ]
                : null),
      ),
      child: child,
    );

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          child: cardContent,
        ),
      );
    }

    return cardContent;
  }
}
