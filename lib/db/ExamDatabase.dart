import 'dart:io';

import 'package:sqflite/sqflite.dart' as sql;
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_de_leyes/model/question.dart';

import '../model/exam.dart';

class ExamDatabaseHelper {
  static ExamDatabaseHelper?
      _databaseHelper; // Singleton ExamExamDatabaseHelper
  static Database? _database; // Singleton Database

  String examsTable = 'exams_table';
  String colExId = 'id';
  String colDate = 'date';
  String colCorrects = 'corrects';
  String colNumPreg = 'numpreg';
  String colPercent = 'percent';

  ExamDatabaseHelper._createInstance(); // Named constructor to create instance of ExamDatabaseHelper

  factory ExamDatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = ExamDatabaseHelper
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
    String path = directory.path + 'exams.db';

    // Open/create the database at a given path
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $examsTable($colExId TEXT, $colDate TEXT, '
        '$colCorrects INTEGER,   $colNumPreg INTEGER,  $colPercent REAL )');
  }

  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(examsTable);
    return result;
  }

  // Insert Operation: Insert a Note object to database
  Future<int> insertNote(Exam note) async {
    Database db = await database;
    var result = await db.insert(examsTable, note.toMap());
    print("examen insertado");
    return result;
  }

  // Get number of Note objects in database
  Future<int> getCount() async {
    Database db = await database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $examsTable');
    int? result = Sqflite.firstIntValue(x);
    return result!;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Exam>> getNoteList() async {
    var noteMapList = await getNoteMapList(); // Get 'Map List' from database
    int count =
        noteMapList.length; // Count the number of map entries in db table

    List<Exam> noteList = [];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      noteList.add(Exam.fromMapObject(noteMapList[i]));
    }

    return noteList;
  }
}
