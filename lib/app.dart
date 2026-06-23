import 'package:creator_marketplace/routes/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/providers/providers.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';

class CreatorMarketplaceApp extends ConsumerWidget {
   CreatorMarketplaceApp({super.key});

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    final themeMode =
    ref.watch(themeProvider);

    return MaterialApp.router(
      theme: AppLightTheme.theme,
      darkTheme: AppDarkTheme.theme,
      themeMode: themeMode,
      routerConfig: AppRouter.router,
    );
  }
}