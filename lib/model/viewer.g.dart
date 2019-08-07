// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewerModel _$ViewerModelFromJson(Map<String, dynamic> json) {
  return ViewerModel(
      feeds: json['feeds'] == null
          ? null
          : FeedsModel.fromJson(json['feeds'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ViewerModelToJson(ViewerModel instance) =>
    <String, dynamic>{'feeds': instance.feeds};
