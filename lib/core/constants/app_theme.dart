import 'package:flutter/material.dart';
import 'package:gallery/core/constants/app_colors.dart';

final appTheme = ThemeData(
  fontFamily: 'segoe',
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    centerTitle: true,
  ),
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: AppColors.primaryColor),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: const TextStyle(color: AppColors.primaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.primaryColor,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryColor,
  ).copyWith(background: Colors.white),
);
