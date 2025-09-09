import 'package:flutter/material.dart';

class Spacing {
  static const xs = 8.0, sm = 12.0, md = 16.0, lg = 24.0;
}

class Radii {
  static const sm = 8.0, md = 12.0, lg = 16.0;
}

class AppColors {
  final Color primary;
  final Color onPrimary;
  final Color surface;
  final Color onSurface;

  const AppColors({
    required this.primary,
    required this.onPrimary,
    required this.surface,
    required this.onSurface,
  });

  static const light = AppColors(
    primary: Color(0xFF4F46E5),
    onPrimary: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
  );
}
