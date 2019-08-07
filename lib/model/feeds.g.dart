// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedsModel _$FeedsModelFromJson(Map<String, dynamic> json) {
  return FeedsModel(
      totalCount: json['totalCount'] as int,
      nodes: (json['nodes'] as List)
          ?.map((e) =>
              e == null ? null : FeedModel.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$FeedsModelToJson(FeedsModel instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'nodes': instance.nodes
    };
