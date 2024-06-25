import 'dart:convert';

import 'package:flutter_diagnosa_penyakit/model/disease.dart';
import 'package:flutter_diagnosa_penyakit/model/result.dart';
import 'package:flutter_diagnosa_penyakit/model/symptoms.dart';
import 'package:json_annotation/json_annotation.dart';

part 'diagnosa.g.dart';

@JsonSerializable()
class Diagnosa {
  Diagnosa({this.results, this.symptoms});

  factory Diagnosa.fromJson(Map<String, dynamic> json) => _$DiagnosaFromJson(json);

  Map<String, dynamic> toJson() => _$DiagnosaToJson(this);

  final List<Result>? results;
  final List<Symptoms>? symptoms;
  @override
  String toString() => json.encode(this);

}