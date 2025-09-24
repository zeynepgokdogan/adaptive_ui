import 'package:adaptive_ui_plus/adaptive_ui_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveIconButton extends StatelessWidget {
  const AdaptiveIconButton({
    super.key,
    this.icon,
    required this.text,
    this.color,
    this.width,
    this.height,
    required this.onPressed,
  });

  final Widget? icon;
  final String text;
  final Color? color;
  final double? width;
  final double? height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final platform = PlatformOverride.of(context);

    final btnChild = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          icon!,
          const SizedBox(width: 8),
        ],
        Text(
          text,
          style: TextStyle(color: CupertinoColors.white),
        ),
      ],
    );

    switch (platform) {
      case AppPlatform.iOS:
        return SizedBox(
          width: width,
          height: height,
          child: CupertinoButton(
            color: color ?? CupertinoColors.activeBlue,
            onPressed: onPressed,
            child: btnChild,
          ),
        );

      case AppPlatform.android:
        return SizedBox(
          width: width,
          height: height,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color ?? Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: onPressed,
            child: btnChild,
          ),
        );
    }
  }
}
