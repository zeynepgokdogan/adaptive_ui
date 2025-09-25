import 'package:adaptive_ui_plus/adaptive_ui_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextButton extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final VoidCallback onPressed;

  const AdaptiveTextButton({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.padding,
    this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformOverride.of(context);
    final colors = AdaptiveTheme.of(context).colors;

    final effectiveStyle = textStyle ??
        TextStyle(
          fontSize: fontSize ?? 16,
          fontWeight: FontWeight.w500,
          color: color ?? colors.primary,
        );

    switch (platform) {
      case AppPlatform.iOS:
        return CupertinoButton(
          padding: padding ?? EdgeInsets.zero,
          onPressed: onPressed,
          child: Text(text, style: effectiveStyle),
        );

      case AppPlatform.android:
        return TextButton(
          style: TextButton.styleFrom(
            foregroundColor: color ?? colors.primary,
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          ),
          onPressed: onPressed,
          child: Text(text, style: effectiveStyle),
        );
    }
  }
}
