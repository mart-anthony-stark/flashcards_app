import 'package:flashcards_app/models/collection.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SqlService {
  late String table;

  SqlService({required this.table});

  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE collections(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT,
      description TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('sqlite.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  Future<int> save(Map<String, dynamic> data) async {
    final db = await SqlService.db();
    final id = await db.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  Future<List<T>> getAll<T>() async {
    final db = await SqlService.db();
    final List<Map<String, dynamic>> results =
        await db.query(table, orderBy: 'id');
    return results.map<T>((data) => _mapToModel<T>(data)).toList();
  }

  T _mapToModel<T>(Map<String, dynamic> data) {
    if (T == CollectionModel) {
      // Map the data to CollectionModel
      return CollectionModel.fromJson(data) as T;
    }

    throw Exception('Unsupported model type');
  }

  Future<int> update(int id, Map<String, dynamic> data) async {
    final db = await SqlService.db();
    final result =
        await db.update(table, data, where: 'id = ?', whereArgs: [id]);
    return result;
  }

  Future<void> deleteOne(int id) async {
    final db = await SqlService.db();
    try {
      await db.delete(table, where: 'id = ?', whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
