import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/const.dart';
import '../../helpers/prefs.dart';

class ChallengeDailyPage extends StatelessWidget {
  const ChallengeDailyPage({super.key});

  @override
  Widget build(BuildContext context) {
    var prefs = PreferencesUser();

    return Material(
      child: Container(
        padding: EdgeInsets.all(generalPadding),
        color: primaryColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
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
                      "Retos del día",
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Image(
                image: AssetImage("assets/images/challenge.png"),
                width: MediaQuery.of(context).size.width / 4,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Text(
                "Cuando sientas que vas a rendirte, recuerda por qué empezaste este viaje. Recuerda que el éxito es la suma de pequeños esfuerzos repetidos durante el trayecto",
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  prefs.numTest >= 1
                      ? Image(
                          image: AssetImage("assets/images/checked.png"),
                          width: MediaQuery.of(context).size.width / 8,
                        )
                      : Image(
                          image: AssetImage("assets/images/error.png"),
                          width: MediaQuery.of(context).size.width / 8,
                        ),
                  Text(
                    "Completa un test",
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  prefs.numAciertos >= 25
                      ? Image(
                          image: AssetImage("assets/images/checked.png"),
                          width: MediaQuery.of(context).size.width / 8,
                        )
                      : Image(
                          image: AssetImage("assets/images/error.png"),
                          width: MediaQuery.of(context).size.width / 8,
                        ),
                  Text(
                    "Acierta 25 preguntas",
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  prefs.numTest >= 5
                      ? Image(
                          image: AssetImage("assets/images/checked.png"),
                          width: MediaQuery.of(context).size.width / 8,
                        )
                      : Image(
                          image: AssetImage("assets/images/error.png"),
                          width: MediaQuery.of(context).size.width / 8,
                        ),
                  Text(
                    "Completa 5 test",
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
