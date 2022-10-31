import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ad/ads_helper.dart';
import '../../helpers/const.dart';
import '../../helpers/prefs.dart';
import '../../model/ley.dart';

List<Ley> estatutos = [
  Ley(
      title: "Aragón",
      shortTitle: "Estatuto de Autonomía de Aragón",
      file: "assets/files/estatutos/aragon.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Andalucía",
      shortTitle: "Estatuto de Autonomía de Andalucía",
      file: "assets/files/estatutos/andalucia.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Asturias",
      shortTitle: "Estatuto de Autonomía de Asturias",
      file: "assets/files/estatutos/asturias.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Baleares",
      shortTitle: "Estatuto de Autonomía Islas Baleares",
      file: "assets/files/estatutos/baleares.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Cantabria",
      shortTitle: "Estatuto de Autonomía de Cantabria",
      file: "assets/files/estatutos/cantabria.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Canarias",
      shortTitle: "Estatuto de Autonomía de las Islas Canarias",
      file: "assets/files/estatutos/canarias.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Castilla y León",
      shortTitle: "Estatuto de Autonomía de Castilla y León",
      file: "assets/files/estatutos/castilla-y-leon.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Castilla la Mancha",
      shortTitle: "Estatuto de Autonomía de Castilla la Mancha",
      file: "assets/files/estatutos/castilla-la-mancha.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Comunidad de Madrid",
      shortTitle: "Estatuto de Autonomía de Comunidad de Madrid",
      file: "assets/files/estatutos/madrid.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Comunidad Valenciana",
      shortTitle: "Estatuto de Autonomía de la Comunidad Valenciana",
      file: "assets/files/estatutos/valencia.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Extremadura",
      shortTitle: "Estatuto de Autonomía de Extremadura",
      file: "assets/files/estatutos/extremadura.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Galicia",
      shortTitle: "Estatuto de Autonomía de Galicia",
      file: "assets/files/estatutos/galicia.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "La Rioja",
      shortTitle: "Estatuto de Autonomía de La Rioja",
      file: "assets/files/estatutos/rioja.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Murcia",
      shortTitle: "Estatuto de Autonomía de Murcia",
      file: "assets/files/estatutos/murcia.json",
      img: "assets/images/book2.jpg"),
];

class EstatutosMenuPage extends StatelessWidget {
  const EstatutosMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ad = AdsHandler();
    var prefs = PreferencesUser();
    ad.loadInter();

    return Material(
      child: Container(
        padding: EdgeInsets.all(generalPadding),
        color: primaryColor,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                  10,
                  MediaQuery.of(context).size.height / 40,
                  10,
                  MediaQuery.of(context).size.height / 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    "Estatutos",
                    style: GoogleFonts.creteRound(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            /* SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),*/
            Flexible(
              child: GridView.count(
                physics: ScrollPhysics(),
                childAspectRatio: 1.0,
                padding: EdgeInsets.only(left: 16, right: 16),
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
                children: estatutos.map((data) {
                  return GestureDetector(
                    onTap: () {
                      if (ad != null &&
                          ad.isInterstitialAdReady &&
                          prefs.ad == 0) {
                        ad.interstitialAd.show();
                        prefs.ad = 1;
                      } else {
                        prefs.ad = 0;
                      }
                      Navigator.pushNamed(context, '/generalGen',
                          arguments: Ley(
                              title: data.title,
                              shortTitle: data.shortTitle,
                              file: data.file,
                              img: data.img));
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data.title,
                              style: GoogleFonts.creteRound(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
