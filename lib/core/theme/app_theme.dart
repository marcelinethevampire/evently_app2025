import 'package:evently_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme{
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.wity,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.wity,
      centerTitle: true,
    )
  );
}