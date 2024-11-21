// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_courses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrentCoursesImpl _$$CurrentCoursesImplFromJson(Map<String, dynamic> json) =>
    _$CurrentCoursesImpl(
      Cur_ID: (json['Cur_ID'] as num?)?.toInt(),
      Cur_Abbreviation: json['Cur_Abbreviation'] as String?,
      Cur_Scale: (json['Cur_Scale'] as num?)?.toInt(),
      Cur_Name: json['Cur_Name'] as String?,
      Cur_Name_Eng: json['Cur_Name_Eng'] as String?,
      Cur_QuotName: json['Cur_QuotName'] as String?,
      Cur_QuotName_Eng: json['Cur_QuotName_Eng'] as String?,
      Cur_OfficialRate: (json['Cur_OfficialRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CurrentCoursesImplToJson(
        _$CurrentCoursesImpl instance) =>
    <String, dynamic>{
      'Cur_ID': instance.Cur_ID,
      'Cur_Abbreviation': instance.Cur_Abbreviation,
      'Cur_Scale': instance.Cur_Scale,
      'Cur_Name': instance.Cur_Name,
      'Cur_Name_Eng': instance.Cur_Name_Eng,
      'Cur_QuotName': instance.Cur_QuotName,
      'Cur_QuotName_Eng': instance.Cur_QuotName_Eng,
      'Cur_OfficialRate': instance.Cur_OfficialRate,
    };
