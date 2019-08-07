import './data.dart';
import './error.dart';

class GraphqlModel {
  final DataModel data;
  final List<ErrorModel> errors;

  const GraphqlModel({this.data, this.errors});

  factory GraphqlModel.fromJson(Map<String, dynamic> json) => GraphqlModel(
        data: json['data'] == null
            ? null
            : DataModel.fromJson(json['data'] as Map<String, dynamic>),
        errors: (json['errors'] as List)
            ?.map((e) => e == null
                ? null
                : ErrorModel.fromJson(e as Map<String, dynamic>))
            ?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
        'errors': errors,
      };
}
