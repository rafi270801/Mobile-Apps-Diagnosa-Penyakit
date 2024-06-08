import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'symptoms.g.dart';

@JsonSerializable()
class Symptoms {
  Symptoms({this.id, this.name,this.createdAt, this.updatedAt});

  factory Symptoms.fromJson(Map<String, dynamic> json) => _$SymptomsFromJson(json);

  Map<String, dynamic> toJson() => _$SymptomsToJson(this);

  final dynamic id;
  final dynamic name;
  @JsonKey(name: 'created_at')
  final dynamic createdAt;
  @JsonKey(name: 'updated_at')
  final dynamic updatedAt;

  @override
  String toString() => json.encode(this);

}