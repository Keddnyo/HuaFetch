import 'package:flutter/material.dart' hide Theme;

import 'navigation/navigation.dart';
import 'theme/theme.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        onGenerateRoute: onGenerateRoute,
        title: 'HuaFetch',
        theme: theme,
        darkTheme: darkTheme,
        themeMode: themeMode,
      );
}
