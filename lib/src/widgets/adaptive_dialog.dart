import 'package:adaptive_ui_plus/adaptive_ui_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class AdaptiveDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  const AdaptiveDialog({
    super.key,
    required this.title,
    required this.content,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformOverride.of(context);

    switch (platform) {
      case AppPlatform.iOS:
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: actions.isNotEmpty
              ? actions
              : [
                  CupertinoDialogAction(
                    child: const Text("OK"),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
        );

      case AppPlatform.android:
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: actions.isNotEmpty
              ? actions
              : [
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
        );
    }
  }
}
