import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/preferences.dart';

class LocaleProvider with ChangeNotifier {
  late LOCALE locale = defaultLocale;

  dynamic setLocale(LOCALE locale) async {
    await Preferences.setString(PREFERENCES.locale, locale.name);
    this.locale = locale;
    notifyListeners();
  }
}