import 'package:uuid/uuid.dart';

class Exam {
  late String id;
  late String date;
  late int numCorrect;
  late int numPreg;
  late double percent;

  Exam(
      {required this.id,
      required this.date,
      required this.numCorrect,
      required this.numPreg,
      required this.percent});

  /*factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      id: Uuid().v1(),
      title: json["Title"],
      answer1: json["Answer 1"].toString(),
      answer2: json["Answer 2"].toString(),
      answer3: json["Answer 3"].toString(),
      answer4: json["Answer 4"].toString(),
      answer: json["Answer"].toString(),
      selected: 0,
    );
  }*/

  Map<String, dynamic> toMap() => {
        "id": id,
        "date": date,
        "corrects": numCorrect,
        "numpreg": numPreg,
        "percent": percent,
      };

  Exam.fromMapObject(Map<String, dynamic> map) {
    id = map['id'] as String;
    date = map['date'] /*.toIso8601String()*/ as String;
    numCorrect = map["corrects"] as int;
    numPreg = map["numpreg"] as int;
    percent = map["percent"] == null ? 0.0 : map["percent"] as double;
  }
}
