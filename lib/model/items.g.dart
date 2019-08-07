// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsModel _$ItemsModelFromJson(Map<String, dynamic> json) {
  return ItemsModel(
      totalCount: json['totalCount'] as int,
      nodes: (json['nodes'] as List)
          ?.map((e) =>
              e == null ? null : ItemModel.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ItemsModelToJson(ItemsModel instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'nodes': instance.nodes
    };
