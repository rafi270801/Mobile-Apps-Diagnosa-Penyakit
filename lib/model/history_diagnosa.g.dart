// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_diagnosa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryDiagnosa _$HistoryDiagnosaFromJson(Map<String, dynamic> json) =>
    HistoryDiagnosa(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      description: json['description'],
      userId: json['user_id'],
      symptomsData: (json['symptoms_data'] as List<dynamic>?)
          ?.map((e) => Symptoms.fromJson(e as Map<String, dynamic>))
          .toList(),
      diseaseData: (json['diseases_data'] as List<dynamic>?)
          ?.map((e) => Disease.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HistoryDiagnosaToJson(HistoryDiagnosa instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'description': instance.description,
      'symptoms_data': instance.symptomsData,
      'diseases_data': instance.diseaseData,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
