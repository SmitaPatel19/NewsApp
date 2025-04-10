import 'package:flutter/material.dart';

class ThemeController {
  static final themeNotifier = ValueNotifier(ThemeMode.light);

  static void toggleTheme() {
    themeNotifier.value =
        themeNotifier.value == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light;
  }
}
