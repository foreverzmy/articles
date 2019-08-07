import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

@JsonSerializable()
class ErrorModel {
  final String message;
  final List<String> path;

  ErrorModel({this.message, this.path});

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}
