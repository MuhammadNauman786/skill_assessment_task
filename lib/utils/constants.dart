import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Map<LOCALE, String> _localeFullName = {
  LOCALE.ar: "Arabic",
  LOCALE.en: "English",
};

enum LOCALE {
  en,
  ar;

  String getFullName() {
    return _localeFullName[this]!;
  }

  static LOCALE getLocaleFromString(String? locale) {
    if (locale == null) {
      return defaultLocale;
    }

    if (locale.contains(LOCALE.ar.name)) return LOCALE.ar;
    if (locale.contains(LOCALE.en.name)) return LOCALE.en;
    return defaultLocale;
  }
}

const LOCALE defaultLocale = LOCALE.en;

var localesList = [
  Locale(LOCALE.ar.name, ''),
  Locale(LOCALE.en.name, ''),
];

const localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];