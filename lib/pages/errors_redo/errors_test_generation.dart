import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_de_leyes/model/ley.dart';

import '../../ad/ads_helper.dart';
import '../../common_widget/buttons.dart';
import '../../db/Database.dart';
import '../../helpers/const.dart';
import '../../helpers/prefs.dart';
import '../../model/question.dart';
import '../../service/test_service.dart';
import '../constitucion/test_titulos/bloc/test_by_title_bloc_bloc.dart';
import '../constitucion/test_titulos/generate_by_title_page.dart';
import '../quiz/quiz_preview_page.dart';

class ErrorTestGenerationPage extends StatefulWidget {
  ErrorTestGenerationPage({Key? key}) : super(key: key);

  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  State<ErrorTestGenerationPage> createState() =>
      _ErrorTestGenerationPageState();
}

class _ErrorTestGenerationPageState extends State<ErrorTestGenerationPage> {
  @override
  void dispose() {
    // ignore: avoid_print
    print('Dispose used');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var ad = AdsHandler();
    var prefs = PreferencesUser();
    ad.loadInter();
    return BlocProvider(
      create: (context) => TestByTitleBlocBloc(TestService()),
      child: Material(
        child: Container(
            color: primaryColor,
            child: CustomScrollView(slivers: [
              customAppBar("Examen de Errores", "assets/images/book2.jpg"),
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 10),
                  Text(
                    "",
                    style: GoogleFonts.creteRound(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontSize: 26),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(paddingDialog),
                        child: Text(
                          "Aprende de los errores, la mejor forma de consolidar la información es repitiendo las preguntas que más dificultad hayan supuesto para ti!",
                          style: GoogleFonts.creteRound(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
                  BlocBuilder<TestByTitleBlocBloc, TestByTitleBlocState>(
                    builder: (context, state) {
                      if (state is TestByTitleBlocInitial) {
                        return Container(
                          padding: EdgeInsets.all(20.0),
                          child: MainButton(
                            onPressed: () {
                              if (ad != null &&
                                  ad.isInterstitialAdReady &&
                                  prefs.ad == 0) {
                                ad.interstitialAd.show();
                                prefs.ad = 1;
                              } else {
                                prefs.ad = 0;
                              }
                              context.read<TestByTitleBlocBloc>().add(
                                  DataErrorTestLoad(widget.databaseHelper));
                              //setLocale(context);

                              // Navigator.pushNamed(context, '/menu');
                            },
                            text: 'Generar Test',
                          ),
                        );
                      } else if (state is TestLoading) {
                        return CircularProgressIndicator();
                      } else if (state is TestsLoaded) {
                        if (state.list.length < 3) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'No hay suficientes errores para generar un test... Sigue practicando!',
                                  style: GoogleFonts.creteRound(
                                      color: Colors.white,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                ),
                                MainButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    text: 'Volver'),
                              ],
                            ),
                          );
                        } else {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            var qp = QuestionsPreview(
                                questions: state.list,
                                typeEnum: TypeEnum.error);

                            Navigator.pushReplacementNamed(
                                context, '/quizpreview',
                                arguments: qp);
                          });
                        }

                        return GestureDetector(
                            onTap: () {},
                            /*Navigator.pushNamed(
                                context, '/exapreview2',
                                arguments: state.list),*/
                            child: Container(
                                /* height: 100,
                              width: 100,
                              color: primearyAccColor,*/
                                ));
                      } else {
                        return Container();
                        /*   return Container(
                          padding: EdgeInsets.all(20.0),
                          child: MainButton(
                            onPressed: () {
                              //setLocale(context);

                              Navigator.pushNamed(context, '/menu');
                            },
                            text: 'Generar Test',
                          ),
                        );*/
                      }
                    },
                  )
                ]),
              ),
              // )
            ])),
      ),
    );
  }
}
