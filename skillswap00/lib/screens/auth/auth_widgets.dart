import 'package:flutter/material.dart';

Widget buildIconBubble(IconData icon) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: const Color(0xFF7555F6).withValues(alpha: 0.1),
      shape: BoxShape.circle,
    ),
    child: Icon(icon, color: const Color(0xFF7555F6), size: 24),
  );
}

Widget buildBackButton(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.pop(context),
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE2E4EB)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.chevron_left_rounded,
        color: Color(0xFF141A28),
        size: 24,
      ),
    ),
  );
}

Widget buildField(
  String label,
  String hint, {
  IconData? icon,
  bool isPassword = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color(0xFF141A28),
        ),
      ),
      const SizedBox(height: 8),
      TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
          prefixIcon: icon != null
              ? Icon(icon, color: const Color(0xFF9CA3AF), size: 18)
              : null,
          suffixIcon: isPassword
              ? const Icon(
                  Icons.visibility_off_outlined,
                  color: Color(0xFF9CA3AF),
                  size: 18,
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFE2E4EB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF7555F6)),
          ),
        ),
      ),
    ],
  );
}

Widget buildButton(String text, VoidCallback onPressed) {
  return SizedBox(
    width: double.infinity,
    height: 52,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF7555F6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
