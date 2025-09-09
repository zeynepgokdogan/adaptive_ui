import 'package:flutter/widgets.dart';
import 'platform_helper.dart';

class PlatformOverride extends InheritedWidget {
  final AppPlatform? forced;
  const PlatformOverride({super.key, required super.child, this.forced});

  static AppPlatform of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PlatformOverride>()?.forced
      ?? detectPlatform();

  @override
  bool updateShouldNotify(PlatformOverride old) => forced != old.forced;
}
