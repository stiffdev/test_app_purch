import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuCard extends StatelessWidget {
  String image;
  String texto;
  MenuCard({Key? key, required this.image, required this.texto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 8, 0,
            MediaQuery.of(context).size.width / 8, 0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 6,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/$image"),
              fit: BoxFit.cover,
            ),
            // color: Colors.red,
            boxShadow: [new BoxShadow(blurRadius: 40.0)],
            borderRadius: BorderRadius.all(
              Radius.circular(MediaQuery.of(context).size.height / 25),
            ),
          ),
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
              child: Text(
                texto,
                style: GoogleFonts.creteRound(
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontSize: 23),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      /* BackdropFilter(
                  filter: ui.ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(1)),
                  ),
                ),*/
      /*  Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
              child: Text(
                texto,
                style: GoogleFonts.creteRound(
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontSize: 23),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),*/
    ]);
  }
}
