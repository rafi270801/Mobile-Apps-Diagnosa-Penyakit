import 'dart:convert';

import 'package:flutter_diagnosa_penyakit/model/disease.dart';
import 'package:json_annotation/json_annotation.dart';

part 'diagnose.g.dart';

@JsonSerializable()
class Diagnose {
  Diagnose({this.disease, this.matchingSymptoms, this.totalSymptoms, this.score});

  factory Diagnose.fromJson(Map<String, dynamic> json) => _$DiagnoseFromJson(json);

  Map<String, dynamic> toJson() => _$DiagnoseToJson(this);

  final Disease? disease;
  @JsonKey(name: 'matching_symptoms')
  final dynamic matchingSymptoms;
  @JsonKey(name: 'total_symptoms')
  final dynamic totalSymptoms;
  final dynamic score;

  @override
  String toString() => json.encode(this);

}