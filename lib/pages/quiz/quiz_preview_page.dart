import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_de_leyes/common_widget/custom_app_bar.dart';
import 'package:test_de_leyes/helpers/const.dart';

import '../../common_widget/buttons.dart';
import '../../model/checked_question.dart';
import '../../model/question.dart';
import '../../service/test_service.dart';
import 'bloc/test_bloc.dart';

enum AppEnum { a, b, c, d, NON }

enum TypeEnum { common, error, NON }

class QuizPreviewPage extends StatefulWidget {
  const QuizPreviewPage({Key? key}) : super(key: key);

  @override
  State<QuizPreviewPage> createState() => _QuizPreviewPageState();
}

class _QuizPreviewPageState extends State<QuizPreviewPage> {
  @override
  Widget build(BuildContext context) {
    var a = 0;
    int answer = 0;
    String? answer1;

    AppEnum _character = AppEnum.NON;
    TypeEnum _type = TypeEnum.NON;

    final questioss =
        ModalRoute.of(context)!.settings.arguments as QuestionsPreview;

    return BlocProvider(
      create: (context) =>
          TestBloc(TestService())..add(LoadData(questioss.questions)),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: Column(children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF7B4EFF),
                      Color(0xFF41C2FF),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  boxShadow: [BoxShadow(blurRadius: 40.0)],
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 120.0)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                          Text(
                            "",
                            style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 10,
                      child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                                width: MediaQuery.of(context).size.width / 14,
                              ),
                          itemCount: questioss.questions.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onTap: (() {
                                setState(() {
                                  context.read<TestBloc>().current = i;
                                });
                              }),
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width / 6,
                                height: MediaQuery.of(context).size.width / 6,
                                decoration: BoxDecoration(
                                    color: context
                                                    .read<TestBloc>()
                                                    .questions
                                                    .length >
                                                0 &&
                                            context
                                                    .read<TestBloc>()
                                                    .questions[i]
                                                    .selected !=
                                                0
                                        ? Color.fromRGBO(151, 41, 247, 1)
                                        : Colors.white,
                                    shape: BoxShape.circle),
                                child: Text(
                                  (i + 1).toString(),
                                  style: GoogleFonts.openSans(
                                      color: Colors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              /*  SingleChildScrollView(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 10),
                child: */
              Expanded(
                child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: const AlwaysScrollableScrollPhysics(), // new
                    controller: ScrollController(),
                    shrinkWrap: true,
                    children: [
                      /* Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BackButton(
                                  color: Colors.white,
                                ),
                                Spacer()
                              ],
                            ),*/

                      BlocBuilder<TestBloc, TestState>(
                        builder: (context, state) {
                          if (state is TestLoading) {
                            return CircularProgressIndicator();
                          } else if (state is TestsLoaded) {
                            var bloc = context.read<TestBloc>();
                            var current = bloc.current;

                            if (current >= context.read<TestBloc>().total) {
                              return FutureBuilder<CheckedList>(
                                future: bloc.checkExam(state.list, /*num + */ 1,
                                    "Test", questioss.typeEnum),
                                builder: (
                                  BuildContext context,
                                  AsyncSnapshot<CheckedList> snapshot,
                                ) {
                                  print(snapshot.connectionState);
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.hasError) {
                                      return const Text('Error');
                                    } else if (snapshot.hasData) {
                                      /*  Navigator.pushNamed(
                                              context, '/finaltest',
                                              arguments:
                                                  snapshot.data as CheckedList);*/

                                      return Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Test Finalizado',
                                              style: GoogleFonts.openSans(
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30),
                                              textAlign: TextAlign.justify,
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  10,
                                            ),
                                            Image(
                                                image: AssetImage(
                                                    'assets/images/opodemy.png'),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    4,
                                                gaplessPlayback: false),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  10,
                                            ),
                                            MainButton(
                                                onPressed: () {
                                                  Navigator
                                                      .pushReplacementNamed(
                                                          context, '/finaltest',
                                                          arguments: snapshot
                                                                  .data
                                                              as CheckedList);
                                                },
                                                text: 'Ver Resultado'),
                                          ],
                                        ),
                                      );

                                      /*  return GestureDetector(
                                              onTap: (() {
                                                Navigator.pushReplacementNamed(
                                                    context, '/finaltest',
                                                    arguments: snapshot.data
                                                        as CheckedList);
                                              }),
                                              child: Text(
                                                  'fjdfgbejlbgjlkebglerkbglek'));*/
                                    } else {
                                      return Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Text(
                                          'Finalizado, calculando puntuación...',
                                          style: GoogleFonts.openSans(
                                              color: Colors.black,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 26),
                                          textAlign: TextAlign.justify,
                                        ),
                                      );
                                    }
                                  } else {
                                    return Text(
                                        'State: ${snapshot.connectionState}');
                                  }
                                },
                              );

                              /*  return GestureDetector(
                                    onTap: (() {
                                      var questions = bloc.checkExam(
                                          state.list, num + 1, "Test ${num + 1}");
                                      Navigator.pushNamed(context, '/finaltest',
                                          arguments: questions);
                                    }),
                                    child: Text(
                                      'Finalizado, calculando puntuación...',
                                      style: GoogleFonts.openSans(
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 26),
                                      textAlign: TextAlign.justify,
                                    ),
                                  );*/
                            } else {
                              var question = state.list[current];

                              return /*SingleChildScrollView(
                              physics: ScrollPhysics(),
                              child:*/
                                  /*   Expanded(
                              child:*/
                                  Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      question.title,
                                      style: GoogleFonts.openSans(
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                  ), //10

                                  question.answer1.isNotEmpty
                                      ? GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              context
                                                  .read<TestBloc>()
                                                  .saveAnswer(1);

                                              current += 1;
                                            });
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.3,
                                            padding: const EdgeInsets.all(10.0),

                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: context
                                                            .read<TestBloc>()
                                                            .questions[current]
                                                            .selected ==
                                                        1
                                                    ? [
                                                        Color(0xFF7B4EFF),
                                                        Color(0xFF41C2FF),
                                                      ]
                                                    : [
                                                        Colors.white,
                                                        Colors.white,
                                                      ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              border: Border.all(
                                                width: 3.0,
                                                color: Color(0xFF7B4EFF),
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      5.0) //         <--- border radius here
                                                  ),
                                            ), //       <--- BoxDecoration here
                                            child: Text(
                                              question.answer1,
                                              style: GoogleFonts.openSans(
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 13),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 25,
                                  ),

                                  question.answer2.isNotEmpty
                                      ? GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              context
                                                  .read<TestBloc>()
                                                  .saveAnswer(2);

                                              current += 1;
                                            });
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.3,
                                            padding: const EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: context
                                                            .read<TestBloc>()
                                                            .questions[current]
                                                            .selected ==
                                                        2
                                                    ? [
                                                        Color(0xFF7B4EFF),
                                                        Color(0xFF41C2FF),
                                                      ]
                                                    : [
                                                        Colors.white,
                                                        Colors.white,
                                                      ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              border: Border.all(
                                                width: 3.0,
                                                color: Color(0xFF7B4EFF),
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      5.0) //         <--- border radius here
                                                  ),
                                            ), //       <--- BoxDecoration here
                                            child: Text(
                                              question.answer2,
                                              style: GoogleFonts.openSans(
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 13),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 25,
                                  ),
                                  question.answer3.isNotEmpty &&
                                          question.answer3 != " " &&
                                          question.answer3 != "  "
                                      ? GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              context
                                                  .read<TestBloc>()
                                                  .saveAnswer(3);

                                              current += 1;
                                            });
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.3,
                                            padding: const EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: context
                                                            .read<TestBloc>()
                                                            .questions[current]
                                                            .selected ==
                                                        3
                                                    ? [
                                                        Color(0xFF7B4EFF),
                                                        Color(0xFF41C2FF),
                                                      ]
                                                    : [
                                                        Colors.white,
                                                        Colors.white,
                                                      ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              border: Border.all(
                                                width: 3.0,
                                                color: Color(0xFF7B4EFF),
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      5.0) //         <--- border radius here
                                                  ),
                                            ),
                                            child: Text(
                                              question.answer3,
                                              style: GoogleFonts.openSans(
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 13),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 25,
                                  ),

                                  question.answer4.isNotEmpty &&
                                          question.answer4 != " " &&
                                          question.answer4 != "  "
                                      ? GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              context
                                                  .read<TestBloc>()
                                                  .saveAnswer(4);

                                              current += 1;
                                            });
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.3,
                                            padding: const EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: context
                                                            .read<TestBloc>()
                                                            .questions[current]
                                                            .selected ==
                                                        4
                                                    ? [
                                                        Color(0xFF7B4EFF),
                                                        Color(0xFF41C2FF),
                                                      ]
                                                    : [
                                                        Colors.white,
                                                        Colors.white,
                                                      ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              border: Border.all(
                                                width: 3.0,
                                                color: Color(0xFF7B4EFF),
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      5.0) //         <--- border radius here
                                                  ),
                                            ), //       <--- BoxDecoration here
                                            child: Text(
                                              question.answer4,
                                              style: GoogleFonts.openSans(
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 13),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      : SizedBox(),

                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 25,
                                  ),
                                ],
                                //  ),
                                // ),
                              );
                            }

                            /* return IconButton(
                                        onPressed: () {
                                          TestService().readJson(num + 1);
                                        },
                                        icon: Icon(Icons.abc_outlined)); */
                          }
                          return Text('data');
                        },
                      ),
                    ]),
              ),
              // )
            ]),
          )),
    );
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
      width: 3.0,
      color: Color(0xFF7B4EFF),
    ),
    borderRadius:
        BorderRadius.all(Radius.circular(5.0) //         <--- border radius here
            ),
  );
}
