import 'package:flutter/material.dart';

class AppColors {
  // --- Dark Theme Colors
  static const Color darkBackground = Color(0xFF121212); // أسود الخلفية العام
  static const Color darkSurface = Color(
    0xFF1A1A1A,
  ); // لون الكروت والبطاقات الداكنة
  static const Color darkCardColor = Color(
    0xFF2A2A2A,
  ); // لون الكروت والبطاقات الداكنة
  static const Color darkSurfaceLight = Color(0xFF2A2A2A); // للبطاقات الفرعية

  static const Color primaryAmber = Color(
    0xFFF39C12,
  ); // البرتقالي/الذهبي الأساسي (أزرار وأيقونات نشطة)
  static const Color darkPrimaryAmber = Color(
    0xFFD68910,
  ); // درجة برتقالية أغمق للتفاعل

  static const Color darkTextPrimary = Color(
    0xFFFFFFFF,
  ); // النصوص الرئيسية بيضاء
  static const Color darkTextSecondary = Color(
    0xFFB0B0B0,
  ); // النصوص الفرعية رمادية

  // --- Light Theme Colors
  static const Color lightBackground = Color(0xFFF8F9FA); // خلفية فاتحة ونظيفة
  static const Color lightSurface = Color(0xFFFFFFFF); // كروت بيضاء صافية
  static const Color lightSurfaceSubtle = Color(
    0xFFF1F3F5,
  ); // خلفيات ثانوية فاتحة

  static const Color lightPrimaryAmber = Color(
    0xFFE67E22,
  ); // نفس روح البرتقالي ولكن متلائمة مع الإضاءة

  static const Color lightTextPrimary = Color(0xFF212529); // نصوص سوداء واضحة
  static const Color lightTextSecondary = Color(
    0xFF6C757D,
  ); // نصوص فرعية رمادية داكنة
}
