import 'package:flutter/material.dart';
import 'package:short/src/core/_barrel.dart';
import 'package:short/src/feature/shared/presentation/system/_barrel.dart';

class WantShortMaterialApp extends StatelessWidget {
  const WantShortMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    return Builder(
      builder: (context) {
        return MaterialApp.router(
          title: AppConstant.name,
          debugShowCheckedModeBanner: false,
          locale: S.defaultLocale,
          themeMode: ThemeMode.light,
          theme: _primaryTheme,
          supportedLocales: S.supportedLocales,
          localizationsDelegates: S.localizationDelegates,
          routerConfig: appRouter.config(
            navigatorObservers: appRouter.navigationObservers,
          ),
        );
      },
    );
  }

  ThemeData get _primaryTheme {
    return ThemeData(
      fontFamily: 'Unbounded',
      primaryColor: ColorName.blue,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorName.blue,
      ),
    );
  }
}
