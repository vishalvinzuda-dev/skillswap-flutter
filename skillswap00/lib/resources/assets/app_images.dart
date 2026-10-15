import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
import 'app_assets.dart';

/// Reusable widget for rendering images across the app with consistent borders,
/// fit, error handling, and placeholder loading.
class AppImage extends StatelessWidget {
  final String pathOrUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;
  final Color? placeholderColor;
  final Widget? placeholder;
  final Widget? errorWidget;

  const AppImage({
    super.key,
    required this.pathOrUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = 0.0,
    this.placeholderColor,
    this.placeholder,
    this.errorWidget,
  });

  bool get _isNetwork =>
      pathOrUrl.startsWith('http://') || pathOrUrl.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (_isNetwork) {
      imageWidget = Image.network(
        pathOrUrl,
        width: width,
        height: height,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return placeholder ??
              Container(
                width: width,
                height: height,
                color: placeholderColor ?? AppColors.surfaceMuted,
                child: const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              );
        },
        errorBuilder: (context, error, stackTrace) {
          return errorWidget ?? _defaultErrorWidget();
        },
      );
    } else {
      imageWidget = Image.asset(
        pathOrUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return errorWidget ?? _defaultErrorWidget();
        },
      );
    }

    if (borderRadius > 0) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: imageWidget,
      );
    }

    return imageWidget;
  }

  Widget _defaultErrorWidget() {
    return Container(
      width: width,
      height: height,
      color: AppColors.surfaceMuted,
      child: const Center(
        child: Icon(
          Icons.broken_image_rounded,
          color: AppColors.textMuted,
          size: 24,
        ),
      ),
    );
  }
}

/// Specialized widget for rendering app icon assets with optional tinting and background box
class AppIconImage extends StatelessWidget {
  final String assetPath;
  final double size;
  final Color? tintColor;
  final Color? backgroundColor;
  final double borderRadius;
  final EdgeInsets padding;

  const AppIconImage({
    super.key,
    required this.assetPath,
    this.size = 24.0,
    this.tintColor,
    this.backgroundColor,
    this.borderRadius = 8.0,
    this.padding = EdgeInsets.zero,
  });

  // Factory constructors for pre-defined app assets
  factory AppIconImage.userAvatar({double size = 24.0}) => AppIconImage(
        assetPath: AppAssets.iconUserAvatar,
        size: size,
      );

  factory AppIconImage.profile({double size = 24.0}) => AppIconImage(
        assetPath: AppAssets.iconProfile,
        size: size,
      );

  factory AppIconImage.skillGear({double size = 24.0}) => AppIconImage(
        assetPath: AppAssets.iconSkillGear,
        size: size,
      );

  factory AppIconImage.monitor({double size = 24.0}) => AppIconImage(
        assetPath: AppAssets.illustrationMonitor,
        size: size,
      );

  @override
  Widget build(BuildContext context) {
    Widget icon = Image.asset(
      assetPath,
      width: size,
      height: size,
      color: tintColor,
      fit: BoxFit.contain,
    );

    if (backgroundColor != null || padding != EdgeInsets.zero) {
      icon = Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: icon,
      );
    }

    return icon;
  }
}
