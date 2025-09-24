import 'package:adaptive_ui_plus/adaptive_ui_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem> items;

  // Özelleştirilebilir parametreler
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double? iconSize;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final bool showLabels;

  const AdaptiveBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.iconSize,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.showLabels = true,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformOverride.of(context);

    switch (platform) {
      case AppPlatform.iOS:
        return CupertinoTabBar(
          currentIndex: currentIndex,
          onTap: onTap,
          items: items,
          backgroundColor: backgroundColor ?? CupertinoColors.systemBackground,
          activeColor: selectedItemColor ?? CupertinoColors.activeBlue,
          inactiveColor: unselectedItemColor ?? CupertinoColors.inactiveGray,
        );

      case AppPlatform.android:
        return BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          items: items,
          backgroundColor: backgroundColor ?? Colors.white,
          selectedItemColor: selectedItemColor ?? Theme.of(context).primaryColor,
          unselectedItemColor: unselectedItemColor ?? Colors.grey,
          iconSize: iconSize ?? 24.0,
          selectedLabelStyle: selectedLabelStyle,
          unselectedLabelStyle: unselectedLabelStyle,
          showSelectedLabels: showLabels,
          showUnselectedLabels: showLabels,
          type: BottomNavigationBarType.fixed,
        );
    }
  }
}
