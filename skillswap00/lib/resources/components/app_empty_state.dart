import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
import '../theme/app_styles.dart';
import 'app_button.dart';

/// Reusable empty state view with icon, title, description, and optional action
class AppEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final Widget? customIllustration;
  final EdgeInsets padding;

  const AppEmptyState({
    super.key,
    this.icon = Icons.inbox_rounded,
    required this.title,
    required this.description,
    this.buttonText,
    this.onButtonPressed,
    this.customIllustration,
    this.padding = const EdgeInsets.all(32),
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (customIllustration != null)
              customIllustration!
            else
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primaryMuted,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    icon,
                    size: 38,
                    color: AppColors.primary,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppStyles.headingSmall.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: AppStyles.bodyRegular.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            if (buttonText != null && onButtonPressed != null) ...[
              const SizedBox(height: 24),
              SizedBox(
                width: 180,
                child: AppButton(
                  text: buttonText!,
                  onPressed: onButtonPressed,
                  height: 46,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
