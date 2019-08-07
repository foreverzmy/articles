import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class ItemModel {
  final int id;
  final int feedId;
  final String author;
  final String link;
  final String guid;
  final String title;
  final String description;
  final String content;
  final DateTime pubtime;
  final DateTime updated;
  final String read;

  const ItemModel({
    this.id,
    this.feedId,
    this.author,
    this.link,
    this.guid,
    this.title,
    this.description,
    this.content,
    this.pubtime,
    this.updated,
    this.read,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
