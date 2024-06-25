import 'dart:convert';

import 'package:flutter_diagnosa_penyakit/model/disease.dart';
import 'package:json_annotation/json_annotation.dart';
part 'result.g.dart';

@JsonSerializable()
class Result {
  Result({this.disease, this.matchingSymptoms, this.totalSymptoms, this.score});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  final Disease? disease;
  final dynamic matchingSymptoms;
  final dynamic totalSymptoms;
  final dynamic score;

  @override
  String toString() {
    return json.encode(this);
  }
}