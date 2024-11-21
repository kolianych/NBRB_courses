import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void switchLocale(String languageCode) {
    _locale = Locale(languageCode);
    notifyListeners();
  }
}
