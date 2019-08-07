import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show rootBundle;

class DBProvider {
  /// Create a private constructor that can be used only inside the class
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database _database;

  /// 获取数据库实例
  Future<Database> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await _initDB();
    return _database;
  }

  /// 初始化数据库
  _initDB() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "articlest.db");
    await deleteDatabase(path); // 删除数据库，修改数据库时开启
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {
        print('open $db');
      },
      onCreate: (Database db, int version) async {
        /// 从本地文件读取创建数据库 sql
        String data = await rootBundle.loadString('assets/initDB.sql');
        await db.execute(data);
      },
    );
  }
}
