// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Disease _$DiseaseFromJson(Map<String, dynamic> json) => Disease(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      description: json['description'],
      additionSymptoms: json['additional_symptoms'],
      symptoms: (json['symptoms'] as List<dynamic>?)
          ?.map((e) => Symptoms.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DiseaseToJson(Disease instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'additional_symptoms': instance.additionSymptoms,
      'symptoms': instance.symptoms,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
