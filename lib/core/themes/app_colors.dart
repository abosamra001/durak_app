import 'package:flutter/material.dart';

/// Durak color palettes.
///
/// Light palette: #FFC7C7, #FFE2E2, #F6F6F6, #8785A2
/// Dark palette:  #0F3040, #464858, #A56F63, #D99B7F
class AppColors {
  // --- Light palette
  static const Color lightBackground = Color(0xFFF6F6F6);
  static const Color lightSurface = Color(0xFFFFE2E2);
  static const Color lightSurfaceSubtle = Color(0xFFFFC7C7);
  static const Color lightCardColor = Color(0xFFFFE2E2);
  static const Color lightPrimary = Color(0xFFFFC7C7);
  static const Color lightSecondary = Color(0xFF8785A2);
  static const Color lightTextPrimary = Color(0xFF0F3040);
  static const Color lightTextSecondary = Color(0xFF464858);

  // --- Dark palette
  static const Color darkBackground = Color(0xFF1B262C);
  static const Color darkSurface = Color(0xFF464858);
  static const Color darkCardColor = Color(0xFF464858);
  static const Color darkSurfaceLight = Color(0xFFA56F63);
  static const Color darkPrimary = Color(0xFFD99B7F);
  static const Color darkSecondary = Color(0xFFA56F63);
  static const Color darkTextPrimary = Color(0xFFF6F6F6);
  static const Color darkTextSecondary = Color(0xFFFFE2E2);

  // Backward-compatible names used by the existing app.
  static const Color primaryAmber = darkPrimary;
  static const Color darkPrimaryAmber = darkPrimary;
  static const Color lightPrimaryAmber = lightPrimary;

  // Semantic status colors (kept separate from the brand palette).
  static const Color successColor = Color(0xFF2E8B57);
  static const Color errorColor = Color(0xFFB3261E);
}
