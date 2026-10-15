import 'package:flutter/material.dart';
import '../assets/app_assets.dart';
import '../colors/app_colors.dart';
import 'illustrated_avatar.dart';

enum AppAvatarType { asset, network, illustrated, initials }

/// Universal avatar component supporting asset images, network URLs,
/// illustrated avatars, and letter initials fallback with status badges.
class AppAvatar extends StatelessWidget {
  final double size;
  final String? imagePathOrUrl;
  final String? initials;
  final bool isIllustrated;
  final bool isCircular;
  final double borderRadius;
  final Color backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final bool isOnline;
  final bool showStatus;
  final VoidCallback? onTap;

  const AppAvatar({
    super.key,
    this.size = 48,
    this.imagePathOrUrl,
    this.initials,
    this.isIllustrated = false,
    this.isCircular = true,
    this.borderRadius = 16,
    this.backgroundColor = const Color(0xFFF1F5F9),
    this.borderColor,
    this.borderWidth = 0,
    this.isOnline = false,
    this.showStatus = false,
    this.onTap,
  });

  // Factory constructor for quick profile icon avatar
  factory AppAvatar.profile({
    Key? key,
    double size = 48,
    bool isOnline = false,
    bool showStatus = false,
    VoidCallback? onTap,
  }) =>
      AppAvatar(
        key: key,
        size: size,
        imagePathOrUrl: AppAssets.iconProfile,
        isOnline: isOnline,
        showStatus: showStatus,
        onTap: onTap,
      );

  // Factory constructor for illustrated avatar
  factory AppAvatar.illustrated({
    Key? key,
    double size = 48,
    Color accentColor = const Color(0xFFFDBA74),
    bool isCircular = false,
    double borderRadius = 16,
    VoidCallback? onTap,
  }) =>
      AppAvatar(
        key: key,
        size: size,
        isIllustrated: true,
        isCircular: isCircular,
        borderRadius: borderRadius,
        onTap: onTap,
      );

  // Factory constructor for user avatar icon
  factory AppAvatar.user({
    Key? key,
    double size = 48,
    VoidCallback? onTap,
  }) =>
      AppAvatar(
        key: key,
        size: size,
        imagePathOrUrl: AppAssets.iconUserAvatar,
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) {
    final effectiveRadius = isCircular ? size / 2 : borderRadius;

    Widget avatarContent;

    if (isIllustrated) {
      avatarContent = IllustratedAvatar(
        size: size,
        borderRadius: effectiveRadius,
      );
    } else if (imagePathOrUrl != null && imagePathOrUrl!.isNotEmpty) {
      final isNetwork = imagePathOrUrl!.startsWith('http://') ||
          imagePathOrUrl!.startsWith('https://');

      if (isNetwork) {
        avatarContent = Image.network(
          imagePathOrUrl!,
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _buildFallback(),
        );
      } else {
        avatarContent = Image.asset(
          imagePathOrUrl!,
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _buildFallback(),
        );
      }
    } else if (initials != null && initials!.isNotEmpty) {
      avatarContent = Center(
        child: Text(
          initials!.toUpperCase(),
          style: TextStyle(
            color: AppColors.primary,
            fontSize: size * 0.38,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      avatarContent = _buildFallback();
    }

    Widget container = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(effectiveRadius),
        border: borderColor != null && borderWidth > 0
            ? Border.all(color: borderColor!, width: borderWidth)
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(effectiveRadius),
        child: avatarContent,
      ),
    );

    if (onTap != null) {
      container = GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: container,
      );
    }

    if (!showStatus) return container;

    // Online status badge indicator
    final statusSize = size * 0.28;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        container,
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: statusSize,
            height: statusSize,
            decoration: BoxDecoration(
              color: isOnline ? AppColors.success : AppColors.textMuted,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFallback() {
    return Center(
      child: Icon(
        Icons.person_rounded,
        size: size * 0.55,
        color: AppColors.textSecondary,
      ),
    );
  }
}
