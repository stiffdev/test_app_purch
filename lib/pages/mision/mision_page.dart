import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common_widget/buttons.dart';
import '../../helpers/const.dart';

class MisionPage extends StatelessWidget {
  const MisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(generalPadding),
          color: primaryColor,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Row(
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
                    "Nuestra Misión",
                    style: GoogleFonts.creteRound(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Image(
                image: AssetImage("assets/images/opodemy.png"),
                width: MediaQuery.of(context).size.width / 3,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "OPODEMY",
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  /*  Image(
                    image: AssetImage("assets/images/mision.png"),
                    width: MediaQuery.of(context).size.width / 5,
                  ),*/
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              RichText(
                text: TextSpan(
                  text:
                      'En Opodemy tenemos clara nuestra misión. Bueno, son dos misiones diferentes pero que su fin es el mismo: ',
                  style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Que desinstales nuestra aplicación.',
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Text(
                "¿Cómo?",
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Text(
                '''Sabemos que suena contra contraintuitivo pero déjanos explicarnos.\nLa primera misión es que apruebes tu oposición. Y si puede ser a la primera, mejor. Así puedes recomendarnos si te gusta nuestra app. Por eso trabajamos para tener todos nuestros tests y recursos actualizados.''',
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 16),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Text(
                '''Nuestra segunda misión es ganar dinero. Tu dinero. No te vamos a decir que esto es para que consigas tus sueños o para hacerte un favor como hacen en otras apps. Esta relación es beneficiosa para ambos.''',
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 16),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Text(
                "¿Resultado?",
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontSize: 17),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              RichText(
                text: TextSpan(
                  text:
                      'Que desinstales nuestra aplicación. La suma de las dos misiones tiene un mismo objetivo. ',
                  style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'Tu meta es aprobar y la nuestra permanecer en tu teléfono lo menos posible. ',
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 16),
                    ),
                    TextSpan(
                      text:
                          'Nosotros haremos nuestra parte. Seguro que tú cumples con la tuya.',
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              MainButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/paywall');
                },
                text: 'Ver Premium',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              /*
        
        \n\n¿Cómo?\n
       
        Nuestra segunda misión es ganar dinero. Tu dinero. No te voy a decir que esto es para que consigas tus sueños o para hacerte un favor como hacen en otras apps. Esta relación es beneficiosa para ambos.\n\n ¿Resultado?\n
       
                
              */
            ],
          )),
    ));
  }
}
