import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../ad/ads_helper.dart';
import '../../../common_widget/buttons.dart';
import '../../../helpers/const.dart';
import '../../../helpers/prefs.dart';
import '../../../model/question.dart';
import '../../../service/test_service.dart';
import '../../quiz/quiz_preview_page.dart';
import '../test_titulos/bloc/test_by_title_bloc_bloc.dart';

class TestConstitucionVariadosPage extends StatelessWidget {
  TestConstitucionVariadosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ad = AdsHandler();

    ad.loadInter();
    var prefs = PreferencesUser();

    return BlocProvider(
      create: (context) => TestByTitleBlocBloc(TestService()),
      child: Material(
          color: primaryColor,
          child: Container(
              // padding: EdgeInsets.all(MediaQuery.of(context).size.width / 15),
              child: SafeArea(
            bottom: false,
            //top: false,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width / 8,
                  0,
                  MediaQuery.of(context).size.width / 8,
                  0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButton(
                        color: Colors.white,
                      ),
                      Spacer()
                    ],
                  ),
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                              height: 20,
                            ),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 14,
                        itemBuilder: (context, index) => BlocBuilder<
                                TestByTitleBlocBloc, TestByTitleBlocState>(
                              builder: (context, state) {
                                if (state is TestByTitleBlocInitial) {
                                  return Container(
                                    padding: EdgeInsets.all(20.0),
                                    child: GestureDetector(
                                      onTap: (() {
                                        if (ad != null &&
                                            ad.isInterstitialAdReady &&
                                            prefs.ad == 0) {
                                          ad.interstitialAd.show();
                                          prefs.ad = 1;
                                        } else {
                                          prefs.ad = 0;
                                        }
                                        print(index);
                                        context.read<TestByTitleBlocBloc>().add(
                                            DataTestLoad2(
                                                (index + 1).toString()));
                                      }),
                                      child: Container(
                                        padding: EdgeInsets.all(paddingDialog),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/fondo.jpeg'),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      25),
                                            )
                                            // color: Colors.red,
                                            /* boxShadow: [new BoxShadow(blurRadius: 40.0)],
                              borderRadius: BorderRadius.all(
                                Radius.circular(MediaQuery.of(context).size.height / 25),
                              ),*/
                                            ),
                                        child: Text(
                                          "Test Constitución Variado ${index + 1}",
                                          style: GoogleFonts.openSans(
                                              color: Colors.white,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (state is TestLoading) {
                                  return CircularProgressIndicator();
                                } else if (state is TestsLoaded) {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    var qp = QuestionsPreview(
                                        questions: state.list,
                                        typeEnum: TypeEnum.common);

                                    Navigator.pushReplacementNamed(
                                        context, '/quizpreview',
                                        arguments: qp);
                                    /*  Navigator.pushNamed(context, '/exapreview2',
                              arguments: state.list);*/
                                  });

                                  return GestureDetector(
                                      onTap: () {},
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

                        /*GestureDetector(
                              onTap: (() {
                                /*  if (ad != null &&
                                    ad.isInterstitialAdReady &&
                                    prefs.ad == 0) {
                                  ad.interstitialAd.show();
                                  prefs.ad = 1;
                                } else {
                                  prefs.ad = 0;
                                }*/
                                Navigator.pushNamed(context, '/testpreview',
                                    arguments: index + 1);
                              }),
                              child: Container(
                                padding: EdgeInsets.all(paddingDialog),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 6,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/fondo.jpeg'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          MediaQuery.of(context).size.height /
                                              25),
                                    )
                                    // color: Colors.red,
                                    /* boxShadow: [new BoxShadow(blurRadius: 40.0)],
                              borderRadius: BorderRadius.all(
                                Radius.circular(MediaQuery.of(context).size.height / 25),
                              ),*/
                                    ),
                                child: Text(
                                  "Test Constitución Variado ${index + 1}",
                                  style: GoogleFonts.openSans(
                                      color: Colors.white,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 28),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )*/

                        ),
                  ),
                ],
              ),
            ),
          ))),
    );
  }
}



/*

BlocBuilder<TestByTitleBlocBloc, TestByTitleBlocState>(
                    builder: (context, state) {
                      if (state is TestByTitleBlocInitial) {
                        return Container(
                          padding: EdgeInsets.all(20.0),
                          child: MainButton(
                            onPressed: () {
                              context
                                  .read<TestByTitleBlocBloc>()
                                  .add(DataTestLoad(num.toString()));
                              //setLocale(context);

                              // Navigator.pushNamed(context, '/menu');
                            },
                            text: 'Generar Test',
                          ),
                        );
                      } else if (state is TestLoading) {
                        return CircularProgressIndicator();
                      } else if (state is TestsLoaded) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.pushReplacementNamed(
                              context, '/quizpreview',
                              arguments: state.list);
                          /*  Navigator.pushNamed(context, '/exapreview2',
                              arguments: state.list);*/
                        });

                        return GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/exapreview2',
                                arguments: state.list),
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
 */