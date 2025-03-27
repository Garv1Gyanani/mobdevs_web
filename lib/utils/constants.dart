import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF007BFF); // Example: Blue
  static const Color secondaryColor = Color(0xFF6C757D); // Example: Grey
  static const Color textColor = Color(0xFF343A40); // Example: Dark Grey
  static const Color backgroundColor = Color(0xFFF8F9FA); // Example: Light Grey
  static const Color whiteColor = Colors.white;
}

class AppFonts {
  static const TextStyle heading1 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );
    static const TextStyle heading2 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: AppColors.textColor,
  );
}

class AppSizes {
  static const double sectionPadding = 64.0;
  static const double buttonRadius = 8.0;
}