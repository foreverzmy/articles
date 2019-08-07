// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedModel _$FeedModelFromJson(Map<String, dynamic> json) {
  return FeedModel(
      id: json['id'] as int,
      name: json['name'] as String,
      title: json['title'] as String,
      link: json['link'] as String,
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      published: json['published'] == null
          ? null
          : DateTime.parse(json['published'] as String),
      author: json['author'] as String,
      language: json['language'] as String,
      image: json['image'] as String,
      copyright: json['copyright'] as String,
      description: json['description'] as String,
      note: json['note'] as String,
      isSubscribe: json['isSubscribe'] as bool,
      items: json['items'] == null
          ? null
          : ItemsModel.fromJson(json['items'] as Map<String, dynamic>));
}

Map<String, dynamic> _$FeedModelToJson(FeedModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'link': instance.link,
      'updated': instance.updated?.toIso8601String(),
      'published': instance.published?.toIso8601String(),
      'author': instance.author,
      'language': instance.language,
      'image': instance.image,
      'copyright': instance.copyright,
      'description': instance.description,
      'note': instance.note,
      'isSubscribe': instance.isSubscribe,
      'items': instance.items
    };
