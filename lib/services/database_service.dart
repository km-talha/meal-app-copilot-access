import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'meal_app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createTables,
    );
  }

  Future<void> _createTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE students (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        age INTEGER
      );
    ''');

    await db.execute('''
      CREATE TABLE meal_selection (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_id INTEGER,
        meal TEXT,
        FOREIGN KEY (student_id) REFERENCES students (id) ON DELETE CASCADE
      );
    ''');

    await db.execute('''
      CREATE TABLE guest_meals (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        guest_name TEXT,
        meal TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE daily_summary (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT,
        total_meals INTEGER
      );
    ''');

    await db.execute('''
      CREATE TABLE logs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        action TEXT,
        timestamp TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE sync_queue (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        data TEXT,
        status TEXT
      );
    ''');
  }

  Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    await db.insert(table, data);
  }

  Future<List<Map<String, dynamic>>> fetch(String table) async {
    final db = await database;
    return await db.query(table);
  }

  Future<void> update(String table, Map<String, dynamic> data, int id) async {
    final db = await database;
    await db.update(table, data, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> delete(String table, int id) async {
    final db = await database;
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}