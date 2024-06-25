// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      disease: json['disease'] == null
          ? null
          : Disease.fromJson(json['disease'] as Map<String, dynamic>),
      matchingSymptoms: json['matchingSymptoms'],
      totalSymptoms: json['totalSymptoms'],
      score: json['score'],
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'disease': instance.disease,
      'matchingSymptoms': instance.matchingSymptoms,
      'totalSymptoms': instance.totalSymptoms,
      'score': instance.score,
    };
