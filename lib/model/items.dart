import 'package:json_annotation/json_annotation.dart';
import './item.dart';

part 'items.g.dart';

@JsonSerializable()
class ItemsModel {
  final int totalCount;
  final List<ItemModel> nodes;

  const ItemsModel({this.totalCount, this.nodes});

  factory ItemsModel.fromJson(Map<String, dynamic> json) =>
      _$ItemsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsModelToJson(this);
}
