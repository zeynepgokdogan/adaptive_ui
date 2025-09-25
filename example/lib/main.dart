import 'package:flutter/material.dart';
import 'package:adaptive_ui_plus/adaptive_ui_plus.dart';
import 'package:example/demo_items.dart';

void main() => runApp(const DemoApp());

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      colors: _themeMode == ThemeMode.dark ? AppColors.dark : AppColors.light,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AdaptiveTheme.material(AppColors.light),
        darkTheme: AdaptiveTheme.material(AppColors.dark),
        themeMode: _themeMode,
        home: AdaptiveScaffold(
          appBar: AdaptiveAppBar(
            title: "Adaptive UI Demo",
            centerTitle: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: FittedBox(
                  child: AdaptiveIconButton(
                    icon: Icon(
                      _themeMode == ThemeMode.light
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      size: 18,
                    ),
                    text: _themeMode == ThemeMode.light ? "Dark" : "Light",
                    onPressed: _toggleTheme,
                  ),
                ),
              ),
            ],
          ),
          body: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: demos.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final demo = demos[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(
                    demo["icon"] as IconData,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: Text(demo["title"] as String),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Theme(
                        data: Theme.of(context),
                        child: (demo["pageBuilder"] as Widget Function(
                            BuildContext))(context),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
