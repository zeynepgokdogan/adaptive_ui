import 'package:flutter/widgets.dart';
import '../platform/platform_override.dart';
import '../platform/platform_helper.dart';

T adapt<T>({
  required BuildContext context,
  required T Function() ios,
  required T Function() android,
}) {
  final platform = PlatformOverride.of(context);
  return platform == AppPlatform.iOS ? ios() : android();
}
