// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) {
  return ItemModel(
      id: json['id'] as int,
      feedId: json['feedId'] as int,
      author: json['author'] as String,
      link: json['link'] as String,
      guid: json['guid'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      content: json['content'] as String,
      pubtime: json['pubtime'] == null
          ? null
          : DateTime.parse(json['pubtime'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      read: json['read'] as String);
}

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'feedId': instance.feedId,
      'author': instance.author,
      'link': instance.link,
      'guid': instance.guid,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'pubtime': instance.pubtime?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'read': instance.read
    };
