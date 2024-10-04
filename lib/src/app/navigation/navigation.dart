import 'package:flutter/material.dart';

import '../../features/auth/domain/model/user.dart';
import '../../features/auth/presentation/ui/auth_screen.dart';
import '../../features/wearables/presentation/ui/wearable_catalog_screen.dart';

Route<dynamic> onGenerateRoute(
  RouteSettings settings,
) =>
    MaterialPageRoute(
      builder: (context) => settings.name == '/wearables'
          ? WearableCatalogScreen(
              user: settings.arguments as User,
            )
          : const AuthScreen(),
    );
