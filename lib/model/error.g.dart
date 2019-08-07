// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) {
  return ErrorModel(
      message: json['message'] as String,
      path: (json['path'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{'message': instance.message, 'path': instance.path};
