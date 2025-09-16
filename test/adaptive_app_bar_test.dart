import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:adaptive_ui/src/widgets/adaptive_app_bar.dart';
import 'package:adaptive_ui/src/platform/platform_override.dart';
import 'package:adaptive_ui/src/platform/platform_helper.dart';

void main() {
  testWidgets("AdaptiveAppBar shows title", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          appBar: AdaptiveAppBar(title: "Hello AppBar"),
        ),
      ),
    );

    expect(find.text("Hello AppBar"), findsOneWidget);
  });

  testWidgets("AdaptiveAppBar shows CupertinoNavigationBar on iOS", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) => const PlatformOverride(
          forced: AppPlatform.iOS,
          child: SizedBox(),
        ),
        home: const Scaffold(
          appBar: AdaptiveAppBar(title: "Cupertino"),
        ),
      ),
    );

    expect(find.byType(CupertinoNavigationBar), findsOneWidget);
    expect(find.text("Cupertino"), findsOneWidget);
  });

  testWidgets("AdaptiveAppBar shows Material AppBar on Android", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) => const PlatformOverride(
          forced: AppPlatform.android,
          child: SizedBox(),
        ),
        home: const Scaffold(
          appBar: AdaptiveAppBar(title: "Material"),
        ),
      ),
    );

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text("Material"), findsOneWidget);
  });
}
