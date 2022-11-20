import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:test_de_leyes/common_widget/buttons.dart';
import 'package:test_de_leyes/common_widget/dialog_reached_limit.dart';
import 'package:test_de_leyes/helpers/const.dart';
import 'package:test_de_leyes/helpers/prefs.dart';
import 'package:test_de_leyes/purchases/purchases.dart';
import 'package:test_de_leyes/service/test_service.dart';

import '../../ad/ads_helper.dart';
import '../../common_widget/rate/rate_dialog.dart';
import 'cubit/main_cubit.dart';

class GridDashboard extends StatefulWidget {
  @override
  State<GridDashboard> createState() => _GridDashboardState();

  var showing = false;
}

class _GridDashboardState extends State<GridDashboard> {
  Items item1 = new Items(title: "Leyes", img: "assets/images/leyes.png");

  Items item2 = new Items(
    title: "Estatutos",
    img: "assets/images/estatutos.png",
  );

  Items item3 = new Items(
    title: "Constitución",
    img: "assets/images/otros.png",
  );

  Items item4 = new Items(
    title: "Progreso",
    img: "assets/images/stats.png",
  );

  Items item5 = new Items(
    title: "Repaso de Errores",
    img: "assets/images/vip-card.png",
  );

  Items item6 = new Items(
    title: "Test Personalizado",
    img: "assets/images/quiz.png",
  );

  Items item7 = new Items(
    title: "Retos del día",
    img: "assets/images/challenge.png",
  );

  Items item8 = new Items(
    title: "Nuestra misión",
    img: "assets/images/iconoleyes.png",
  );

  @override
  void dispose() {
    // TODO: implement dispose
    widget.showing = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*  var ad = AdsHandler();
    ad.loadInter();
*/

    var t = true;

    var bloc = BlocProvider.of<MainCubit>(context);
    var service = TestService();
    List<Items> myList = [
      item1,
      item2,
      item3,
      item4,
      item5,
      item6,
      item7,
      item8
    ];
    var color = 0xff453658;
    return BlocListener<MainCubit, MainState>(
      listener: (context, state) {
        print(widget.showing);
        if (state is MainDial && widget.showing == false) {
          dialog(context, bloc, 1).then((value) {
            print("holi");
            widget.showing = false;
          });

          bloc.initBloc();
          widget.showing = true;
        } else if (state is MainDialLimit && widget.showing == false) {
          dialog(context, bloc, 2).then((value) {
            print("holi");
            widget.showing = false;
          });
          bloc.initBloc();
          widget.showing = true;
        }
      },
      child: Material(
        child: Container(
          padding: const EdgeInsets.fromLTRB(
              generalPadding, generalPadding, generalPadding, 0),
          color: primaryColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,

            physics: ScrollPhysics(),
            // child: Expanded(
            /* child: Container(
              padding: const EdgeInsets.all(generalPadding),
              height: MediaQuery.of(context).size.height,
              color: primaryColor,*/
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /* Container(
                      padding: EdgeInsets.fromLTRB(
                          0,
                          MediaQuery.of(context).size.height / 40,
                          0,
                          MediaQuery.of(context).size.height / 30),
                      child: Image(
                        image: AssetImage("assets/images/logo-leyes.png"),
                        width: MediaQuery.of(context).size.width / 3,
                      ),
                    ),*/

                if (service.getIsPremium() == false) ...[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  MainBigButton(
                      onPressed: (() {
                        if (service.getIsPremium() == false) {
                          PurchaseApi.fetchOfferts();
                          Navigator.pushNamed(context, "/paywall");
                        }
                      }),
                      text: "Hazte Premium!")
                ] else ...[
                  Text(""),
                ],
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                Flexible(
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 1.0,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: myList.map((data) {
                      return GestureDetector(
                        onTap: () {
                          if (data.title == "Leyes") {
                            //  Navigator.pushNamed(context, '/leyes');

                            navigate(bloc, context, "/leyes");
                          } else if (data.title == "Progreso") {
                            navigate(bloc, context, "/stat");
                            //  Navigator.pushNamed(context, '/stat');
                          } else if (data.title == "Constitución") {
                            navigate(bloc, context, "/constitucion");
                            //   Navigator.pushNamed(context, "/constitucion");
                          } else if (data.title == "Estatutos") {
                            navigate(bloc, context, "/estatutos");
                            // Navigator.pushNamed(context, "/estatutos");
                          } else if (data.title == "Test Personalizado") {
                            navigate(bloc, context, "/custom");
                            // Navigator.pushNamed(context, "/custom");
                          } else if (data.title == "Repaso de Errores") {
                            navigate(bloc, context, "/errors");
                            // Navigator.pushNamed(context, "/errors");
                          } else if (data.title == "Nuestra misión") {
                            Navigator.pushNamed(context, '/mision');
                          } else if (data.title == "Retos del día") {
                            Navigator.pushNamed(context, '/challenge');
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF7B4EFF),
                                Color(0xFF41C2FF),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            //color: Color.fromRGBO(6, 57, 112, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(data.img,
                                  width:
                                      MediaQuery.of(context).size.width / 6.5),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(2, 1, 2, 1),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  data.title,
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                /*  SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),*/
                /*  MainBigButton2(
                    onPressed: (() {
                      // if (service.getIsPremium() == false) {

                      Navigator.pushNamed(context, "/mision");
                    }),
                    text: "Nuestra misión")*/
              ],
            ),
          ),
        ),
      ),
      //  ),
      //   ),
    );
  }

  void navigate(
      MainCubit bloc, BuildContext context, String route /*, AdsHandler ad*/) {
    var testLimit = TestService().getNumTest();

    if (bloc.checkRev()) {
      bloc.showDialogo();
      // showing = true;
    } else {
      if (testLimit) {
        if (route == "/stat") {
          Navigator.pushNamed(context, route);
        } else {
          //showDialogLimite //TODO
          if (widget.showing == false) {
            bloc.showDialogoLimit();
            //showing = true;
          }
        }
      } else {
        /*  if (ad != null && ad.isInterstitialAdReady) {
          ad.interstitialAd.show();
        }*/

        /* if (bloc.prefsTestsCheck()) {
          print("alfkdslvdfñ");
        } else {*/
        Navigator.pushNamed(context, route);
        // }
      }

      //  }

    }
  }
}

Future<dynamic> dialog(BuildContext context, MainCubit bloc, int opc) {
  if (opc == 1) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return const CustomDialogBox(
              title: /*AppLocalizations.of(context)?.howrat ??*/
                  "¿Te gusta nuestra app?",
              descriptions: /*AppLocalizations.of(context)?.opinin ??*/
                  "Nos interesa tu opinión",
              text: "");
        });
  } else {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return const DialogReachedLimit(
              title: /*AppLocalizations.of(context)?.howrat ??*/
                  "Límite de test alcanzado",
              descriptions: /*AppLocalizations.of(context)?.opinin ??*/
                  "Puedes esperar hasta mañana... o pasarte a premium para seguir practicando de forma ilimitada!",
              text: "");
        });
  }
}

class Items {
  String title;
  String img;
  Items({required this.title, required this.img});
}
