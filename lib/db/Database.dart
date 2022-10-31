import 'dart:io';

import 'package:sqflite/sqflite.dart' as sql;
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_de_leyes/model/question.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper; // Singleton DatabaseHelper
  static Database? _database; // Singleton Database

  String noteTable = 'questions_table';
  String colId = 'id';
  String colTitle = 'title';
  String colAns1 = 'answer1';
  String colAns2 = 'answer2';
  String colAns3 = 'answer3';
  String colAns4 = 'answer4';
  String colAnswer = 'answer';
  String colSelected = 'selected';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'questions.db';

    // Open/create the database at a given path
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $noteTable($colId TEXT, $colTitle TEXT, '
        '$colAns1 TEXT,   $colAns2 TEXT,  $colAns3 TEXT,   $colAns4 TEXT,  $colAnswer TEXT, $colSelected Text  )');
  }

  void closeDb() async {
    Database db = await database;
    await db.close();
  }

  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(noteTable);
    return result;
  }

  // Insert Operation: Insert a Note object to database
  Future<int> insertNote(Question note) async {
    Database db = await database;
    var result = await db.insert(noteTable, note.toMap());
    print("nota insertada");
    return result;
  }

  // Update Operation: Update a Note object and save it to database
  Future<int> updateNote(Question note) async {
    var db = await database;
    var result = await db.update(noteTable, note.toMap(),
        where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  // Delete Operation: Delete a Note object from database
  Future<int> deleteNote(String title) async {
    var db = await database;
    int result = await db.rawDelete('''
            DELETE FROM $noteTable WHERE title = '$title'
        ''');
    return result;
  }

  // Get number of Note objects in database
  Future<int> getCount() async {
    Database db = await database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int? result = Sqflite.firstIntValue(x);
    return result!;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Question>> getNoteList() async {
    var noteMapList = await getNoteMapList(); // Get 'Map List' from database
    int count =
        noteMapList.length; // Count the number of map entries in db table

    List<Question> noteList = [];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      noteList.add(Question.fromMapObject(noteMapList[i]));
    }

    return noteList;
  }
}
