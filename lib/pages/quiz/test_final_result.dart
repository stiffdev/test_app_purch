import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../helpers/const.dart';
import '../../common_widget/buttons.dart';
import '../../db/Database.dart';
import '../../db/ExamDatabase.dart';
import '../../helpers/prefs.dart';
import '../../model/checked_question.dart';
import '../../service/test_service.dart';

class TestFinalResult extends StatelessWidget {
  const TestFinalResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*var ad = AdsHandler();

    ad.loadInter();*/

    DatabaseHelper databaseHelper = DatabaseHelper();
    databaseHelper.initializeDatabase();

    ExamDatabaseHelper examDatabaseHelper = ExamDatabaseHelper();
    examDatabaseHelper.initializeDatabase();

    var prefs = PreferencesUser();
    //prefs.numTest += 1;
    final checkedQuestion =
        ModalRoute.of(context)!.settings.arguments as CheckedList;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            "RESULTADOS", //"TEST ${checkedQuestion.test + 1}",
            style: GoogleFonts.creteRound(
                color: Colors.white, fontStyle: FontStyle.normal, fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
        body: Container(
          color: primaryColor,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            //alignment: Alignment.center,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width / 14,
                left: MediaQuery.of(context).size.width / 14,
                right: MediaQuery.of(context).size.width / 14),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 16),
                  GestureDetector(
                    child: Image(
                        image: AssetImage('assets/images/leyes.png'),
                        height: MediaQuery.of(context).size.height / 6,
                        gaplessPlayback: false),
                  ),
                  /* Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: CircularPercentIndicator(
                      animation: true,
                      animationDuration: 3000,
                      radius: MediaQuery.of(context).size.width / 2.2,
                      lineWidth: 40,
                      percent: 0.8,
                      progressColor: accentColor,
                      backgroundColor: primaryColor,
                      circularStrokeCap: CircularStrokeCap.round,
                      //fillColor: primaryColor,
                      // header: Text('25 / 25'),
                      center: Text(
                        '25 / 25',
                        style: GoogleFonts.lato(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),*/
                  SizedBox(height: MediaQuery.of(context).size.height / 18),
                  FutureBuilder<ExamenCorrected>(
                    future: TestService().checkExam(
                        checkedQuestion, databaseHelper, examDatabaseHelper),
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<ExamenCorrected> snapshot,
                    ) {
                      print(snapshot.connectionState);
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasError) {
                          return const Text('Error');
                        } else if (snapshot.hasData) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircularPercentIndicator(
                                radius: MediaQuery.of(context).size.width / 2.6,
                                animation: true,
                                animationDuration: 2000,
                                lineWidth: 30.0,
                                percent: snapshot.data!.percent,
                                arcBackgroundColor: Colors.white,
                                arcType: ArcType.HALF,
                                center: Text(
                                  "${snapshot.data!.number} de ${checkedQuestion.questions.length}",
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
                              // SizedBox(height: MediaQuery.of(context).size.height / 8),
                              MainButton(
                                  onPressed: () {
                                    /* if (ad != null &&
                                        ad.isInterstitialAdReady) {
                                      ad.interstitialAd.show();
                                    } else {
                                      prefs.ad = 0;
                                    }*/
                                    Navigator.pushNamed(context, '/revision',
                                        arguments: checkedQuestion);
                                  },
                                  text: 'Revisar'),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 20),
                              MainButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/menu2');
                                  },
                                  text: 'Menú'),
                            ],
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
                          return CircularProgressIndicator();
                        }
                      } else {
                        return Text('State: ${snapshot.connectionState}');
                      }
                    },
                  ),

                  /*  CircularPercentIndicator(
                    radius: MediaQuery.of(context).size.width / 2.6,
                    animation: true,
                    animationDuration: 2000,
                    lineWidth: 30.0,
                    percent: 0.8,
                    arcBackgroundColor: primaryColor,
                    arcType: ArcType.HALF,
                    center: Text(
                      "24/25",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.butt,
                    backgroundColor: Colors.transparent,
                    progressColor: accentColor,
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height / 8),
                  MainButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/menu2');
                      },
                      text: 'Revisar'),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  MainButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/menu2');
                      },
                      text: 'Menú'),
        
                  
        
                  CircularPercentIndicator(
                    radius: 60.0,
                    animation: true,
                    animationDuration: 1000,
                    lineWidth: 10.0,
                    percent: 1.0,
                    reverse: false,
                    arcType: ArcType.FULL_REVERSED,
                    startAngle: 0.0,
                    animateFromLastPercent: true,
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: Colors.green,
                    linearGradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      tileMode: TileMode.clamp,
                      stops: [0.0, 1.0],
                      colors: <Color>[
                        Colors.yellow,
                        Colors.red,
                      ],
                    ),
                    widgetIndicator: Center(
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    arcBackgroundColor: Colors.grey,
                  ),
                  CircularPercentIndicator(
                    radius: 60.0,
                    animation: true,
                    animationDuration: 1000,
                    lineWidth: 10.0,
                    percent: 0.9,
                    reverse: false,
                    arcType: ArcType.FULL,
                    startAngle: 0.0,
                    animateFromLastPercent: true,
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: Colors.green,
                    linearGradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      tileMode: TileMode.clamp,
                      stops: [0.0, 1.0],
                      colors: <Color>[
                        Colors.yellow,
                        Colors.red,
                      ],
                    ),
                    widgetIndicator: Center(
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    arcBackgroundColor: Colors.grey,
                  ),
                  CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 13.0,
                    animation: true,
                    animationDuration: 3000,
                    percent: 0.7,
                    animateFromLastPercent: true,
                    center: Text(
                      "70.0%",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    footer: Text(
                      "Sales this week",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.purple,
                    widgetIndicator: RotatedBox(
                      quarterTurns: 1,
                      child: Icon(Icons.airplanemode_active, size: 30),
                    ),
                  ),
                  CircularPercentIndicator(
                    radius: 50.0,
                    lineWidth: 10.0,
                    percent: 0.5,
                    center: Text("50%"),
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: Colors.grey,
                    maskFilter: MaskFilter.blur(BlurStyle.solid, 3),
                    linearGradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.orange, Colors.yellow],
                    ),
                  ),
                  CircularPercentIndicator(
                    radius: 50.0,
                    lineWidth: 10.0,
                    percent: 0.8,
                    header: Text("Icon header"),
                    center: Icon(
                      Icons.person_pin,
                      size: 50.0,
                      color: Colors.blue,
                    ),
                    reverse: true,
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircularPercentIndicator(
                          radius: 50.0,
                          animation: true,
                          animationDuration: 2000,
                          lineWidth: 10.0,
                          percent: 0.5,
                          arcBackgroundColor: Colors.orangeAccent,
                          arcType: ArcType.HALF,
                          center: Text(
                            "40 hours",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.transparent,
                          progressColor: Colors.red,
                        ),
                        CircularPercentIndicator(
                          radius: 60.0,
                          animation: true,
                          animationDuration: 2000,
                          lineWidth: 10.0,
                          percent: 0.5,
                          reverse: true,
                          arcBackgroundColor: Colors.teal,
                          arcType: ArcType.FULL,
                          center: Text(
                            "20 hours",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.yellow,
                          progressColor: Colors.red,
                        ),
                      ]),
                  CircularPercentIndicator(
                    radius: 50.0,
                    animation: true,
                    animationDuration: 2000,
                    lineWidth: 10.0,
                    percent: 0.5,
                    startAngle: 90,
                    center: Text(
                      "Start angle 250",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.butt,
                    backgroundColor: Colors.grey,
                    progressColor: Colors.red,
                  ),
                  CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 13.0,
                    animation: true,
                    animationDuration: 3000,
                    percent: 0.7,
                    animateFromLastPercent: true,
                    center: Text(
                      "70.0%",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    footer: Text(
                      "Sales this week",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.purple,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: CircularPercentIndicator(
                      radius: 30.0,
                      lineWidth: 5.0,
                      percent: 1.0,
                      center: Text("100%"),
                      progressColor: Colors.green,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularPercentIndicator(
                            radius: 22.0,
                            lineWidth: 4.0,
                            percent: 0.10,
                            center: Text("10%"),
                            progressColor: Colors.red,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          CircularPercentIndicator(
                            radius: 22.0,
                            lineWidth: 4.0,
                            backgroundWidth: 1.0,
                            percent: 0.2,
                            animation: true,
                            center: Text("20%"),
                            progressColor: Colors.orangeAccent,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          CircularPercentIndicator(
                            radius: 22.0,
                            lineWidth: 4.0,
                            percent: 0.30,
                            center: Text("30%"),
                            progressColor: Colors.orange,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          CircularPercentIndicator(
                            radius: 22.0,
                            lineWidth: 4.0,
                            backgroundWidth: 8,
                            animation: true,
                            animationDuration: 200,
                            percent: 0.60,
                            center: Text("60%"),
                            progressColor: Colors.yellow,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          CircularPercentIndicator(
                            radius: 22.0,
                            lineWidth: 4.0,
                            percent: 0.90,
                            center: Text("90%"),
                            progressColor: Colors.green,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          CircularPercentIndicator(
                            radius: 22.0,
                            lineWidth: 4.0,
                            percent: 1.0,
                            animation: true,
                            restartAnimation: true,
                            center: CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                            progressColor: Colors.redAccent,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CircularPercentIndicator(
                    radius: 40.0,
                    lineWidth: 5.0,
                    animation: true,
                    percent: .5,
                    animationDuration: 2500,
                    animateFromLastPercent: true,
                    center: Text(
                      "50.0%",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    footer: Text(
                      'statee',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.blueAccent,
                  ),
                  const SizedBox(height: 20),
                  CircularPercentIndicator(
                    radius: 40.0,
                    backgroundColor: Colors.white,
                    percent: .7,
                    lineWidth: 10,
                    backgroundWidth: 15,
                    fillColor: Colors.transparent,
                    circularStrokeCap: CircularStrokeCap.round,
                    arcBackgroundColor: Colors.transparent,
                    arcType: ArcType.HALF,
                  ),*/
                ],
              ),
            ),
          ),
        ));
  }
}
