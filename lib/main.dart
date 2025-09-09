import 'package:adaptive_ui/adaptive_ui.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AdaptiveTheme.material(AppColors.light),
      builder: (context, child) => PlatformOverride(
        forced: null, 
        child: AdaptiveTheme(child: child ?? const SizedBox()),
      ),
      home: const DemoHome(),
    );
  }
}

class DemoHome extends StatelessWidget {
  const DemoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
