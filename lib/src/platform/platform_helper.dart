import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter/material.dart';

enum AppPlatform { iOS, android }

AppPlatform detectPlatform() {
  return defaultTargetPlatform == TargetPlatform.iOS
      ? AppPlatform.iOS
      : AppPlatform.android;
}
