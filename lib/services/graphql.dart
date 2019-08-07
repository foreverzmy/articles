import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:articlest/utils/console.dart';
import 'package:articlest/utils/storage.dart';
import 'package:articlest/model/index.dart';
import 'package:articlest/config/constant.dart';
import 'package:articlest/views/auth/index.dart';

const graphqlURI = 'https://rss.zmyer.cn/graphql';
Dio dio = new Dio();

class Graphql {
  static const CONTENT_TYPE_JSON = "application/json";

  static Future<GraphqlModel> fetch(String gpl,
      {Map<String, dynamic> variables}) async {
    final String token = await getAuthorization();

    final headers = {
      'content-type': 'application/json',
      'Authorization': token
    };

    final options = new Options(
        method: 'post', headers: headers, responseType: ResponseType.plain);

    Map data = {'query': gpl};

    if (variables != null) {
      data['variables'] = variables;
    }

    try {
      final res = await dio.request(graphqlURI, data: data, options: options);

      final resStr = res.data.toString();
      final jsonRes = json.decode(resStr);

      return new GraphqlModel.fromJson(jsonRes);
    } on DioError catch (e) {
      Console.error(e);
      return null;
    }
  }

  // 获取存储的 token
  static getAuthorization() async {
    Storage storage = await Storage.getInstance();
    final String token = await storage.get(ConfigConstant.TOKEN_KEY);

    if (token == null) {
      gotoLogin();
      return null;
    } else {
      return token;
    }
  }

  // 跳转到登陆页面
  static gotoLogin() {
    Navigator.of(null).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => LoginPage()),
        (route) => route == null);
  }
}
