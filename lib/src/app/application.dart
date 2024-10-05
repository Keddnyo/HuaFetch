import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        themeAnimationCurve: Curves.easeOut,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      );
}
