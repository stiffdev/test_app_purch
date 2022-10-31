import 'package:test_de_leyes/model/question.dart';

import '../pages/quiz/quiz_preview_page.dart';

class CheckedQuestion {
  Question question;
  int answer;
  int correct;
  TypeEnum typeEnum;

  CheckedQuestion(
      {required this.question,
      required this.answer,
      required this.correct,
      required this.typeEnum});

  @override
  String toString() {
    return "question: ${question.answer1}                   ${question.answer2}               ${question.answer3}               ${question.answer4}";
  }
}

class CheckedList {
  List<CheckedQuestion> questions;
  int test;
  String name;
  TypeEnum typeEnum;

  CheckedList(
      {required this.questions,
      required this.test,
      required this.name,
      required this.typeEnum});
}

class QuestionCorrection {
  bool isCorrect;
  Question question;
  int answer;
  int correct;

  QuestionCorrection(
      {required this.isCorrect,
      required this.question,
      required this.answer,
      required this.correct});
}

class ExamenCorrected {
  List<QuestionCorrection> questions;
  int number;
  double percent;

  ExamenCorrected(
      {required this.questions, required this.number, required this.percent});
}
