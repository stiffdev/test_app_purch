import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ad/ads_helper.dart';
import '../../helpers/const.dart';
import '../../helpers/prefs.dart';
import '../../model/ley.dart';

List<Ley> leyes = [
  Ley(
      title: "Ley 50/1997",
      shortTitle: "Ley 50/1997, de 27 de noviembre, del Gobierno",
      file: "assets/files/leyes/50-1997.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley 39/2015",
      shortTitle:
          "Ley 39/2015, de 1 de octubre, del Procedimiento Administrativo Común de las Administraciones Públicas.",
      file: "assets/files/leyes/39-2015.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley 40/2015",
      shortTitle:
          "Ley 40/2015, de 1 de octubre, de Régimen Jurídico del Sector Público",
      file: "assets/files/leyes/40-2015.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "TREBEP",
      shortTitle:
          "TREBEP Real Decreto Legislativo 5/2015: Ley del Estatuto Básico del Empleado Público.",
      file: "assets/files/leyes/trebep.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley 9/2017",
      shortTitle:
          "Ley 9/2017, de 8 de noviembre, de Contratos del Sector Público",
      file: "assets/files/leyes/9-2017.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley 31/1995",
      shortTitle:
          "Ley 31/1995, de 8 de noviembre, de prevención de Riesgos Laborales.",
      file: "assets/files/leyes/31-1995.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley 55/2003",
      shortTitle:
          "Ley 55/2003, de 16 de diciembre, del Estatuto Marco del personal estatutario de los servicios de salud",
      file: "assets/files/leyes/55-2003.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley Orgánica 3/2007",
      shortTitle:
          "Ley Orgánica 3/2007, de 22 de marzo, para la igualdad efectiva de mujeres y hombres",
      file: "assets/files/leyes/3-2007.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley Orgánica 1/2004",
      shortTitle:
          "Ley Orgánica 1/2004, de 28 de diciembre, de Medidas de Protección Integral contra la Violencia de Género.",
      file: "assets/files/leyes/1-2004.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley Orgánica 3/2018: Protección de Datos ",
      shortTitle:
          "Ley Orgánica 3/2018, de Protección de Datos Personales y garantía de los derechos digitales",
      file: "assets/files/leyes/3-2018.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Decreto Legislativo 2/2015: Estatuto Trabajadores",
      shortTitle:
          "Real Decreto Legislativo 2/2015, por el que se aprueba el texto refundido de la Ley del Estatuto de los Trabajadores",
      file: "assets/files/leyes/2-2015.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley 58/2003: Ley General Tributaria",
      shortTitle: "Ley 58/2003, de 17 de diciembre, General Tributaria.",
      file: "assets/files/leyes/58-2003-general-tributaria.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley 6/2001: de Universidades",
      shortTitle: "Ley Orgánica 6/2001, de 21 de diciembre, de Universidades.",
      file: "assets/files/leyes/6-2001.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Decreto 2/2004: Ley Haciendas Locales",
      shortTitle:
          "Real Decreto Legislativo 2/2004, Ley Reguladora de las Haciendas Locales.",
      file: "assets/files/leyes/2-2004.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley 7/1985: Bases Régimen Local",
      shortTitle:
          "Ley 7/1985, de 2 de abril, Reguladora de las Bases del Régimen Local.",
      file: "assets/files/leyes/7-1985.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley 14/1986: General de Sanidad.",
      shortTitle: "Ley 14/1986, de 25 de abril, Ley General de Sanidad",
      file: "assets/files/leyes/ley-sanidad.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley Orgánica 2/1986: Fuerzas de Seguridad.",
      shortTitle:
          "Ley Orgánica 2/1986, de 13 de marzo, de Fuerzas y Cuerpos de Seguridad.",
      file: "assets/files/leyes/fcs.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Unión Europea",
      shortTitle: "Unión Europea",
      file: "assets/files/leyes/ue.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley 4/2015: Seguridad ciudadana.",
      shortTitle:
          "Ley Orgánica 4/2015, de 30 de marzo, de protección de la seguridad ciudadana.",
      file: "assets/files/leyes/seguridad-ciudadena.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title:
          "Decreto 2568/1986: Reglamento de Organización de las Entidades Locales.",
      shortTitle:
          "Real Decreto 2568/1986, de 28 de noviembre: Reglamento de Organización, Funcionamiento y Régimen Jurídico de las Entidades Locales.",
      file: "assets/files/leyes/real-decreto-2568-1986.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Decreto 1428/2003: Reglamento General de Circulación",
      shortTitle:
          "Real Decreto 1428/2003, de 21 de noviembre, del Reglamento General de Circulación",
      file: "assets/files/leyes/reglamento-circulacion.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley 17/2015: Sistema de Protección Civil",
      shortTitle:
          "Ley 17/2015, de 9 de julio, del Sistema Nacional de Protección Civil",
      file: "assets/files/leyes/sistema-proteccion-civil.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley 4/2015: Materia de drogas y bebidas alcohólicas.",
      shortTitle:
          "Ley 4/2015, de 6 de marzo, de atención integral en materia de drogas y bebidas alcohólicas.",
      file: "assets/files/leyes/drogas.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley Orgánica 3/1981: Defensor del Pueblo.",
      shortTitle:
          "Ley Orgánica 3/1981, de 6 de abril, del Defensor del Pueblo.",
      file: "assets/files/leyes/defensor-pueblo.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley Seguridad Vial",
      shortTitle: "Código Penal en materia de Seguridad Vial",
      file: "assets/files/leyes/delitos-seguridad-vial.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Delitos administración Pública",
      shortTitle:
          "Código Penal en materia de Delitos contra la Administración Pública",
      file: "assets/files/leyes/delitos-administracion.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley 19/2013, ley general de transparencia",
      shortTitle:
          "Ley 19/2013, de 9 de diciembre, de transparencia, acceso a la información pública y buen gobierno.",
      file: "assets/files/leyes/ley-transparencia.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley 29/1998, Contencioso-administrativa",
      shortTitle:
          "Ley 29/1998, de 13 de julio, reguladora de la Jurisdicción Contencioso-administrativa",
      file: "assets/files/leyes/jurisdiccion-contencioso-administrativo.json",
      img: "assets/images/book2.jpg"),
  Ley(
      title: "Ley Orgánica 4/1981: estados de alarma y sitio.",
      shortTitle:
          "Ley Orgánica 4/1981, de 1 de junio, de los estados de alarma, excepción y sitio.",
      file: "assets/files/leyes/ley-organica-4-81.json",
      img: "assets/images/book2.jpg"),
];

class LeySelectionMenuPage extends StatelessWidget {
  const LeySelectionMenuPage({Key? key}) : super(key: key);

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
                    "Leyes España",
                    style: GoogleFonts.openSans(
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
                children: leyes.map((data) {
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

                      Navigator.pushReplacementNamed(context, '/generalGen',
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
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
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
