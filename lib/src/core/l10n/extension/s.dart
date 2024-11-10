import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

abstract class S {
  static const defaultLocale = Locale('ru');
  static const fallbackLocale = Locale('ru');
  static const supportedLocales = <Locale>[
    Locale('ru'),
    Locale('en'),
  ];

  static const localizationDelegates = <LocalizationsDelegate<dynamic>>[
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    AppLocalizations.delegate,
  ];

  static AppLocalizations of(BuildContext context) =>
      AppLocalizations.of(context);
}

extension BuildContextLocalizationExtension on BuildContext {
  AppLocalizations get s => AppLocalizations.of(this);
}
