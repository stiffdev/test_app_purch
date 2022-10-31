import 'package:flutter/material.dart';
import 'package:test_de_leyes/helpers/const.dart';

import '../../common_widget/menu_card.dart';

class ConstitucionMenu extends StatelessWidget {
  const ConstitucionMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    0,
                    MediaQuery.of(context).size.height / 20,
                    0,
                    MediaQuery.of(context).size.height / 10),
                child: Image(
                  image: AssetImage("assets/images/constitucion.png"),
                  width: MediaQuery.of(context).size.width / 2.3,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/constvariados');
                },
                child: MenuCard(
                    image: 'fondo.jpeg',
                    texto: 'Test de Constitución Variados'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 18,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/constitulos');
                  },
                  child: MenuCard(
                      image: 'fondo.jpeg',
                      texto: 'Test de constitución por títulos')),
            ],
          ),
        ),
      ),
    );
  }
}
