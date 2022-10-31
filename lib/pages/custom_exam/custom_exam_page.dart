import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_de_leyes/model/question.dart';
import 'package:test_de_leyes/pages/quiz/quiz_preview_page.dart';
import 'package:test_de_leyes/service/test_service.dart';

import '../../ad/ads_helper.dart';
import '../../common_widget/dialog_reached_limit.dart';
import '../../helpers/prefs.dart';
import '../../model/ley.dart';

class CustomExamPage extends StatefulWidget {
  const CustomExamPage({Key? key}) : super(key: key);

  @override
  State<CustomExamPage> createState() => _CustomExamPageState();
}

class _CustomExamPageState extends State<CustomExamPage> {
  /*
*/
  List<SelectionModel> contacts = [
    SelectionModel(
        Ley(
            title: "Ley 50/1997",
            shortTitle: "Ley 50/1997, de 27 de noviembre, del Gobierno",
            file: "assets/files/leyes/50-1997.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley 39/2015",
            shortTitle:
                "Ley 39/2015, de 1 de octubre, del Procedimiento Administrativo Común de las Administraciones Públicas.",
            file: "assets/files/leyes/39-2015.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley 40/2015",
            shortTitle:
                "Ley 40/2015, de 1 de octubre, de Régimen Jurídico del Sector Público",
            file: "assets/files/leyes/40-2015.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "TREBEP",
            shortTitle:
                "TREBEP Real Decreto Legislativo 5/2015: Ley del Estatuto Básico del Empleado Público.",
            file: "assets/files/leyes/trebep.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley 9/2017",
            shortTitle:
                "Ley 9/2017, de 8 de noviembre, de Contratos del Sector Público",
            file: "assets/files/leyes/9-2017.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley 31/1995",
            shortTitle:
                "Ley 31/1995, de 8 de noviembre, de prevención de Riesgos Laborales.",
            file: "assets/files/leyes/31-1995.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley 55/2003",
            shortTitle:
                "Ley 55/2003, de 16 de diciembre, del Estatuto Marco del personal estatutario de los servicios de salud",
            file: "assets/files/leyes/55-2003.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley Orgánica 3/2007",
            shortTitle:
                "Ley Orgánica 3/2007, de 22 de marzo, para la igualdad efectiva de mujeres y hombres",
            file: "assets/files/leyes/3-2007.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley Orgánica 1/2004",
            shortTitle:
                "Ley Orgánica 1/2004, de 28 de diciembre, de Medidas de Protección Integral contra la Violencia de Género.",
            file: "assets/files/leyes/1-2004.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley Orgánica 3/2018: Protección de Datos ",
            shortTitle:
                "Ley Orgánica 3/2018, de Protección de Datos Personales y garantía de los derechos digitales",
            file: "assets/files/leyes/3-2018.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Decreto Legislativo 2/2015: Estatuto Trabajadores",
            shortTitle:
                "Real Decreto Legislativo 2/2015, por el que se aprueba el texto refundido de la Ley del Estatuto de los Trabajadores",
            file: "assets/files/leyes/2-2015.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley 58/2003: Ley General Tributaria",
            shortTitle: "Ley 58/2003, de 17 de diciembre, General Tributaria.",
            file: "assets/files/leyes/58-2003-general-tributaria.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley 6/2001: de Universidades",
            shortTitle:
                "Ley Orgánica 6/2001, de 21 de diciembre, de Universidades.",
            file: "assets/files/leyes/6-2001.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Decreto 2/2004: Ley Haciendas Locales",
            shortTitle:
                "Real Decreto Legislativo 2/2004, Ley Reguladora de las Haciendas Locales.",
            file: "assets/files/leyes/2-2004.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley 7/1985: Bases Régimen Local",
            shortTitle:
                "Ley 7/1985, de 2 de abril, Reguladora de las Bases del Régimen Local.",
            file: "assets/files/leyes/7-1985.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley 14/1986: General de Sanidad.",
            shortTitle: "Ley 14/1986, de 25 de abril, Ley General de Sanidad",
            file: "assets/files/leyes/ley-sanidad.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley Orgánica 2/1986: Fuerzas de Seguridad.",
            shortTitle:
                "Ley Orgánica 2/1986, de 13 de marzo, de Fuerzas y Cuerpos de Seguridad.",
            file: "assets/files/leyes/fcs.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Unión Europea",
            shortTitle: "Unión Europea",
            file: "assets/files/leyes/ue.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley 4/2015: Seguridad ciudadana.",
            shortTitle:
                "Ley Orgánica 4/2015, de 30 de marzo, de protección de la seguridad ciudadana.",
            file: "assets/files/leyes/seguridad-ciudadena.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title:
                "Decreto 2568/1986: Reglamento de Organización de las Entidades Locales.",
            shortTitle:
                "Real Decreto 2568/1986, de 28 de noviembre: Reglamento de Organización, Funcionamiento y Régimen Jurídico de las Entidades Locales.",
            file: "assets/files/leyes/real-decreto-2568-1986.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Decreto 1428/2003: Reglamento General de Circulación",
            shortTitle:
                "Real Decreto 1428/2003, de 21 de noviembre, del Reglamento General de Circulación",
            file: "assets/files/leyes/reglamento-circulacion.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley 17/2015: Sistema de Protección Civil",
            shortTitle:
                "Ley 17/2015, de 9 de julio, del Sistema Nacional de Protección Civil",
            file: "assets/files/leyes/sistema-proteccion-civil.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley 4/2015: Materia de drogas y bebidas alcohólicas.",
            shortTitle:
                "Ley 4/2015, de 6 de marzo, de atención integral en materia de drogas y bebidas alcohólicas.",
            file: "assets/files/leyes/drogas.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley Orgánica 3/1981: Defensor del Pueblo.",
            shortTitle:
                "Ley Orgánica 3/1981, de 6 de abril, del Defensor del Pueblo.",
            file: "assets/files/leyes/defensor-pueblo.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley Seguridad Vial",
            shortTitle: "Código Penal en materia de Seguridad Vial",
            file: "assets/files/leyes/delitos-seguridad-vial.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Delitos administración Pública",
            shortTitle:
                "Código Penal en materia de Delitos contra la Administración Pública",
            file: "assets/files/leyes/delitos-administracion.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley 19/2013, ley general de transparencia",
            shortTitle:
                "Ley 19/2013, de 9 de diciembre, de transparencia, acceso a la información pública y buen gobierno.",
            file: "assets/files/leyes/ley-transparencia.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Ley 29/1998, Contencioso-administrativa",
            shortTitle:
                "Ley 29/1998, de 13 de julio, reguladora de la Jurisdicción Contencioso-administrativa",
            file:
                "assets/files/leyes/jurisdiccion-contencioso-administrativo.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Constitución Título Preliminar",
            shortTitle: "Constitución Española Título Preliminar",
            file: "assets/files/constitucion/test-titulo-0.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Constitución Título 1",
            shortTitle: "Constitución Española Título 1",
            file: "assets/files/constitucion/test-titulo-1.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Constitución Título 2",
            shortTitle: "Constitución Española Título 2",
            file: "assets/files/constitucion/test-titulo-2.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Constitución Título 3",
            shortTitle: "Constitución Española Título 3",
            file: "assets/files/constitucion/test-titulo-3.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Constitución Título 4",
            shortTitle: "Constitución Española Título 4",
            file: "assets/files/constitucion/test-titulo-4.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Constitución Título 5",
            shortTitle: "Constitución Española Título 5",
            file: "assets/files/constitucion/test-titulo-5.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Constitución Título 6",
            shortTitle: "Constitución Española Título 6",
            file: "assets/files/constitucion/test-titulo-6.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Constitución Título 7",
            shortTitle: "Constitución Española Título 7",
            file: "assets/files/constitucion/test-titulo-7.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Constitución Título 8",
            shortTitle: "Constitución Española Título 8",
            file: "assets/files/constitucion/test-titulo-8.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Constitución Título 9",
            shortTitle: "Constitución Española Título 9",
            file: "assets/files/constitucion/test-titulo-9.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Constitución Título 10",
            shortTitle: "Constitución Española Título 10",
            file: "assets/files/constitucion/test-titulo-10.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Aragón",
            shortTitle: "Estatuto de Autonomía de Aragón",
            file: "assets/files/estatutos/aragon.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Andalucía",
            shortTitle: "Estatuto de Autonomía de Andalucía",
            file: "assets/files/estatutos/andalucia.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Asturias",
            shortTitle: "Estatuto de Autonomía de Asturias",
            file: "assets/files/estatutos/asturias.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Baleares",
            shortTitle: "Estatuto de Autonomía Islas Baleares",
            file: "assets/files/estatutos/baleares.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Cantabria",
            shortTitle: "Estatuto de Autonomía de Cantabria",
            file: "assets/files/estatutos/cantabria.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Canarias",
            shortTitle: "Estatuto de Autonomía de las Islas Canarias",
            file: "assets/files/estatutos/canarias.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Castilla y León",
            shortTitle: "Estatuto de Autonomía de Castilla y León",
            file: "assets/files/estatutos/castilla-y-leon.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Castilla la Mancha",
            shortTitle: "Estatuto de Autonomía de Castilla la Mancha",
            file: "assets/files/estatutos/castilla-la-mancha.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Comunidad de Madrid",
            shortTitle: "Estatuto de Autonomía de Comunidad de Madrid",
            file: "assets/files/estatutos/madrid.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Comunidad Valenciana",
            shortTitle: "Estatuto de Autonomía de la Comunidad Valenciana",
            file: "assets/files/estatutos/valencia.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Extremadura",
            shortTitle: "Estatuto de Autonomía de Extremadura",
            file: "assets/files/estatutos/extremadura.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Galicia",
            shortTitle: "Estatuto de Autonomía de Galicia",
            file: "assets/files/estatutos/galicia.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "La Rioja",
            shortTitle: "Estatuto de Autonomía de La Rioja",
            file: "assets/files/estatutos/rioja.json",
            img: "assets/images/book2.jpg"),
        false),
    SelectionModel(
        Ley(
            title: "Murcia",
            shortTitle: "Estatuto de Autonomía de Murcia",
            file: "assets/files/estatutos/murcia.json",
            img: "assets/images/book2.jpg"),
        false),
  ];

