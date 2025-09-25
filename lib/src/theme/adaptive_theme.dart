import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tokens.dart';

class AdaptiveTheme extends InheritedWidget {
  final AppColors colors;

  const AdaptiveTheme({
    super.key,
    required super.child,
    required this.colors,
  });

  static AdaptiveTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AdaptiveTheme>() ??
        AdaptiveTheme(colors: AppColors.light, child: const SizedBox());
  }

  static ThemeData material(AppColors c, {bool useMaterial3 = true}) {
    return ThemeData(
      useMaterial3: useMaterial3,
      colorScheme: ColorScheme.fromSeed(
        seedColor: c.primary,
        brightness: c.brightness,
      ),
      scaffoldBackgroundColor: c.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: c.surface,
        foregroundColor: c.onSurface,
        elevation: 0,
      ),
    );
  }

  static CupertinoThemeData cupertino(AppColors c) {
    return CupertinoThemeData(
      primaryColor: c.primary,
      scaffoldBackgroundColor: c.surface,
      barBackgroundColor: c.surface,
      textTheme: CupertinoTextThemeData(
        primaryColor: c.onSurface,
      ),
      brightness: c.brightness,
    );
  }

  @override
  bool updateShouldNotify(AdaptiveTheme oldWidget) =>
      colors != oldWidget.colors;
}
