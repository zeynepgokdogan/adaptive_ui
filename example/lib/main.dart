import 'package:flutter/material.dart';
import 'package:example/demo_items.dart';

void main() => runApp(const DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive UI Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Adaptive UI Demo")),
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
                  MaterialPageRoute(builder: (_) => demo["page"] as Widget),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
