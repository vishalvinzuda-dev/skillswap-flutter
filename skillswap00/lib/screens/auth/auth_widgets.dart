import 'package:flutter/material.dart';
import '../../common/widgets/app_back_button.dart';
import '../../common/widgets/app_button.dart';
import '../../common/widgets/app_text_field.dart';
import '../../core/constants/app_colors.dart';

export '../../common/widgets/app_back_button.dart';
export '../../common/widgets/app_button.dart';
export '../../common/widgets/app_text_field.dart';

Widget buildIconBubble(IconData icon) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppColors.primary.withValues(alpha: 0.1),
      shape: BoxShape.circle,
    ),
    child: Icon(icon, color: AppColors.primary, size: 24),
  );
}

Widget buildBackButton(BuildContext context) {
  return AppBackButton(onTap: () => Navigator.of(context).pop());
}

Widget buildField(
  String label,
  String hint, {
  IconData? icon,
  bool isPassword = false,
  TextEditingController? controller,
}) {
  return AppTextField(
    label: label,
    hint: hint,
    icon: icon,
    isPassword: isPassword,
    controller: controller,
  );
}

Widget buildButton(String text, VoidCallback onPressed) {
  return AppButton(text: text, onPressed: onPressed);
}
