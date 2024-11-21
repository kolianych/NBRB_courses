import 'package:dio/dio.dart';
import 'package:nbrb_curs/config/constants.dart';
import 'package:nbrb_curs/servise/current_courses_pesponse/models/current_courses.dart';

Future<List<CurrentCourses>> getAllCurrency() async {
  final dio = Dio();
  final responsePeriodicity0 = await dio.get('$baseApi/rates?periodicity=0');
  final responsePeriodicity1 = await dio.get('$baseApi/rates?periodicity=1');
  final responseAllcurrency = await dio.get('$baseApi/currencies');

  List<CurrentCourses> list1 = [];
  list1.addAll((responsePeriodicity0.data as List)
      .map((item) => CurrentCourses.fromJson(item))
      .toList());
  list1.addAll((responsePeriodicity1.data as List)
      .map((item) => CurrentCourses.fromJson(item))
      .toList());

  List<CurrentCourses> list2 = (responseAllcurrency.data as List)
      .map((item) => CurrentCourses.fromJson(item))
      .toList();

  Map<int?, double?> ratesMap = {
    for (var rate in list1) rate.Cur_ID: rate.Cur_OfficialRate,
  };

  List<CurrentCourses> updatedCurrenciesList = list2
      .map((item) {
        final officialRate = ratesMap[item.Cur_ID];
        if (officialRate != null) {
          return item.copyWith(
            Cur_OfficialRate: officialRate,
          );
        }
        return null;
      })
      .whereType<CurrentCourses>()
      .toList();

  return updatedCurrenciesList;
}
