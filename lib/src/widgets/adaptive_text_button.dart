import 'package:adaptive_ui_plus/adaptive_ui_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextButton extends StatelessWidget {
  const AdaptiveTextButton({super.key, required this.text, this.color, this.size, required this.onPressed});

  final String text;
  final Color? color;
  final int? size;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final platform = PlatformOverride.of(context);
    switch (platform) {
      case AppPlatform.iOS:
        return CupertinoButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(fontSize: size?.toDouble() ?? 18),
            ));

      case AppPlatform.android:
        return TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(fontSize: size?.toDouble() ?? 18),
            ));
    }
  }
}