  List<SelectionModel> selectedContacts = [];

  var loading = false;

  @override
  Widget build(BuildContext context) {
    var ad = AdsHandler();
    var prefs = PreferencesUser();
    ad.loadInter();
    final service = TestService();
    return Material(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                padding: EdgeInsets.fromLTRB(
                    5,
                    MediaQuery.of(context).size.height / 40,
                    5,
                    MediaQuery.of(context).size.height / 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      "Genera tu examen",
                      style: GoogleFonts.creteRound(
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    Image(
                      image: AssetImage('assets/images/logo-leyes.png'),
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (BuildContext context, int index) {
                      // return item
                      return ContactItem(
                        contacts[index].ley,
                        contacts[index].isSelected,
                        index,
                      );
                    }),
              ),
              selectedContacts.length > 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          color: Color(0xFF7B4EFF),
                          child: /*Text(
                            "Añadir (${selectedContacts.length})",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),*/
                              loading == true
                                  ? CircularProgressIndicator(
                                      color: Colors.white)
                                  : Text(
                                      "Añadir (${selectedContacts.length})",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                          onPressed: () async {
                            if (prefs.premium == 0) {
                              showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const DialogReachedLimit(
                                        title: /*AppLocalizations.of(context)?.howrat ??*/
                                            "Premium",
                                        descriptions: /*AppLocalizations.of(context)?.opinin ??*/
                                            "Hazte PRO para disfrutar de esta funcionalidad!",
                                        text: "");
                                  });
                            } else {
                              setState(() {
                                loading = true;
                              });
                              var test = await service
                                  .getCustomTestQuestions(selectedContacts);

                              var qp = QuestionsPreview(
                                  questions: test, typeEnum: TypeEnum.common);

                              setState(() {
                                loading = false;
                              });

                              Navigator.pushReplacementNamed(
                                  context, '/quizpreview',
                                  arguments: qp);
                            }
                            /*  if (ad != null &&
                                ad.isInterstitialAdReady &&
                                prefs.ad == 0) {
                              ad.interstitialAd.show();
                              prefs.ad = 1;
                            } else {
                              prefs.ad = 0;
                            }*/
                          },
                        ),
                      ),
                    )
                  : Container(),

              // loading==true ? CircularProgressIndicator() : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget ContactItem(Ley ley, bool isSelected, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green[700],
        child: Icon(
          Icons.note_add,
          color: Colors.white,
        ),
      ),
      title: Text(
        ley.title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(ley.shortTitle),
      trailing: isSelected
          ? Icon(
              Icons.check_circle,
              color: Colors.green[700],
            )
          : Icon(
              Icons.check_circle_outline,
              color: Colors.grey,
            ),
      onTap: () {
        var selected = 0;
        for (var i = 0; i < contacts.length; i++) {
          if (contacts[i].isSelected) {
            selected += 1;
          }
        }
        if (selected < 5) {
          setState(() {
            contacts[index].isSelected = !contacts[index].isSelected;
            if (contacts[index].isSelected == true) {
              selectedContacts.add(SelectionModel(ley, true));
            } else if (contacts[index].isSelected == false) {
              selectedContacts.removeWhere(
                  (element) => element.ley.title == contacts[index].ley.title);
            }
          });
        }
      },
    );
  }
}

class SelectionModel {
  Ley ley;
  bool isSelected;

  SelectionModel(this.ley, this.isSelected);
}
