import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<void> insert(String table, Map<String, Object> data) async {
    final dbPath = await sql.getDatabasesPath();
    final database = await sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: _onDatabaseCreating, version: 1);

    database.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<void> _onDatabaseCreating(sql.Database db, int version) {
    return db.execute(
      'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)',
    );
  }
}
