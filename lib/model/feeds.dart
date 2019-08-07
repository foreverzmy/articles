import 'package:json_annotation/json_annotation.dart';
import './feed.dart';

part 'feeds.g.dart';

@JsonSerializable()
class FeedsModel {
  final int totalCount;
  final List<FeedModel> nodes;

  const FeedsModel({this.totalCount, this.nodes});

  factory FeedsModel.fromJson(Map<String, dynamic> json) =>
      _$FeedsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedsModelToJson(this);
}
