import 'package:flutter/material.dart';

class AppColors {
  final Color primary;
  final Color onPrimary;
  final Color surface;
  final Color onSurface;
  final Brightness brightness;

  const AppColors({
    required this.primary,
    required this.onPrimary,
    required this.surface,
    required this.onSurface,
    required this.brightness,
  });

  static const light = AppColors(
    primary: Colors.blue,
    onPrimary: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
    brightness: Brightness.light,
  );

  static const dark = AppColors(
    primary: Colors.blueAccent,
    onPrimary: Colors.white,
    surface: Color(0xFF121212),
    onSurface: Colors.white,
    brightness: Brightness.dark,
  );
}
