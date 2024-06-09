import 'dart:convert';

import 'package:flutter_diagnosa_penyakit/model/disease.dart';
import 'package:flutter_diagnosa_penyakit/model/symptoms.dart';
import 'package:json_annotation/json_annotation.dart';

part 'history_diagnosa.g.dart';

@JsonSerializable()
class HistoryDiagnosa {
  HistoryDiagnosa({this.id, this.name,this.createdAt, this.updatedAt, this.description,this.userId, this.symptomsData, this.diseaseData });

  factory HistoryDiagnosa.fromJson(Map<String, dynamic> json) => _$HistoryDiagnosaFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryDiagnosaToJson(this);

  final dynamic id;
  @JsonKey(name: 'user_id')
  final dynamic userId;
  final dynamic name;
  final dynamic description;
  @JsonKey(name: 'symptoms_data')
  final List<Symptoms>? symptomsData;
  @JsonKey(name: 'diseases_data')
  final List<Disease>? diseaseData;
  @JsonKey(name: 'created_at')
  final dynamic createdAt;
  @JsonKey(name: 'updated_at')
  final dynamic updatedAt;

  @override
  String toString() => json.encode(this);

}