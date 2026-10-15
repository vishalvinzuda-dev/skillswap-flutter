import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
import '../theme/app_styles.dart';

/// Centralized branded loading spinner for SkillSwap
class AppLoadingIndicator extends StatelessWidget {
  final double size;
  final Color? color;
  final double strokeWidth;
  final String? message;

  const AppLoadingIndicator({
    super.key,
    this.size = 28,
    this.color,
    this.strokeWidth = 2.5,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    final spinner = SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.primary),
      ),
    );

    if (message != null && message!.isNotEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          spinner,
          const SizedBox(height: 12),
          Text(
            message!,
            style: AppStyles.captionRegular.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      );
    }

    return spinner;
  }
}

/// Simple skeleton container for loading placeholders
class AppSkeleton extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  final Color? color;

  const AppSkeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 8,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
