import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nbrb_curs/blocs/current_courses_bloc/current_courses_bloc.dart';
import 'package:nbrb_curs/blocs/localizatio_bloc/localizatio_cubit.dart';
import 'package:nbrb_curs/servise/current_courses_pesponse/current_courses_servise.dart';
import 'package:nbrb_curs/servise/current_courses_pesponse/models/current_courses.dart';

class MySearchController {
  final BuildContext context;
  MySearchController({required this.context});
  onChange(String value) async {
    final localizationBloc = BlocProvider.of<LocalizationBloc>(context);
    final isEnglish = localizationBloc.state.languageCode == 'en';

    final List<CurrentCourses> currencyList = await getAllCurrency();

    value = value.toLowerCase();
    List<CurrentCourses> listOfNames = currencyList.where((course) {
      final searchField = isEnglish ? course.Cur_Name_Eng : course.Cur_Name;
      return searchField!.toLowerCase().contains(value.toLowerCase());
    }).toList();
    if (value.isEmpty) {
      listOfNames = currencyList;
      // ignore: use_build_context_synchronously
      context.read<CurrentCoursesBloc>().add(SearchingEvent(listOfNames));
    }
    // ignore: use_build_context_synchronously
    context.read<CurrentCoursesBloc>().add(SearchingEvent(listOfNames));
  }
}
