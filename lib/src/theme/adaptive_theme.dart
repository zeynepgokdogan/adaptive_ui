import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tokens.dart';

class AdaptiveTheme extends InheritedWidget {
  final AppColors colors;

  const AdaptiveTheme({
    super.key,
    required super.child,
    this.colors = AppColors.light,
  });

  static AdaptiveTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AdaptiveTheme>() ??
      const AdaptiveTheme(child: SizedBox());

  static ThemeData material(AppColors c) => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: c.primary),
        scaffoldBackgroundColor: c.surface,
      );

  static CupertinoThemeData cupertino(AppColors c) => CupertinoThemeData(
        primaryColor: c.primary,
        scaffoldBackgroundColor: c.surface,
      );

  @override
  bool updateShouldNotify(AdaptiveTheme old) => colors != old.colors;
}
