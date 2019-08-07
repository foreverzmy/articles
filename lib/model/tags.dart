import 'package:json_annotation/json_annotation.dart';
import './tag.dart';

part 'tags.g.dart';

@JsonSerializable()
class TagsModel {
  final int totalCount;
  final List<TagModel> nodes;

  const TagsModel({this.totalCount, this.nodes});

  factory TagsModel.fromJson(Map<String, dynamic> json) =>
      _$TagsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TagsModelToJson(this);
}
