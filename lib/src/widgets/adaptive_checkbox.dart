import 'package:adaptive_ui/adaptive_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AdaptiveCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Color? activeColor;
  final Color? checkColor;
  final WidgetStateProperty<Color?>? fillColor; 
  final Color? trackColor; 
  final Color? thumbColor;
  final bool tristate;
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? shape;
  final DragStartBehavior dragStartBehavior; 

  const AdaptiveCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.checkColor,
    this.fillColor,
    this.trackColor,
    this.thumbColor,
    this.tristate = false,
    this.padding,
    this.shape, 
     this.dragStartBehavior = DragStartBehavior.start,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformOverride.of(context);

    switch (platform) {
      case AppPlatform.iOS:
        return Padding(
          padding: padding ?? EdgeInsets.zero,
          child: CupertinoSwitch(
            value: value,
            onChanged: onChanged,
            activeTrackColor: activeColor ?? trackColor,
            inactiveTrackColor: trackColor,
            thumbColor: thumbColor,
            dragStartBehavior: dragStartBehavior,
          ),
        );
      case AppPlatform.android:
        return Padding(
          padding: padding ?? EdgeInsets.zero,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: activeColor,
            checkColor: checkColor,
            fillColor: fillColor,
            tristate: tristate,
            shape: shape,
          ),
        );
    }
  }
}
