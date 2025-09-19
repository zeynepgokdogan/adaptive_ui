import 'package:flutter/material.dart';
import 'package:adaptive_ui/adaptive_ui.dart';

final demos = [
  {
    "title": "AppBar",
    "icon": Icons.web,
    "page": const Scaffold(
      appBar: AdaptiveAppBar(title: "AppBar Demo"),
      body: Center(child: Text("Hello AppBar")),
    ),
  },
  {
    "title": "Icon Button",
    "icon": Icons.touch_app,
    "page": Scaffold(
      appBar: const AdaptiveAppBar(title: "Icon Button Demo"),
      body: Center(
        child: AdaptiveIconButton(text: 'Button Demo', onPressed: () {}),
      ),
    ),
  },
  {
    "title": "Text Button",
    "icon": Icons.touch_app_outlined,
    "page": Scaffold(
      appBar: const AdaptiveAppBar(title: "Text Button Demo"),
      body: Center(
        child: AdaptiveTextButton(text: 'Button Demo', onPressed: () {}),
      ),
    ),
  },
  {
    "title": "Text Field",
    "icon": Icons.text_fields,
    "page": Scaffold(
      appBar: const AdaptiveAppBar(title: "Text Field Demo"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: AdaptiveTextField(
            labelText: 'Demo Label Text',
            hintText: 'Demo Hint Text',
          ),
        ),
      ),
    ),
  },
  {
    "title": "Check Box",
    "icon": Icons.check_box_outline_blank,
    "page": Scaffold(
      appBar: const AdaptiveAppBar(title: "Check Box Demo"),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AdaptiveCheckbox(
                  value: true,
                  onChanged: (val) {},
                ),
                AdaptiveCheckbox(value: false, onChanged: (val) {}),
              ],
            )),
      ),
    ),
  }
];
