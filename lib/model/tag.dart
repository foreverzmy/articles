import 'package:json_annotation/json_annotation.dart';
import './feeds.dart';

part 'tag.g.dart';

@JsonSerializable()
class TagModel {
  final int id;
  final String name;
  final DateTime created;
  final FeedsModel feeds;

  const TagModel({this.id, this.name, this.created, this.feeds});

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);

  Map<String, dynamic> toJson() => _$TagModelToJson(this);
}
