// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptoms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Symptoms _$SymptomsFromJson(Map<String, dynamic> json) => Symptoms(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );

Map<String, dynamic> _$SymptomsToJson(Symptoms instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
