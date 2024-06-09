import 'dart:convert';

import 'package:flutter_diagnosa_penyakit/model/symptoms.dart';
import 'package:json_annotation/json_annotation.dart';

part 'disease.g.dart';

@JsonSerializable()
class Disease {
  Disease({this.id, this.name,this.createdAt, this.updatedAt, this.description, this.additionSymptoms,this.symptoms });

  factory Disease.fromJson(Map<String, dynamic> json) => _$DiseaseFromJson(json);

  Map<String, dynamic> toJson() => _$DiseaseToJson(this);

  final dynamic id;
  final dynamic name;
  final dynamic description;
  @JsonKey(name: 'additional_symptoms')
  final dynamic additionSymptoms;
  List<Symptoms>? symptoms;
  @JsonKey(name: 'created_at')
  final dynamic createdAt;
  @JsonKey(name: 'updated_at')
  final dynamic updatedAt;

  @override
  String toString() => json.encode(this);

}