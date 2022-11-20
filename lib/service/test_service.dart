import 'dart:convert';

import 'dart:async';

import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_de_leyes/db/ExamDatabase.dart';
import 'package:test_de_leyes/helpers/prefs.dart';
import 'package:test_de_leyes/model/exam.dart';
import 'package:test_de_leyes/pages/quiz/quiz_preview_page.dart';
import 'package:uuid/uuid.dart';

import '../db/Database.dart';
import '../model/checked_question.dart';
import '../model/ley.dart';
import '../model/question.dart';
import '../pages/custom_exam/custom_exam_page.dart';

class TestService {
  getDateForPremium() {
    DateTime dateTime = DateTime.now();

    //print(dateTime.toString()); //2022-03-04 12:35:38.997
    int day = dateTime.day;

    var prefs = PreferencesUser();
    if (prefs.lastDay == 0 || prefs.lastDay != day) {
      prefs.lastDay = day;
      prefs.numTest = 0;
      prefs.numAciertos = 0;
    }
    print(day.toString());
  }

  bool checkFirstDay() {
    DateTime dateTime = DateTime.now();

    //print(dateTime.toString()); //2022-03-04 12:35:38.997
    int day = dateTime.day;

    var prefs = PreferencesUser();

    if (prefs.firstDayOpen == 0) {
      prefs.firstDayOpen = day;
      print("holiiii");
      return true;
    } else {
      print("holiiii2");
      return false;
    }
  }

  bool getNumTest() {
    var prefs = PreferencesUser();
    var premium = prefs.premium;
    var t = prefs.numTest;
    if (t >= 5 && premium == 0) {
      return true;
    } else {
      return false;
    }
  }

  addNewTestDone() {
    var prefs = PreferencesUser();
    var test = prefs.numTest;

    prefs.numTest = test + 1;

    print("numero de test ${prefs.numTest} ");
  }

  sumQuestionsCorrects(int numAciertos) {
    var prefs = PreferencesUser();
    var test = prefs.numAciertos;

    prefs.numAciertos = test + numAciertos;

    print("numero de test ${prefs.numAciertos} ");
  }

  bool getIsPremium() {
    var prefs = PreferencesUser();
    print(prefs.premium);
    if (prefs.premium == 0) {
      print("no es premiummmm compr");
      return false;
    } else {
      return true;
    }
  }

  Future<List<Question>> getCustomTestQuestions(
      List<SelectionModel> leyes) async {
    // List<Question> questions = [];
    List<Question> defList = [];
    for (int i = 0; i < leyes.length; i++) {
      var allQuestions = await readJsonByUrl(leyes[i].ley.file.toString());

      List<int> exclude = [];

      for (int i = 1; i <= 10; i++) {
        var question = getRandomElement(allQuestions, exclude);
        allQuestions.remove(question);
        defList.add(question);
      }
    }

    return defList;
  }

  Future<List<Question>> getErrorTestQuestions(
      List<SelectionModel> leyes) async {
    // List<Question> questions = [];
    List<Question> defList = [];
    if (leyes.length < 3) {
      print("no enough questions");
    } else {
      for (int i = 0; i < leyes.length; i++) {
        var allQuestions = await readJsonByUrl(leyes[i].ley.file.toString());

        List<int> exclude = [];

        for (int i = 1; i <= 10; i++) {
          var question = getRandomElement(allQuestions, exclude);
          allQuestions.remove(question);
          defList.add(question);
        }
      }
    }

    return defList;
  }

  Future<Exam> getProgress(ExamDatabaseHelper examDb) async {
    examDb.initializeDatabase();
    var e = await examDb.getNoteMapList();
    var percentSum = 0.0;

    var count = 0;
    var corrects = 0;
    var date = "";

    for (int i = 0; i < e.length; i++) {
      Exam ex = Exam.fromMapObject(e[i]);
      percentSum += ex.percent;
      count += ex.numPreg;
      corrects += ex.numCorrect;
      /* print(ex.date);
      print(ex.numCorrect);
      print(ex.numPreg);
      print(ex.percent);*/
    }

    return Exam(
        id: "",
        date: "",
        numCorrect: corrects,
        numPreg: count,
        percent: corrects / count);
  }

  Future<List<Question>> readJson(int number) async {
    List<Question> questions = [];

    final String response = await rootBundle
        .loadString('assets/files/constitucion/test-variado-$number.json');
    final List<dynamic> data = await json.decode(response);

    for (int i = 1; i < data.length; i++) {
      //  var question = Question(title: title)
      print(data[i]["Answer"]);
      print(data.length);
      var question = Question.fromJson(data[i]);
      questions.add(question);
    }

    // print(questions);

    return questions;
  }

