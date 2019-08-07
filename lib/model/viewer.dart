import 'package:json_annotation/json_annotation.dart';
import './feeds.dart';

part 'viewer.g.dart';

@JsonSerializable()
class ViewerModel {
  final FeedsModel feeds;

  const ViewerModel({this.feeds});

  factory ViewerModel.fromJson(Map<String, dynamic> json) =>
      _$ViewerModelFromJson(json);

  Map<String, dynamic> toJson() => _$ViewerModelToJson(this);
}
