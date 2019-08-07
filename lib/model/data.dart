import 'package:json_annotation/json_annotation.dart';
import './feed.dart';
import './tag.dart';
import './tags.dart';
import './item.dart';
import './items.dart';
import './viewer.dart';

part 'data.g.dart';

@JsonSerializable()
class DataModel {
  final FeedModel feed;
  final TagsModel tags;
  final TagModel tag;
  final ItemModel item;
  final ItemsModel items;
  final ViewerModel viewer;
  final bool subscribeFeed;
  final bool unsubscribeFeed;

  DataModel({
    this.tag,
    this.tags,
    this.feed,
    this.item,
    this.items,
    this.viewer,
    this.subscribeFeed,
    this.unsubscribeFeed,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
