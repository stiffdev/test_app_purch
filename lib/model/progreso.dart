class Progreso {
  late int numCorrect;
  late int numPreg;
  late int percent;

  Progreso(
      {required this.numCorrect, required this.numPreg, required this.percent});

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
        "corrects": numCorrect,
        "numpreg": numPreg,
        "percent": percent,
      };

  Progreso.fromMapObject(Map<String, dynamic> map) {
    numCorrect = map["corrects"] as int;
    numPreg = map["numpreg"] as int;
    percent = map["percent"] as int;
  }
}
