import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adaptive_ui/adaptive_ui.dart';

void main() {
  group('AdaptiveAppBar Widget Tests', () {
    testWidgets('Android platformunda AppBar gösteriliyor', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PlatformOverride(
            forced: AppPlatform.android,
            child: Scaffold(
              appBar: AdaptiveAppBar(title: 'Android Title'),
              body: const SizedBox(),
            ),
          ),
        ),
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(CupertinoNavigationBar), findsNothing);
      expect(find.text('Android Title'), findsOneWidget);
    });

    testWidgets('iOS platformunda CupertinoNavigationBar gösteriliyor', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PlatformOverride(
            forced: AppPlatform.iOS,
            child: Scaffold(
              appBar: AdaptiveAppBar(title: 'iOS Title'),
              body: const SizedBox(),
            ),
          ),
        ),
      );

      expect(find.byType(CupertinoNavigationBar), findsOneWidget);
      expect(find.byType(AppBar), findsNothing);
      expect(find.text('iOS Title'), findsOneWidget);
    });
  });
}
