/// Centralized asset paths for SkillSwap
class AppAssets {
  AppAssets._();

  // Root Directories
  static const String imagesPath = 'assets/images';
  static const String iconsPath = 'assets/icons';

  // Images & Illustrations
  static const String avatarIllustrated = 'assets/images/avatar_illustrated.png';
  static const String illustrationMonitor = 'assets/images/illustration_monitor.png';

  // Profile & Feature Icons
  static const String iconUserAvatar = 'assets/icons/ic_user_avatar.png';
  static const String iconSkillGear = 'assets/icons/ic_skill_gear.png';
  static const String iconProfile = 'assets/icons/ic_profile.png';

  // Convenient Lists
  static const List<String> allImages = [
    avatarIllustrated,
    illustrationMonitor,
  ];

  static const List<String> allIcons = [
    iconUserAvatar,
    iconSkillGear,
    iconProfile,
  ];
}
