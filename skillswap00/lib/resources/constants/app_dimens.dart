import 'package:flutter/material.dart';

/// Standard dimensions, spacing, paddings, and radii across SkillSwap
class AppDimens {
  AppDimens._();

  // Spacing & Margins
  static const double space2 = 2.0;
  static const double space4 = 4.0;
  static const double space8 = 8.0;
  static const double space12 = 12.0;
  static const double space16 = 16.0;
  static const double space20 = 20.0;
  static const double space24 = 24.0;
  static const double space28 = 28.0;
  static const double space32 = 32.0;
  static const double space40 = 40.0;
  static const double space48 = 48.0;
  static const double space64 = 64.0;

  // Screen Padding
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: space24);
  static const EdgeInsets screenPaddingWithTop = EdgeInsets.fromLTRB(space24, space24, space24, space16);

  // Border Radii
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusXLarge = 24.0;
  static const double radiusRound = 999.0;

  static final BorderRadius borderRadiusSmall = BorderRadius.circular(radiusSmall);
  static final BorderRadius borderRadiusMedium = BorderRadius.circular(radiusMedium);
  static final BorderRadius borderRadiusLarge = BorderRadius.circular(radiusLarge);
  static final BorderRadius borderRadiusXLarge = BorderRadius.circular(radiusXLarge);
  static final BorderRadius borderRadiusRound = BorderRadius.circular(radiusRound);

  // Icon Sizes
  static const double iconSmall = 16.0;
  static const double iconMedium = 20.0;
  static const double iconRegular = 24.0;
  static const double iconLarge = 32.0;
  static const double iconXLarge = 48.0;

  // Component Heights
  static const double buttonHeight = 52.0;
  static const double buttonHeightSmall = 40.0;
  static const double inputHeight = 52.0;
  static const double appBarHeight = 56.0;
  static const double bottomNavHeight = 72.0;

  // Avatar Sizes
  static const double avatarSmall = 36.0;
  static const double avatarMedium = 48.0;
  static const double avatarRegular = 54.0;
  static const double avatarLarge = 72.0;
  static const double avatarXLarge = 96.0;
}
