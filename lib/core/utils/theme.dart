import 'package:flutter/material.dart';
import 'package:netguru_values/core/utils/app_colors.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: AppColor.netguruGreen,
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: AppColor.netguruGreen,
      backgroundColor: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.dark(
        primary: AppColor.netguruGreen,
      ),
      appBarTheme: const AppBarTheme(
          foregroundColor: AppColor.netguruGreen,
          backgroundColor: Colors.black));
}
