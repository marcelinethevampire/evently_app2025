import 'package:flutter/material.dart';

import 'app_colors.dart';


abstract class AppThemeManager {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primary,
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
      selectedItemColor: AppColors.wity,
      unselectedItemColor: AppColors.wity,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF101127),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primary,
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
      selectedItemColor: AppColors.wity,
      unselectedItemColor: AppColors.wity,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
  );
}