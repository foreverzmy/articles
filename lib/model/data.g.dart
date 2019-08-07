// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) {
  return DataModel(
      tag: json['tag'] == null
          ? null
          : TagModel.fromJson(json['tag'] as Map<String, dynamic>),
      tags: json['tags'] == null
          ? null
          : TagsModel.fromJson(json['tags'] as Map<String, dynamic>),
      feed: json['feed'] == null
          ? null
          : FeedModel.fromJson(json['feed'] as Map<String, dynamic>),
      item: json['item'] == null
          ? null
          : ItemModel.fromJson(json['item'] as Map<String, dynamic>),
      items: json['items'] == null
          ? null
          : ItemsModel.fromJson(json['items'] as Map<String, dynamic>),
      viewer: json['viewer'] == null
          ? null
          : ViewerModel.fromJson(json['viewer'] as Map<String, dynamic>),
      subscribeFeed: json['subscribeFeed'] as bool,
      unsubscribeFeed: json['unsubscribeFeed'] as bool);
}

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'feed': instance.feed,
      'tags': instance.tags,
      'tag': instance.tag,
      'item': instance.item,
      'items': instance.items,
      'viewer': instance.viewer,
      'subscribeFeed': instance.subscribeFeed,
      'unsubscribeFeed': instance.unsubscribeFeed
    };
