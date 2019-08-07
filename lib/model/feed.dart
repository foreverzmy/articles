import 'package:json_annotation/json_annotation.dart';
import './items.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'feed.g.dart';

@JsonSerializable()
class FeedModel {
  final int id;
  final String name;
  final String title;
  final String link;
  final DateTime updated;
  final DateTime published;
  final String author;
  final String language;
  final String image;
  final String copyright;
  final String description;
  final String note;
  bool isSubscribe;
  final ItemsModel items;

  FeedModel({
    this.id,
    this.name,
    this.title,
    this.link,
    this.updated,
    this.published,
    this.author,
    this.language,
    this.image,
    this.copyright,
    this.description,
    this.note,
    this.isSubscribe,
    this.items,
  });

  factory FeedModel.fromJson(Map<String, dynamic> json) =>
      _$FeedModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedModelToJson(this);
}
