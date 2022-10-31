import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../model/checked_question.dart';
import '../../helpers/const.dart';

class RevisionPage extends StatelessWidget {
  RevisionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checkedQuestion =
        ModalRoute.of(context)!.settings.arguments as CheckedList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "REVISION",
          style: GoogleFonts.creteRound(
              color: Colors.white, fontStyle: FontStyle.normal, fontSize: 30),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        //color: primaryColor,
        child: SafeArea(
            child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width / 14,
                    left: MediaQuery.of(context).size.width / 14,
                    right: MediaQuery.of(context).size.width / 14),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      for (int i = 0; i < checkedQuestion.questions.length; i++)
                        getQuestionCheck(
                            checkedQuestion.questions[i], i, context)
                    ])))),
      ),
    );
  }

  Widget getQuestionCheck(
      CheckedQuestion question, int num, BuildContext context) {
    print("Preguntaaaaaa $num      ${question.toString()}");
    if (question.answer == question.correct) {
      return Container(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
            Text(
              '${num + 1}. ${question.question.title}',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                // color: Colors.red,

                borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.height / 25),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(14),
                    child: Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      width: double.infinity,
                      color:
                          question.correct == 1 ? Colors.green : primaryColor,
                      child: Text(
                        question.question.answer1,
                        style: GoogleFonts.creteRound(
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.all(14),
                    child: Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      width: double.infinity,
                      color:
                          question.correct == 2 ? Colors.green : primaryColor,
                      child: Text(
                        question.question.answer2,
                        style: GoogleFonts.creteRound(
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  question.question.answer3.isNotEmpty
                      ? Column(
                          children: [
                            Divider(
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.all(14),
                              child: Container(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                width: double.infinity,
                                color: question.correct == 3
                                    ? Colors.green
                                    : primaryColor,
                                child: Text(
                                  question.question.answer3,
                                  style: GoogleFonts.creteRound(
                                      color: Colors.white,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                          ],
                        )
                      : SizedBox(),
                  question.question.answer4.isNotEmpty
                      ? Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(14),
                              child: Container(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                width: double.infinity,
                                color: question.correct == 4
                                    ? Colors.green
                                    : primaryColor,
                                child: Text(
                                  question.question.answer4,
                                  style: GoogleFonts.creteRound(
                                      color: Colors.white,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                          ],
                        )
                      : SizedBox(),

                  /* question.question.answer4.isNotEmpty
                      ? Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(14),
                              child: Container(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                width: double.infinity,
                                color: question.correct == 4
                                    ? Colors.green
                                    : primaryColor,
                                child: Text(
                                  "${question.question.answer4}",
                                  style: GoogleFonts.creteRound(
                                      color: Colors.white,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                          ],
                        )
                      : Text(
                          "blablablabal  bdfkwrgb dvger",
                          style: GoogleFonts.creteRound(
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontSize: 18),
                          textAlign: TextAlign.center,
                        ), */ /*SizedBox()*/
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
            Text(
              '${num + 1}. ${question.question.title}',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                // color: Colors.red,

                borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.height / 25),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(14),
                    child: Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      width: double.infinity,
                      color: getColor(question.correct, question.answer, 1),
                      child: Text(
                        question.question.answer1,
                        style: GoogleFonts.creteRound(
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.all(14),
                    child: Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      width: double.infinity,
                      color: getColor(question.correct, question.answer, 2),
                      child: Text(
                        question.question.answer2,
                        style: GoogleFonts.creteRound(
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  question.question.answer3.isNotEmpty
                      ? Column(
                          children: [
                            Divider(
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.all(14),
                              child: Container(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                width: double.infinity,
                                color: getColor(
                                    question.correct, question.answer, 3),
                                child: Text(
                                  question.question.answer3,
                                  style: GoogleFonts.creteRound(
                                      color: Colors.white,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                          ],
                        )
                      : SizedBox(),
                  question.question.answer4.isNotEmpty
                      ? Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(14),
                              child: Container(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                width: double.infinity,
                                color: getColor(
                                    question.correct, question.answer, 4),
                                child: Text(
                                  question.question.answer4,
                                  style: GoogleFonts.creteRound(
                                      color: Colors.white,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                          ],
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  Color getColor(int correct, int answer, int current) {
    print("actual: $current correcta: $correct     resp:    $answer ");
    if (correct == current) {
      return Colors.green;
    } else if (answer == current) {
      return accentColorRed;
    } else {
      return primaryColor;
    }
    //  return Colors.green;
  }
}
