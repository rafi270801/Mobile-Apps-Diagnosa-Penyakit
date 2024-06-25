// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Diagnosa _$DiagnosaFromJson(Map<String, dynamic> json) => Diagnosa(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      symptoms: (json['symptoms'] as List<dynamic>?)
          ?.map((e) => Symptoms.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DiagnosaToJson(Diagnosa instance) => <String, dynamic>{
      'results': instance.results,
      'symptoms': instance.symptoms,
    };
