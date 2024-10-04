import 'package:flutter/material.dart';

ThemeData theme = ThemeData();

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.teal,
    brightness: Brightness.dark,
  ),
);

ThemeMode themeMode = ThemeMode.system;
