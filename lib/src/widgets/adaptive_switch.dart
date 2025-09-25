import 'package:adaptive_ui_plus/adaptive_ui_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AdaptiveSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final Color? inactiveTrackColor;
  final Color? thumbColor;
  final EdgeInsetsGeometry? padding;
  final DragStartBehavior dragStartBehavior;

  const AdaptiveSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.inactiveTrackColor,
    this.thumbColor,
    this.padding,
    this.dragStartBehavior = DragStartBehavior.start,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformOverride.of(context);

    switch (platform) {
      case AppPlatform.iOS:
        return _buildCupertinoSwitch(context);
      case AppPlatform.android:
        return _buildMaterialSwitch(context);
      default:
        return _buildMaterialSwitch(context);
    }
  }

  Widget _buildCupertinoSwitch(BuildContext context) {
    final colors = AdaptiveTheme.of(context).colors;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: CupertinoSwitch(
        value: value,
        onChanged: onChanged,
        activeTrackColor: activeColor ?? colors.primary,
        inactiveTrackColor: inactiveTrackColor ?? colors.surface.withOpacity(0.3),
        thumbColor: thumbColor ?? colors.onSurface,
        dragStartBehavior: dragStartBehavior,
      ),
    );
  }

  Widget _buildMaterialSwitch(BuildContext context) {
    final colors = AdaptiveTheme.of(context).colors;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor ?? colors.primary,
        inactiveTrackColor: inactiveTrackColor ?? colors.surface.withOpacity(0.3),
        thumbColor: MaterialStateProperty.all(thumbColor ?? colors.onSurface),
        dragStartBehavior: dragStartBehavior,
      ),
    );
  }
}
