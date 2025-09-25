import 'package:adaptive_ui_plus/adaptive_ui_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdaptiveSwitch Widget Tests', () {
    testWidgets('Android Switch çalışıyor', (WidgetTester tester) async {
      bool? changedValue;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Material(
            child: PlatformOverride(
              forced: AppPlatform.android,
              child: AdaptiveSwitch(
                value: false,
                onChanged: (val) => changedValue = val,
              ),
            ),
          ),
        ),
      ));

      expect(find.byType(Switch), findsOneWidget);

      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      expect(changedValue, true);
    });

    testWidgets('iOS CupertinoSwitch çalışıyor', (WidgetTester tester) async {
      bool? changedValue;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: PlatformOverride(
            forced: AppPlatform.iOS,
            child: AdaptiveSwitch(
              value: false,
              onChanged: (val) => changedValue = val,
            ),
          ),
        ),
      ));

      expect(find.byType(CupertinoSwitch), findsOneWidget);

      await tester.tap(find.byType(CupertinoSwitch));
      await tester.pumpAndSettle();

      expect(changedValue, true);
    });
  });
}
