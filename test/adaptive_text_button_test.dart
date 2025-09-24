import 'package:adaptive_ui_plus/adaptive_ui_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdaptiveTextButton Widget Tests', () {
    testWidgets('Android TextButton gösteriliyor ve onPressed çalışıyor',
        (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Material(
            child: PlatformOverride(
              forced: AppPlatform.android,
              child: AdaptiveTextButton(
                text: 'Android Button',
                onPressed: () => pressed = true,
              ),
            ),
          ),
        ),
      ));

      expect(find.byType(TextButton), findsOneWidget);
      expect(find.text('Android Button'), findsOneWidget);

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      expect(pressed, true);
    });

    testWidgets('iOS CupertinoButton gösteriliyor ve onPressed çalışıyor',
        (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(MaterialApp(
        home: PlatformOverride(
          forced: AppPlatform.iOS,
          child: AdaptiveTextButton(
            text: 'iOS Button',
            onPressed: () => pressed = true,
          ),
        ),
      ));

      expect(find.byType(CupertinoButton), findsOneWidget);
      expect(find.text('iOS Button'), findsOneWidget);

      await tester.tap(find.byType(CupertinoButton));
      await tester.pumpAndSettle();

      expect(pressed, true);
    });
  });
}
