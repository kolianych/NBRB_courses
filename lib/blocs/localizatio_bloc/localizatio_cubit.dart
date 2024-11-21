import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalizationBloc extends Cubit<Locale> {
  LocalizationBloc() : super(const Locale('ru'));

  void switchLocale(String languageCode) {
    emit(Locale(languageCode));
  }
}
