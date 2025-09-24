import 'package:adaptive_ui_plus/adaptive_ui_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdaptiveBottomNavigationBar Widget Tests', () {
    testWidgets('Android platformunda BottomNavigationBar gösteriliyor',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: PlatformOverride(
          forced: AppPlatform.android,
          child: Scaffold(
            appBar: AdaptiveAppBar(
              title: 'Android Title',
            ),
            body: AdaptiveBottomNavigationBar(
              currentIndex: 0,
              onTap: (index) {},
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Settings"),
              ],
            ),
          ),
        ),
      ));

      expect(find.byType(BottomNavigationBar), findsOneWidget);

      final bottomNav = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );

      expect(bottomNav.items.length, 2);
      expect(bottomNav.currentIndex, 0);
    });

    testWidgets('iOS platformunda CupertinoTabBar gösteriliyor',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: PlatformOverride(
          forced: AppPlatform.iOS,
          child: Scaffold(
            body: AdaptiveBottomNavigationBar(
              currentIndex: 1,
              onTap: (index) {},
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Settings"),
              ],
            ),
          ),
        ),
      ));

      expect(find.byType(CupertinoTabBar), findsOneWidget);

      final tabBar = tester.widget<CupertinoTabBar>(
        find.byType(CupertinoTabBar),
      );

      expect(tabBar.items.length, 2);
      expect(tabBar.currentIndex, 1);
    });
  });
}
