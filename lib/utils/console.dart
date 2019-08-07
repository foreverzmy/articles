import 'dart:convert';
import 'package:articlest/config/constant.dart';

// 日志
class Console {
  static _print(Object obj) {
    if (obj is Map) {
      JsonEncoder encoder = new JsonEncoder.withIndent('  ');
      String prettyprint = encoder.convert(obj);
      print(prettyprint);
    } else {
      print(obj);
    }
  }

  static log(Object obj) {
    // 不是 debug 模式不打印普通日志
    if (!ConfigConstant.DEBUG) {
      return;
    }
    Console._print(obj);
  }

  // 错误日志全部打印
  static error(Object obj) {
    Console._print(obj);
  }
}
