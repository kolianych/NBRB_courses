// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `{cur_OfficialRate} bel.rub.`
  String curofficialrate(Object cur_OfficialRate) {
    return Intl.message(
      '$cur_OfficialRate bel.rub.',
      name: 'curofficialrate',
      desc: '',
      args: [cur_OfficialRate],
    );
  }

  /// `Enter the amount value`
  String get no_cover_value {
    return Intl.message(
      'Enter the amount value',
      name: 'no_cover_value',
      desc: '',
      args: [],
    );
  }

  /// `Exchange {snapshot.data}`
  String get exchange {
    return Intl.message(
      'Exchange {snapshot.data}',
      name: 'exchange',
      desc: '',
      args: [],
    );
  }

  /// `course for {quotName}`
  String exchangeHowmuch(Object quotName) {
    return Intl.message(
      'course for $quotName',
      name: 'exchangeHowmuch',
      desc: '',
      args: [quotName],
    );
  }

  /// `Error loading currencies`
  String get errorLoadingCurrencies {
    return Intl.message(
      'Error loading currencies',
      name: 'errorLoadingCurrencies',
      desc: '',
      args: [],
    );
  }

  /// `Sum`
  String get sum {
    return Intl.message(
      'Sum',
      name: 'sum',
      desc: '',
      args: [],
    );
  }

  /// `Currency converter`
  String get converter_text {
    return Intl.message(
      'Currency converter',
      name: 'converter_text',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `current exchange rates for {state.timeStart}`
  String get statetimestart {
    return Intl.message(
      'current exchange rates for {state.timeStart}',
      name: 'statetimestart',
      desc: '',
      args: [],
    );
  }

  /// `Go to currency converter`
  String get goToCurrencyConverter {
    return Intl.message(
      'Go to currency converter',
      name: 'goToCurrencyConverter',
      desc: '',
      args: [],
    );
  }

  /// `NBRB exchange rates`
  String get nbrnExchangeRates {
    return Intl.message(
      'NBRB exchange rates',
      name: 'nbrnExchangeRates',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
