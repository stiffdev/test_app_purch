import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/const.dart';

class CopyPage extends StatelessWidget {
  const CopyPage({super.key});

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
                    "¿Por qué pagar?",
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Image(
                image: AssetImage("assets/images/vip-card.png"),
                width: MediaQuery.of(context).size.width / 3,
              ),
              /*  SizedBox(
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
              ),*/
/*
Comprar billetes de avión hacer escalas comerte 3 aviones 72h y llegar al destino
Uno de los mayores placeres de la vida es el de viajar. Conocer otras culturas te hace crecer como nada.

Si alguna vez has ido a comprar unos billetes de avión, seguro que has visto varias opciones. Existen comparadores que te sacan el vuelo al mejor precio.
Lo que determina el precio de un billete son muchos factores que se agrupan en dos partes: parte fija y parte variable.
La parte fija es un precio que no cambia y tiene en cuenta los gastos de realización del vuelo: avión, distancia, tripulación, combustible… y servicios como la comida y bebida para los pasajeros.
La parte variable son los impuestos, tasas de aeropuertos y otros factores.
El año pasado viaje con mi pareja a Nueva York y fue increíble. El vuelo me costó 656 euros y visitamos todos los sitios típicos. En la cena de Navidad se lo conté a mi familia y mi primo se rio de mí. Me comentó que él fue por solo 400 euros y que a mí me habían timado.


Al principio me sorprendí porque en su momento me aseguré de comprar la mejor opción. Hasta que descubrí la verdad.
Yo fui a Nueva York en un vuelo directo que duró 8 horas y 15 minutos.
Mi primo fue a Nueva York en un vuelo con 2 escalas     con una duración de 14 horas y 29 minutos.
Pero el tonto fui yo. Según él, claro.
Lo mismo pasa cuando pagas por una aplicación. Hay quien te puede decir que no merece la pena, que puedes sacar tu plaza sin tener que pagar 5 euros cada mes.
Y hay quien te dice que tu tiempo tiene mas valor que eso. Y si nadie te lo dice, ya te lo digo yo.
Puedes llegar a tu destino haciendo dos escalas y pagando menos.
O puedes pagar y llegar antes que tu primo.
Tú decides a qué le das más valor.

              */
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Text(
                "Opositar consiste en realizar un viaje. \nY viajar es maravilloso. Depende de cómo viajes, claro.",
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              RichText(
                text: TextSpan(
                  text: ' ¿Sabes? ',
                  style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'Uno de los mayores placeres de la vida es el de viajar. ',
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    TextSpan(
                      text: 'Conocer otras culturas te hace crecer como nada.',
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Text(
                "Si alguna vez has ido a comprar unos billetes de avión, seguro que has visto varias opciones. Existen comparadores que te sacan el vuelo al mejor precio. Lo que determina el precio de un billete son muchos factores que se agrupan en dos partes: parte fija y parte variable. La parte fija es un precio que no cambia y tiene en cuenta los gastos de realización del vuelo: avión, distancia, tripulación, combustible… y servicios como la comida y bebida para los pasajeros.",
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Text(
                '''La parte variable son los impuestos, tasas de aeropuertos y otros factores. El año pasado viaje con mi pareja a Nueva York y fue increíble. El vuelo me costó 656 euros y visitamos todos los sitios típicos. En la cena de Navidad se lo conté a mi familia y mi primo se rio de mí. Me comentó que él fue por solo 400 euros y que a mí me habían timado.''',
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              RichText(
                text: TextSpan(
                  text:
                      'Al principio me sorprendí porque en su momento me aseguré de comprar la mejor opción. Hasta que descubrí la verdad. Yo fui a Nueva York en un vuelo directo que duró 8 horas y 15 minutos. Mi primo fue a Nueva York en un vuelo con 2 escalas con una duración de 14 horas y 29 minutos. ',
                  style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Pero el tonto fui yo. Según él, claro.',
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              /*  Text(
                '''Al principio me sorprendí porque en su momento me aseguré de comprar la mejor opción. Hasta que descubrí la verdad. Yo fui a Nueva York en un vuelo directo que duró 8 horas y 15 minutos. Mi primo fue a Nueva York en un vuelo con 2 escalas con una duración de 14 horas y 29 minutos. Pero el tonto fui yo. Según él, claro.''',
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 17),
                textAlign: TextAlign.center,
              ),*/
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Text(
                "¿Pero qué tiene que ver esto con una aplicación?",
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 17),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              RichText(
                text: TextSpan(
                  text: '',
                  style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'Pues es prácticamente lo mismo. Hay quien te puede decir que no merece la pena, que puedes aprobar tu plaza sin tener que pagar 5 euros cada mes. Y hay quien te dice que tu tiempo tiene mas valor que eso. Y si nadie te lo dice, ya te lo digo yo. Puedes llegar a tu destino haciendo dos escalas y pagando menos. O puedes pagar y llegar antes que tu primo. ',
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 16),
                    ),
                    TextSpan(
                      text: 'Tú decides a qué le das más valor.',
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
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