  Future<List<Question>> readJson2(String number) async {
    List<Question> questions = [];

    final String response = await rootBundle
        .loadString('assets/files/constitucion/test-titulo-$number.json');
    final List<dynamic> data = await json.decode(response);

    for (int i = 0; i < data.length; i++) {
      //  var question = Question(title: title)
      print(data[i]["Answer"]);
      print(data.length);
      var question = Question.fromJson(data[i]);
      questions.add(question);
    }

    // print(questions);
    return questions;
  }

  Future<List<Question>> readJsonByUrl(String jsonString) async {
    List<Question> questions = [];
    print(jsonString);
    final String response = await rootBundle.loadString(jsonString);

    final List<dynamic> data = await json.decode(response);

    for (int i = 0; i < data.length; i++) {
      //  var question = Question(title: title)
      print(data[i]["Answer"]);
      print(data.length);
      var question = Question.fromJson(data[i]);
      questions.add(question);
    }

    // print(questions);
    return questions;
  }

  Question getRandomElement<T>(List<Question> list, List<int> exclude) {
    final random = Random();
    var i = random.nextInt(list.length - 1);
    return list[i];
  }

  Future<List<Question>> getRandomQuestionsCommon(
      /*List<Question> questions*/ String number) async {
    var questions = await readJsonByUrl(number.toString());
    List<int> exclude = [];

    List<Question> defList = [];

    for (int i = 1; i <= 12; i++) {
      var question = getRandomElement(questions, exclude);
      questions.remove(question);
      defList.add(question);
    }

    print("tamañoooo ${defList.length}");

    return defList;
  }

  Future<List<Question>> getRandomQuestions(
      /*List<Question> questions*/ int number) async {
    var questions = await readJson2(number.toString());

    List<Question> defList = [];
    List<int> exclude = [];

    for (int i = 1; i <= 12; i++) {
      var question = getRandomElement(questions, exclude);
      questions.remove(question);
      defList.add(question);
    }

    print("tamañoooo ${defList.length}");

    return defList;
  }

  Future<List<Question>> getQuestions(
      /*List<Question> questions*/ String number) async {
    var questions = await readJson2(number.toString());

    return questions;
  }

  Future<ExamenCorrected> checkExam(
      CheckedList exam,
      DatabaseHelper databaseHelper,
      ExamDatabaseHelper examDatabaseHelper) async {
    List<QuestionCorrection> list = [];
    int questionsTrue = 0;
    for (int i = 0; i < exam.questions.length; i++) {
      if (exam.questions[i].question.selected == exam.questions[i].correct) {
        QuestionCorrection questionCorrection = QuestionCorrection(
            isCorrect: true,
            question: exam.questions[i].question,
            answer: exam.questions[i].answer,
            correct: exam.questions[i].correct);

        list.add(questionCorrection);
        questionsTrue += 1;

        if (exam.typeEnum == TypeEnum.error) {
          await databaseHelper.deleteNote(exam.questions[i].question.title);
        }
      } else {
        if (exam.typeEnum == TypeEnum.common) {
          await databaseHelper.insertNote(exam.questions[i].question);
        }

        QuestionCorrection questionCorrection = QuestionCorrection(
            isCorrect: false,
            question: exam.questions[i].question,
            answer: exam.questions[i].answer,
            correct: exam.questions[i].correct);

        list.add(questionCorrection);
      }
    }
    var percent =
        ((questionsTrue) / (exam.questions.length)); //porcentaje verdad

    var examen = Exam(
        id: Uuid().v1(),
        date: DateTime.now().toIso8601String(),
        numCorrect: questionsTrue,
        numPreg: exam.questions.length,
        percent: percent.toDouble());

    await examDatabaseHelper.insertNote(examen);

    await addNewTestDone();
    await sumQuestionsCorrects(questionsTrue);

    return ExamenCorrected(
        questions: list, number: questionsTrue, percent: percent);
  }

  Future<List<Question>> getErrorQuestions(DatabaseHelper db) async {
    List<Question> questions = [];
    db.initializeDatabase();
    var e = await db.getNoteMapList();

    for (int i = 0; i < e.length; i++) {
      Question question = Question.fromMapObject(e[i]);
      questions.add(question);
    }

    return questions;
  }

/*
  Future<PDFDocument> getDoc(int num) async {
    var document = await PDFDocument.fromAsset('assets/libro$num.pdf');
    return document;
  }*/

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  Future<String> getF(String asset, String filename) async {
    await fromAsset(asset, filename).then((f) {
      return f.path;
    });

    return "";
  }
}
