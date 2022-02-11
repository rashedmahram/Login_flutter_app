import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // Variable dbname,dbversion,tbname,colid,colname,colpassword;
  static final dbName = "dbUsers.db";
  static final dbVersion = 1;
  static final tbName = "tbUsers";

  static final _ColId = "Users";
  static final _ColName = "Users";

  // make it singleton class
  DatabaseHelper._privateConsturctor();
  static final DatabaseHelper instance = DatabaseHelper._privateConsturctor();

  static late Database _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    await openDatabase(path, onCreate: _onCreate, version: dbVersion);
  }

  FutureOr<void> _onCreate(Database db, int version) {
    db.query('''
                CEATE TABLE $tbName(
                $_ColId INTEGER PRIMARY KEY,
                $_ColName TEXT NOT NULL,
                )
                ''');
    
  }

  Future<List<Map<String,dynamic>>>queryAll()async{
    Database db=await instance.database;
    return await db.query(tbName);
  }

  Future<int> update(Map<String,dynamic> row)async{
    Database db = await instance.database;
    int id= row[_ColId];
    return await db.update(tbName, row,where: '$_ColId=?',whereArgs: [id]);
  }

  Future<int>delete(int id)async{
    Database db = await instance.database;
    return await db.delete(tbName, where: '$_ColId=?', whereArgs: [id]);
  }
}
