// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagModel _$TagModelFromJson(Map<String, dynamic> json) {
  return TagModel(
      id: json['id'] as int,
      name: json['name'] as String,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      feeds: json['feeds'] == null
          ? null
          : FeedsModel.fromJson(json['feeds'] as Map<String, dynamic>));
}

Map<String, dynamic> _$TagModelToJson(TagModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created': instance.created?.toIso8601String(),
      'feeds': instance.feeds
    };
