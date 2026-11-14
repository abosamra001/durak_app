import 'app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager {
  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: .dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.darkPrimaryAmber,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimaryAmber,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkTextPrimary,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.primaryAmber,
        fontSize: 18.sp,
        fontWeight: .bold,
      ),
      iconTheme: IconThemeData(color: AppColors.darkPrimaryAmber),
      actionsIconTheme: IconThemeData(color: AppColors.darkPrimaryAmber),
    ),
    cardColor: AppColors.darkCardColor,
    fontFamily: GoogleFonts.cairo().fontFamily,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkTextPrimary),
      bodyMedium: TextStyle(color: AppColors.darkTextSecondary),
      bodySmall: TextStyle(color: AppColors.darkTextSecondary),
    ),
  );

  // -------- Light Theme -----------
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.lightPrimaryAmber,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimaryAmber,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightTextPrimary,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.lightTextPrimary,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: AppColors.lightPrimaryAmber),
      actionsIconTheme: IconThemeData(color: AppColors.lightPrimaryAmber),
    ),
    cardColor: AppColors.lightSurfaceSubtle,
    fontFamily: GoogleFonts.cairo().fontFamily,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.lightTextPrimary),
      bodyMedium: TextStyle(color: AppColors.lightTextSecondary),
      bodySmall: TextStyle(color: AppColors.lightTextSecondary),
    ),
  );
}
