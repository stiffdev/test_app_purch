import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:test_de_leyes/service/test_service.dart';

import '../../common_widget/counter.dart';
import '../../common_widget/my_header.dart';
import '../../db/ExamDatabase.dart';
import '../../helpers/const.dart';
import '../../model/exam.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final controller = ScrollController();
  double offset = 0;

  ExamDatabaseHelper examDatabaseHelper = ExamDatabaseHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      // offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    TestService().getProgress(examDatabaseHelper);

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        // controller: controller,
        child: FutureBuilder<Exam>(
          future: TestService().getProgress(examDatabaseHelper),
          builder: (
            BuildContext context,
            AsyncSnapshot<Exam> snapshot,
          ) {
            print(snapshot.connectionState);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    MyHeader(
                      image: "assets/images/teacher.png",
                      textTop: "Estadísticas",
                      textBottom: "de aprendizaje",
                      offset: offset,
                    ),
                    /*  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Color(0xFFE5E5E5),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          // SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                          SizedBox(width: 20),
                          Expanded(
                            child: DropdownButton(
                              isExpanded: true,
                              underline: SizedBox(),
                              icon: Icon(Icons.arrow_drop_down),
                              value: "Histórico",
                              items: [
                                'Histórico',
                                'Últimos 7 días',
                                'Últimos mes',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),*/
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 30,
                                  color: kShadowColor,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Counter(
                                  color: kInfectedColor,
                                  number: snapshot.data!.numPreg,
                                  title: "Preguntas",
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 5,
                                ),
                                /* Counter(
                            color: kDeathColor,
                            number: 87,
                            title: "Porcentaje",
                          ),*/
                                Counter(
                                  color: kRecovercolor,
                                  number: snapshot.data!.numCorrect,
                                  title: "Aciertos",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Porcentaje de Acierto",
                            style: kTitleTextstyle,
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.all(20),
                            // height: MediaQuery.of(context).size.height / 3,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: primaryColor,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 30,
                                  color: kShadowColor,
                                ),
                              ],
                            ),
                            child: CircularPercentIndicator(
                              radius: MediaQuery.of(context).size.width / 2.6,
                              animation: true,
                              animationDuration: 2000,
                              lineWidth: 30.0,
                              percent: snapshot.data!.percent,
                              arcBackgroundColor: Colors.white,
                              arcType: ArcType.HALF,
                              center: Text(
                                "${(snapshot.data!.percent * 100).toStringAsFixed(1)} %" /* "${snapshot.data!.number} de ${checkedQuestion.questions.length}"*/,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 38.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: Colors.transparent,
                              progressColor: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          },
        ),
      ),
    );
  }
}
