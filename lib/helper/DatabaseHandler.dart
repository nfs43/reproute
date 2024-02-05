import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DatabaseHandler {
  static DatabaseHandler? _instance;
  late Database db;

  DatabaseHandler._();

  static Future<DatabaseHandler> init() async {
    _instance ??= DatabaseHandler._();
    _instance!.db = await _instance!._initializeDB();
    return Future(() => _instance!);
  }

  Future<Database> _initializeDB() async {
    String path = await getDatabasesPath();
    db = await openDatabase(
      join(path, 'Bookngly.db'),
      onCreate: (database, version) async {
        await database.execute(
            "CREATE TABLE Stores(id INTEGER PRIMARY KEY AUTOINCREMENT, storeId TEXT NOT NULL, isSynced INTEGER NOT NULL)");
      },
      version: 1,
    );
    return db;
  }

  Future<void> deleteStores(String storeId) async {
    await db.delete(
      'Stores',
      where: "storeId = ?",
      whereArgs: [storeId],
    );
  }

  Future<List<String>> getStoresUnsynced() async {
    final List<Map<String, Object?>> queryResult = await db.query('Stores');
    List<String> unsyncedStores = [];
    queryResult.forEach((element) {
      element["isSynced"]==0?unsyncedStores.add(element["storeId"].toString()):null;
    });
    return unsyncedStores;
  }

  Future<List<String>> getStoresSynced() async {
    final List<Map<String, Object?>> queryResult = await db.query('Stores');
    return queryResult.map((e) {
      String storeId= "";
      if(e["isSynced"]==1){
        storeId = e["storeId"].toString();
      }
      return storeId;
    }).toList();
  }

  Future<List<String>> getAllStores() async {
    final List<Map<String, Object?>> queryResult = await db.query('Stores');
    return queryResult.map((e) {
      return e["storeId"].toString();
    }).toList();
  }

  Future<int> updateStore(String storeId) async {
    int result = 0;
    result = await db.update('Stores', {"isSynced":1},where: "storeId = ?",
      whereArgs: [storeId],);
    return result;
  }

  Future<int> addStore(String wishlistId, [int? isSynced = 0]) async {
    int result = 0;
    result = await db.insert('Stores', {"storeId": wishlistId,"isSynced":isSynced});
    return result;
  }

  // Future<int> insertUser(List<SearchResult> users) async {
  //   int result = 0;

  //   for (var user in users) {
  //     // db.delete(
  //     //   'users',
  //     //   where: "user = ?",
  //     //   whereArgs: [user.id],
  //     // );
  //     result = await db.insert('Stores', user.toMap());
  //   }
  //   return result;
  // }

  // Future<List<SearchResult>> retrieveUsers() async {
  //   final List<Map<String, Object?>> queryResult =
  //       await db.query('Stores', orderBy: "id DESC", limit: 5);
  //   return queryResult.map((e) => SearchResult.fromMap(e)).toList();
  // }

  Future<void> deleteUser(int id) async {
    await db.delete(
      'Stores',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
