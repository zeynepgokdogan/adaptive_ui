import 'package:adaptive_ui/adaptive_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveScaffold extends StatelessWidget {
  final AdaptiveAppBar? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final AdaptiveBottomNavigationBar? bottomNavigationBar;
  final Color? backgroundColor;

  const AdaptiveScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformOverride.of(context);

    switch (platform) {
      case AppPlatform.iOS:
        return CupertinoPageScaffold(
          navigationBar: appBar?.cupertinoNavigationBar(),
          backgroundColor: backgroundColor,
          child: SafeArea(
            child: Column(
              children: [
                Expanded(child: body),
                if (bottomNavigationBar != null) bottomNavigationBar!.build(context),
              ],
            ),
          ),
        );

      case AppPlatform.android:
        return Scaffold(
          appBar: appBar?.androidAppBar(),
          body: body,
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
          backgroundColor: backgroundColor,
        );

      default:
        return Scaffold(
          body: SafeArea(child: body),
        );
    }
  }
}
