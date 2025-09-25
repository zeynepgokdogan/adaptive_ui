// ignore_for_file: deprecated_member_use

import 'package:adaptive_ui_plus/adaptive_ui_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveBottomNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem> items;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double? iconSize;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final bool showLabels;
  final bool useMaterial3;

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
    this.useMaterial3 = false,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformOverride.of(context);

    switch (platform) {
      case AppPlatform.iOS:
        return _buildCupertinoBar(context);
      case AppPlatform.android:
        return useMaterial3
            ? _buildMaterial3Bar(context)
            : _buildMaterialBar(context);
    }
  }

  CupertinoTabBar _buildCupertinoBar(BuildContext context) {
    final colors = AdaptiveTheme.of(context).colors;

    return CupertinoTabBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: items,
      backgroundColor: backgroundColor ?? colors.surface,
      activeColor: selectedItemColor ?? colors.primary,
      inactiveColor: unselectedItemColor ?? CupertinoColors.inactiveGray,
    );
  }

  BottomNavigationBar _buildMaterialBar(BuildContext context) {
    final colors = AdaptiveTheme.of(context).colors;
    final theme = Theme.of(context);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: items,
      backgroundColor: backgroundColor ?? colors.surface,
      selectedItemColor: selectedItemColor ?? colors.primary,
      unselectedItemColor: unselectedItemColor ?? theme.disabledColor,
      iconSize: iconSize ?? 24.0,
      selectedLabelStyle: selectedLabelStyle ??
          theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
      unselectedLabelStyle: unselectedLabelStyle ?? theme.textTheme.labelMedium,
      showSelectedLabels: showLabels,
      showUnselectedLabels: showLabels,
      type: BottomNavigationBarType.fixed,
    );
  }

  NavigationBar _buildMaterial3Bar(BuildContext context) {
    final colors = AdaptiveTheme.of(context).colors;

    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      backgroundColor: backgroundColor ?? colors.surface,
      indicatorColor: selectedItemColor?.withOpacity(0.2) ??
          colors.primary.withOpacity(0.2),
      destinations: items
          .map((item) => NavigationDestination(
                icon: item.icon,
                selectedIcon: item.activeIcon,
                label: item.label ?? '',
              ))
          .toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kBottomNavigationBarHeight);
}
