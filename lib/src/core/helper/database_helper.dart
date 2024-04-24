import 'package:hashmicro_test/src/core/data/model/attendance_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();
  static Database? _database;
  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblAttendance = 'tbl_attendance';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/hashmicro_test.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblAttendance (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        time TEXT,
        latitudeMyLocation REAL,
        longitudeMyLocation REAL,
        latitudeOffice REAL,
        longitudeOffice REAL,
        distance REAL,
        isValid INTEGER
      );
    ''');
  }

  Future<int> insertAttendance(AttendanceModel attendance) async {
    final db = await database;
    return await db!.insert(_tblAttendance, attendance.toMap());
  }

  Future<List<AttendanceModel>> getAllAttendance() async {
   final db = await database;
    List<Map<String, dynamic>> maps = await db!.query(_tblAttendance);
    return List.generate(maps.length, (i) {
      return AttendanceModel.fromMap(maps[i]);
    });
  }
}
