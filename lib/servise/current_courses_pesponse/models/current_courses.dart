import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_courses.freezed.dart';
part 'current_courses.g.dart';

@freezed
class CurrentCourses with _$CurrentCourses {
  factory CurrentCourses({
    required int? Cur_ID,
    required String? Cur_Abbreviation,
    required int? Cur_Scale,
    required String? Cur_Name,
    required String? Cur_Name_Eng,
    required String? Cur_QuotName,
    required String? Cur_QuotName_Eng,
    required double? Cur_OfficialRate,
  }) = _CurrentCourses;

  factory CurrentCourses.fromJson(Map<String, dynamic> json) =>
      _$CurrentCoursesFromJson(json);
}
