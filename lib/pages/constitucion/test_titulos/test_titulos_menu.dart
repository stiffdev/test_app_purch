import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_de_leyes/helpers/const.dart';

import '../../../ad/ads_helper.dart';
import '../../../helpers/prefs.dart';

List<String> titulos = [
  "Test Título Preliminar",
  "Test Título I",
  "Test Título II",
  "Test Título III",
  "Test Título IV",
  "Test Título V",
  "Test Título VI",
  "Test Título VII",
  "Test Título VIII",
  "Test Título IX",
  "Test Título X"
];

class TestTitulosPage extends StatelessWidget {
  const TestTitulosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ad = AdsHandler();
    var prefs = PreferencesUser();

    ad.loadInter();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            "Por Títulos",
            style: GoogleFonts.creteRound(
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontSize: 30,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        body: Container(
          color: primaryColor,
          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 8, 0,
              MediaQuery.of(context).size.width / 8, 0),
          child: SafeArea(
            bottom: false,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              //alignment: Alignment.center,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width / 25,
                  right: MediaQuery.of(context).size.width / 15,
                  left: MediaQuery.of(context).size.width / 15),
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: titulos.length,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: (() {
                          if (ad != null &&
                              ad.isInterstitialAdReady &&
                              prefs.ad == 0) {
                            ad.interstitialAd.show();
                            prefs.ad = 1;
                          } else {
                            prefs.ad = 0;
                          }
                          Navigator.pushNamed(context, '/generate',
                              arguments: index);
                        }),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 6,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/asfa.jpg"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                    MediaQuery.of(context).size.height / 25),
                              )
                              // color: Colors.red,
                              /* boxShadow: [new BoxShadow(blurRadius: 40.0)],
                            borderRadius: BorderRadius.all(
                              Radius.circular(MediaQuery.of(context).size.height / 25),
                            ),*/
                              ),
                          child: Text(
                            titulos[index],
                            style: GoogleFonts.creteRound(
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontSize: 28),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )),
            ),
          ),
        ));
  }
}
