import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/const.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> splashData = [
    {
      "title": "Miles de preguntas\n de leyes\n",
      "subtitle":
          "El mayor recopilatorio de preguntas de leyes, todas ellas de exámenes oficiales de oposiciones, para que el día de la prueba no se te escape ninguna.",
      "image": "assets/images/quiz.png"
    },
    {
      "title": "Repaso de Errores\n",
      "subtitle":
          "Puedes repasar y hacer tests de las preguntas que hallas fallado, para que no vuelvas a cometer el mismo fallo",
      "image": "assets/images/exam.png"
    },
    {
      "title": "Genera tu propio\n examen\n",
      "subtitle":
          "Ahora puedes generar simulacros de examen de varios temas, seleccionando los que más te interesen o los que más necesites repasar",
      "image": "assets/images/leyes.png"
    },
    {
      "title": "Trackeo de estadísticas\n",
      "subtitle":
          "Análisis de tus estadísticas, aciertos y errores, para que puedas ver tus avances en el aprendizaje",
      "image": "assets/images/stats.png"
    },
  ];

  AnimatedContainer _buildDots({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _controller,
                itemCount: splashData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Image(
                          image: AssetImage('assets/images/opodemy.png'),
                          height: MediaQuery.of(context).size.height / 10,
                        ),
                      ),
                      Spacer(flex: 2),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          splashData[index]['title']!.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          splashData[index]['subtitle']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            height: 1.5,
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Image(
                        image: AssetImage(splashData[index]['image']!),
                        height: MediaQuery.of(context).size.height / 5,
                      ),
                      /*  AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          splashData[index]['image']!,
                          fit: BoxFit.contain,
                        ),
                      ),*/
                      Spacer(),
                    ],
                  );
                },
                onPageChanged: (value) => setState(() => _currentPage = value),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (int index) => _buildDots(index: index),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: GestureDetector(
                        onTap: () {
                          if (_currentPage + 1 == splashData.length) {
                            Navigator.pushReplacementNamed(context, '/menu2');
                          } else {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                        child: Material(
                          elevation: 7.0,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xFF7B4EFF),
                                Color(0xFF41C2FF),
                              ],
                            )),
                            height: MediaQuery.of(context).size.height / 14,
                            // height: MediaQuery.of(context).size.height / 14,
                            width: double.infinity,
                            child: Container(
                              //constraints: BoxConstraints(
                              //  maxHeight: 100.0,
                              //minHeight: 10,
                              //maxWidth: 200.0,
                              //minHeight: MediaQuery.of(context).size.height / 14,
                              //minWidth: 100.0,
                              //  ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const SizedBox(width: 50),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        _currentPage + 1 == splashData.length
                                            ? 'Ir a la app'
                                            : 'Siguiente',
                                        style: GoogleFonts.openSans(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 50.0,
                                    child: Icon(
                                      Icons.navigate_next,
                                      color: Colors.white,
                                      size: 25.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )

                      /*SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      child: FlatButton(
                        onPressed: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(
                          _currentPage + 1 == splashData.length
                              ? 'Go to app'
                              : 'Continue',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: const Color(0xFF68B684),
                      ),
                    ),*/
                      ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
