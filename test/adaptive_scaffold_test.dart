import 'package:adaptive_ui_plus/adaptive_ui_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdaptiveScaffold Widget Tests', () {
    testWidgets('Android platformunda Scaffold gösteriliyor',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: PlatformOverride(
          forced: AppPlatform.android,
          child: AdaptiveScaffold(
            appBar: const AdaptiveAppBar(title: 'Android Title'),
            body: const Text('Android Body'),
            floatingActionButton: const FloatingActionButton(
              onPressed: null,
              child: Icon(Icons.add),
            ),
            bottomNavigationBar: AdaptiveBottomNavigationBar(
              currentIndex: 0,
              onTap: (_) {},
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
              ],
            ),
          ),
        ),
      ));

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.text('Android Title'), findsOneWidget);
      expect(find.text('Android Body'), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });

    testWidgets('iOS platformunda CupertinoPageScaffold gösteriliyor',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: PlatformOverride(
          forced: AppPlatform.iOS,
          child: AdaptiveScaffold(
            appBar: const AdaptiveAppBar(title: 'iOS Title'),
            body: const Text('iOS Body'),
            bottomNavigationBar: AdaptiveBottomNavigationBar(
              currentIndex: 0,
              onTap: (_) {},
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
              ],
            ),
          ),
        ),
      ));

      expect(find.byType(CupertinoPageScaffold), findsOneWidget);
      expect(find.text('iOS Title'), findsOneWidget);
      expect(find.text('iOS Body'), findsOneWidget);
      expect(find.byType(CupertinoTabBar), findsOneWidget);
    });
  });
}
