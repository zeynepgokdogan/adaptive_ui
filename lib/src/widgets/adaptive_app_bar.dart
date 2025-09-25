import 'package:adaptive_ui_plus/adaptive_ui_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveAppBar extends StatelessWidget
    implements PreferredSizeWidget, ObstructingPreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool? centerTitle;
  final double height;
  final PreferredSizeWidget? bottom;
  final Widget? flexibleSpace;

  const AdaptiveAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.centerTitle,
    this.height = kToolbarHeight,
    this.bottom,
    this.flexibleSpace,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformOverride.of(context);
    switch (platform) {
      case AppPlatform.iOS:
        return _buildCupertinoBar(context);
      case AppPlatform.android:
        return _buildMaterialBar(context);
    }
  }

  AppBar _buildMaterialBar(BuildContext context) {
    final colors = AdaptiveTheme.of(context).colors;
    final isWideScreen = MediaQuery.of(context).size.width > 600;

    return AppBar(
      title: title != null
          ? Text(
              title!,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: colors.onSurface,
                  ),
            )
          : null,
      actions: actions,
      leading: leading,
      centerTitle: centerTitle ?? !isWideScreen,
      bottom: bottom,
      flexibleSpace: flexibleSpace,
      backgroundColor: colors.surface,
      elevation: 0,
      foregroundColor: colors.onSurface,
    );
  }

  CupertinoNavigationBar _buildCupertinoBar(BuildContext context) {
    final colors = AdaptiveTheme.of(context).colors;

    final shouldAlignLeft = centerTitle == false;

    return CupertinoNavigationBar(
      middle: !shouldAlignLeft && title != null
          ? Text(
              title!,
              style: CupertinoTheme.of(context)
                  .textTheme
                  .navTitleTextStyle
                  .copyWith(color: colors.onSurface),
            )
          : null,
      leading: shouldAlignLeft && title != null
          ? Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title!,
                style: CupertinoTheme.of(context)
                    .textTheme
                    .navTitleTextStyle
                    .copyWith(color: colors.onSurface),
              ),
            )
          : leading,
      trailing: actions != null && actions!.isNotEmpty
          ? Row(mainAxisSize: MainAxisSize.min, children: actions!)
          : null,
      backgroundColor: colors.surface.withOpacity(0.95),
      border: Border(
        bottom: BorderSide(
          color: colors.onSurface.withOpacity(0.1),
          width: 0.5,
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(height + (bottom?.preferredSize.height ?? 0));

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}
