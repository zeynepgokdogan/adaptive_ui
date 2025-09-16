import 'package:adaptive_ui/adaptive_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;

  const AdaptiveAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformOverride.of(context);

    switch (platform) {
      case AppPlatform.iOS:
        return CupertinoNavigationBar(
          middle: title != null ? Text(title!) : null,
          leading: leading,
          trailing: actions != null && actions!.isNotEmpty
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: actions!,
                )
              : null,
        );

      case AppPlatform.android:
      default:
        return AppBar(
          title: title != null ? Text(title!) : null,
          actions: actions,
          leading: leading,
          centerTitle: centerTitle,
        );
    }
  }

  @override
  Size get preferredSize {
    // Material AppBar ve CupertinoNavigationBar'ın yükseklikleri farklı.
    return const Size.fromHeight(kToolbarHeight);
  }
}
