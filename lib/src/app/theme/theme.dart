import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepOrange,
  ),
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.teal,
    brightness: Brightness.dark,
  ),
);

ThemeMode themeMode = ThemeMode.system;
