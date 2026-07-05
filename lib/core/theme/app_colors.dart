import 'package:flutter/material.dart';

/// Brand color palette. A single source of truth so light/dark themes
/// stay in sync and nobody hardcodes a hex value in a widget.
class AppColors {
  const AppColors._();

  static const Color primarySeed = Color(0xFF2F6FED); // GitHub-adjacent blue
  static const Color success = Color(0xFF2EA043);
  static const Color warning = Color(0xFFD29922);
  static const Color danger = Color(0xFFDA3633);

  static const Color lightBackground = Color(0xFFF6F8FA);
  static const Color lightSurface = Color(0xFFFFFFFF);

  static const Color darkBackground = Color(0xFF0D1117);
  static const Color darkSurface = Color(0xFF161B22);
}
