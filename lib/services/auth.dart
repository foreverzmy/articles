import 'dart:async';
import 'package:dio/dio.dart';
import 'package:articlest/utils/storage.dart';

Dio dio = new Dio();

class AuthService {
  static Future<bool> login(String phone, String password) async {
    Storage storage = await Storage.getInstance();

    var url = 'https://rss.zmyer.cn/auth/login';
    Map data = {'phone': phone, 'password': password, 'platform': 'web'};

    final res = await dio.post(url, data: data);

    String token = res.data.toString();
    if (token != null) {
      await storage.setString('token', token);
      return true;
    }

    return false;
  }
}
