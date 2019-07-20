import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:notes/model/note.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; //singleton Database Helper
  static Database _database;
  String noteTable = 'note_table';
  String colID = 'id';
  String colTitle = 'title';
  String colDescription = 'Description';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._creatInstance(); //named constructor to create instance of database helper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._creatInstance(); // This is executed onlu once, singleton object
    }
    return _databaseHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  void _createDatabase(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($colID INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT,'
        '$colDescription TEXT, $colPriority INTEGER, $colDate TEXT)');
  }

  Future<Database> initializeDatabase() async {
    //get the directory path for both android and ios to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    // open/create the database at this path
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  // Fetch operation : get all the note objects from Database
  Future<Map<String, dynamic>> getNoteMapList() async {
    Database db = await this.database;
    var result =
        await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
  }
  Future<int> insertNote(Note note)async{
    Database db =await this.database;
    var result = await db.rawInsert(''));

  }
}
