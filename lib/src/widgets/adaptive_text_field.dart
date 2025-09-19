import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_ui/adaptive_ui.dart';

class AdaptiveTextField extends StatelessWidget {
  const AdaptiveTextField({
    super.key,
    this.width,
    this.height,
    this.textColor,
    this.textSize,
    this.backgroundColor,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.maxLines = 1,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.controller,
    required this.labelText,
    required this.hintText,
  });

  final double? width;
  final double? height;
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final Color? textColor;
  final double? textSize;
  final Color? backgroundColor;
  final bool obscureText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final int maxLines;
  final double borderRadius;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final platform = PlatformOverride.of(context);

    final textStyle = TextStyle(
      color: textColor ?? Colors.black,
      fontSize: textSize ?? 16,
    );

    switch (platform) {
      case AppPlatform.iOS:
        return SizedBox(
          width: width,
          height: height,
          child: CupertinoTextField(
            controller: controller,
            placeholder: hintText,
            style: textStyle,
            obscureText: obscureText,
            keyboardType: keyboardType,
            maxLines: maxLines,
            padding: padding,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            decoration: BoxDecoration(
              color: backgroundColor ?? CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        );

      case AppPlatform.android:
        return SizedBox(
          width: width,
          height: height,
          child: TextField(
            controller: controller,
            style: textStyle,
            obscureText: obscureText,
            keyboardType: keyboardType,
            maxLines: maxLines,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              filled: true,
              fillColor: backgroundColor ?? Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              contentPadding: padding,
            ),
          ),
        );
    }
  }
}
