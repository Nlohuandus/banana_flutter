import 'package:banana_flutter/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      color: AppColors.primary,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primary),
      ),
    ),
  );
}
