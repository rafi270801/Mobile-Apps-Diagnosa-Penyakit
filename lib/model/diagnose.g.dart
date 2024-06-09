// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnose.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Diagnose _$DiagnoseFromJson(Map<String, dynamic> json) => Diagnose(
      disease: json['disease'] == null
          ? null
          : Disease.fromJson(json['disease'] as Map<String, dynamic>),
      matchingSymptoms: json['matching_symptoms'],
      totalSymptoms: json['total_symptoms'],
      score: json['score'],
    );

Map<String, dynamic> _$DiagnoseToJson(Diagnose instance) => <String, dynamic>{
      'disease': instance.disease,
      'matching_symptoms': instance.matchingSymptoms,
      'total_symptoms': instance.totalSymptoms,
      'score': instance.score,
    };
