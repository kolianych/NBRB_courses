import 'dart:async';

import 'package:nbrb_curs/servise/current_courses_pesponse/current_courses_servise.dart';
import 'package:nbrb_curs/servise/current_courses_pesponse/models/current_courses.dart';

class CurrencyController {
  final _currencyController = StreamController<List<CurrentCourses>>();
  final _conversionController = StreamController<double>();
  List<CurrentCourses> currencies = [];

  CurrencyController() {
    _loadCurrencies();
  }

  Future<void> _loadCurrencies() async {
    currencies = await getAllCurrency();
    currencies.add(CurrentCourses(
        Cur_Abbreviation: 'BYN',
        Cur_ID: null,
        Cur_Name: 'Белорусский рубль',
        Cur_Name_Eng: 'Belarusian ruble',
        Cur_OfficialRate: 1.0,
        Cur_QuotName: '1 Белорусский рубль',
        Cur_QuotName_Eng: '1 Belarusian ruble',
        Cur_Scale: 1));
    currencies.sort((a, b) => (a.Cur_Name ?? '').compareTo(b.Cur_Name ?? ''));
    _currencyController.sink.add(currencies);
  }

  Stream<List<CurrentCourses>> get currenciesStream =>
      _currencyController.stream;
  Stream<double> get conversionStream => _conversionController.stream;

  void convert(double amount, String fromCurrency, String toCurrency) {
    final fromCourse =
        currencies.firstWhere((cur) => cur.Cur_Abbreviation == fromCurrency);
    final toCourse =
        currencies.firstWhere((cur) => cur.Cur_Abbreviation == toCurrency);

    double result =
        (amount / toCourse.Cur_OfficialRate!) * fromCourse.Cur_OfficialRate!;
    _conversionController.sink.add(result);
  }

  void dispose() {
    _currencyController.close();
    _conversionController.close();
  }
}
