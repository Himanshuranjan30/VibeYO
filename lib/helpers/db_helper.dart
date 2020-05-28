import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT,description TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  static Future<void> updateData(String descriptione,String ide) async{
     final db = await DBHelper.database();
     await db.rawUpdate(
    'UPDATE user_places SET description = ? WHERE id = ?',
    [descriptione,ide]);
    

  }
  
  static Future<void> delete(String iid) async{

    final db= await DBHelper.database();
    await  db.rawDelete('DELETE FROM user_places WHERE id = ?',[iid]);

  }
}
