import 'package:flutter/material.dart';
import 'package:adaptive_ui/adaptive_ui.dart'; 

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const DemoHome(),
    );
  }
}

class DemoHome extends StatelessWidget {
  const DemoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdaptiveAppBar(title: "Adaptive UI Demo"),
      body: ListView(
        children: [
          ListTile(
            title: const Text("AdaptiveAppBar"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Scaffold(
                  appBar: AdaptiveAppBar(title: "AppBar Demo"),
                  body: Center(child: Text("Hello AppBar")),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
