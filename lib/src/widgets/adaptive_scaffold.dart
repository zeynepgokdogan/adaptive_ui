// ignore_for_file: deprecated_member_use

import 'package:adaptive_ui_plus/adaptive_ui_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveScaffold extends StatelessWidget {
  final AdaptiveAppBar? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final AdaptiveBottomNavigationBar? bottomNavigationBar;
  final Color? backgroundColor;
  final Widget? drawer;
  final Widget? endDrawer;
  final bool resizeToAvoidBottomInset;

  const AdaptiveScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.drawer,
    this.endDrawer,
    this.resizeToAvoidBottomInset = true,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformOverride.of(context);

    switch (platform) {
      case AppPlatform.iOS:
        return _buildCupertino(context);
      case AppPlatform.android:
        return _buildMaterial(context);
    }
  }

  Widget _buildCupertino(BuildContext context) {
    final colors = AdaptiveTheme.of(context).colors;

    return CupertinoPageScaffold(
      navigationBar: appBar,
      backgroundColor: backgroundColor ?? colors.surface,
      child: SafeArea(
        bottom: bottomNavigationBar != null,
        child: Column(
          children: [
            Expanded(child: body),
            if (bottomNavigationBar != null)
              DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.surface.withOpacity(0.95),
                  border: Border(
                    top: BorderSide(
                      color: colors.onSurface.withOpacity(0.1),
                      width: 0.5,
                    ),
                  ),
                ),
                child: bottomNavigationBar!,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterial(BuildContext context) {
    final colors = AdaptiveTheme.of(context).colors;
    final isWideScreen = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        top: appBar == null,
        child: Row(
          children: [
            if (isWideScreen && drawer != null) ...[
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 280),
                child: drawer,
              ),
              VerticalDivider(
                  width: 0.5, color: colors.onSurface.withOpacity(0.1)),
            ],
            Expanded(child: body),
            if (isWideScreen && endDrawer != null) ...[
              VerticalDivider(
                  width: 0.5, color: colors.onSurface.withOpacity(0.1)),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 280),
                child: endDrawer,
              ),
            ],
          ],
        ),
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar != null
          ? DecoratedBox(
              decoration: BoxDecoration(
                color: backgroundColor ?? colors.surface,
                border: Border(
                  top: BorderSide(
                    color: colors.onSurface.withOpacity(0.08),
                    width: 0.5,
                  ),
                ),
              ),
              child: bottomNavigationBar!,
            )
          : null,
      backgroundColor: backgroundColor ?? colors.surface,
      drawer: isWideScreen ? null : drawer,
      endDrawer: isWideScreen ? null : endDrawer,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}
