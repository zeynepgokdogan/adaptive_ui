import 'package:adaptive_ui_plus/adaptive_ui_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveIconButton extends StatelessWidget {
  final Widget? icon;
  final String text;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final VoidCallback onPressed;

  const AdaptiveIconButton({
    super.key,
    this.icon,
    required this.text,
    this.color,
    this.textColor,
    this.width,
    this.height,
    this.padding,
    this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformOverride.of(context);
    final colors = AdaptiveTheme.of(context).colors;

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
          style: textStyle ??
              Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: textColor ?? colors.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
        ),
      ],
    );

    switch (platform) {
      case AppPlatform.iOS:
        return SizedBox(
          width: width,
          height: height,
          child: CupertinoButton.filled(
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            borderRadius: BorderRadius.circular(12),
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
              backgroundColor: color ?? colors.primary,
              foregroundColor: textColor ?? colors.onPrimary,
              padding: padding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
            ),
            onPressed: onPressed,
            child: btnChild,
          ),
        );
    }
  }
}
