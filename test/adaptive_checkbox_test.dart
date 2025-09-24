import 'package:adaptive_ui_plus/adaptive_ui_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdaptiveCheckbox Widget Tests', () {
    testWidgets('Android Checkbox çalışıyor', (WidgetTester tester) async {
      bool? changedValue;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Material(
            child: PlatformOverride(
              forced: AppPlatform.android,
              child: AdaptiveCheckbox(
                value: false,
                onChanged: (val) => changedValue = val,
              ),
            ),
          ),
        ),
      ));

      expect(find.byType(Checkbox), findsOneWidget);

      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();

      expect(changedValue, true);
    });

    testWidgets('iOS CupertinoSwitch çalışıyor', (WidgetTester tester) async {
      bool? changedValue;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: PlatformOverride(
            forced: AppPlatform.iOS,
            child: AdaptiveCheckbox(
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
