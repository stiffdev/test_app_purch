import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/const.dart';
import '../buttons.dart';

class CustomOpDialogBox extends StatefulWidget {
  final String title, descriptions, text;

  const CustomOpDialogBox(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.text})
      : super(key: key);

  @override
  _CustomOpDialogBoxState createState() => _CustomOpDialogBoxState();
}

class _CustomOpDialogBoxState extends State<CustomOpDialogBox> {
  //final prefs = new PreferenciasUsuario();
  TextEditingController nameController = TextEditingController();
  String fullop = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(paddingDialog),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(
        context,
      ),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
              left: paddingDialog,
              top: avatarRadius + paddingDialog,
              right: paddingDialog,
              bottom: paddingDialog),
          margin: const EdgeInsets.only(top: avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(paddingDialog),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: GoogleFonts.creteRound(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontSize: 24),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: GoogleFonts.creteRound(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(),
                      labelText: 'Tu opinión',
                    ),
                    onChanged: (text) {
                      setState(() {
                        fullop = text;
                      });
                    },
                  )),
              const SizedBox(
                height: 25,
              ),
              MainButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: 'Enviar'),
              /* TextButton(
                child: Text('Send',
                    style: GoogleFonts.creteRound(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontSize: 24)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),*/
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
        Positioned(
          left: paddingDialog,
          right: paddingDialog,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: avatarRadius,
            child: ClipRRect(
                borderRadius:
                    const BorderRadius.all(Radius.circular(avatarRadius)),
                child: Image.asset("assets/images/logo-leyes.png")),
          ),
        ),
      ],
    );
  }
}
