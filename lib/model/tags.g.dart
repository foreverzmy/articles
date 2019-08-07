// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagsModel _$TagsModelFromJson(Map<String, dynamic> json) {
  return TagsModel(
      totalCount: json['totalCount'] as int,
      nodes: (json['nodes'] as List)
          ?.map((e) =>
              e == null ? null : TagModel.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$TagsModelToJson(TagsModel instance) => <String, dynamic>{
      'totalCount': instance.totalCount,
      'nodes': instance.nodes
    };
