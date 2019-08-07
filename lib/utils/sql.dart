import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:articlest/utils/console.dart';

const createSql = {
  'feed': '''
    CREATE TABLE "feed" (
      `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
      `name` TEXT NOT NULL UNIQUE,
      `depth`	INTEGER NOT NULL DEFAULT 1,
      `parentId`	INTEGER NOT NULL,
      `desc`	TEXT
    )
    '''
};

/// 1. Create a private constructor that can be used only inside the class
/// 2. Create the database object and provide it with a getter where we will instantiate the database if it’s not (lazy initialization).
class DBProvider {
  static Database _db;

  DBProvider._();
  static final DBProvider db = DBProvider._();

  /// 初始化数据库
  initDB() async {
    ///  get the path for storing the database
    String databasesPath = await getDatabasesPath();

    /// The database name is Articlest.db，use it or create it.
    String path = join(databasesPath, "Articlest.db");

    /// create the desired tables
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {
        Console.log('Open db.');
      },
      onCreate: (Database db, int version) async {
        Console.log('Create a new db.');
        await db.execute('''
          CREATE TABLE Client(
            id INTEGER PRIMARY KEY,
            first_name TEXT,
            last_name TEXT,
            blocket BIT
          )
          ''');
      },
    );
  }

  // 获取数据库中所有的表名
  Future<List> getTables() async {
    final db = await database;

    List tables = await db
        .rawQuery('SELECT name FROM sqlite_master WHERE type = "table"');
    List<String> targetList = [];
    tables.forEach((item) {
      targetList.add(item['name']);
    });
    return targetList;
  }

  Future<Database> get database async {
    if (_db != null) return _db;

    // if _database is null we instantiate it
    _db = await initDB();
    return _db;
  }

  // 检查数据库中, 表是否完整, 在部份android中, 会出现表丢失的情况
  Future checkTableIsRight() async {
    List<String> expectTables = ['cat', 'widget', 'collection'];

    List<String> tables = await getTables();

    for (int i = 0; i < expectTables.length; i++) {
      if (!tables.contains(expectTables[i])) {
        return false;
      }
    }
    return true;
  }
}
