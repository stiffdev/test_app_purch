import 'package:test_de_leyes/pages/quiz/quiz_preview_page.dart';
import 'package:uuid/uuid.dart';

class Question {
  late String id;
  late String title;
  late String answer1;
  late String answer2;
  late String answer3;
  late String answer4;
  late String answer;
  late int selected;

  Question(
      {required this.id,
      required this.title,
      required this.answer1,
      required this.answer2,
      required this.answer3,
      required this.answer4,
      required this.answer,
      this.selected = 0});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: Uuid().v1(),
      title: json["Title"],
      answer1: json["Answer 1"].toString(),
      answer2: json["Answer 2"].toString(),
      answer3: json["Answer 3"].toString(),
      answer4: json["Answer 4"].toString(),
      answer: json["Answer"].toString(),
      selected: 0,
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "answer1": answer1,
        "answer2": answer2,
        "answer3": answer3,
        "answer4": answer4,
        "answer": answer,
        "selected": 0,
      };

  Question.fromMapObject(Map<String, dynamic> map) {
    id = map['id'] as String;
    title = map['title'] as String;
    answer1 = map["answer1"] as String;
    answer2 = map["answer2"] as String;
    answer3 = map["answer3"] as String;
    answer4 = map["answer4"] as String;
    answer = map["answer"] as String;
    selected = 0 as int;
  }
}

class QuestionsPreview {
  late List<Question> questions;
  late TypeEnum typeEnum;

  QuestionsPreview({
    required this.questions,
    required this.typeEnum,
  });
}
