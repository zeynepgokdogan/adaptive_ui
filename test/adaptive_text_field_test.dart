import 'package:adaptive_ui_plus/adaptive_ui_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdaptiveTextField Widget Tests', () {
    testWidgets('Android TextField gösteriliyor ve callbackler çalışıyor',
        (WidgetTester tester) async {
      String changed = '';
      String submitted = '';

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Material(
            child: PlatformOverride(
              forced: AppPlatform.android,
              child: AdaptiveTextField(
                labelText: 'Android Label',
                hintText: 'Android Hint',
                onChanged: (val) => changed = val,
                onSubmitted: (val) => submitted = val,
              ),
            ),
          ),
        ),
      ));

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Android Label'), findsOneWidget);
      expect(find.text('Android Hint'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'Hello Android');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(changed, 'Hello Android');
      expect(submitted, 'Hello Android');
    });

    testWidgets('iOS CupertinoTextField gösteriliyor ve callbackler çalışıyor',
        (WidgetTester tester) async {
      String changed = '';
      String submitted = '';

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: PlatformOverride(
            forced: AppPlatform.iOS,
            child: AdaptiveTextField(
              labelText: 'iOS Label',
              hintText: 'iOS Hint',
              onChanged: (val) => changed = val,
              onSubmitted: (val) => submitted = val,
            ),
          ),
        ),
      ));

      expect(find.byType(CupertinoTextField), findsOneWidget);
      expect(find.text('iOS Hint'), findsOneWidget);

      await tester.enterText(find.byType(CupertinoTextField), 'Hello iOS');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(changed, 'Hello iOS');
      expect(submitted, 'Hello iOS');
    });
  });
}
