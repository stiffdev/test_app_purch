import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/const.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.width = double.infinity,
  }) : super(key: key);

  final VoidCallback onPressed;
  final bool isLoading;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        elevation: 7.0,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF7B4EFF),
              Color(0xFF41C2FF),
            ],
          )),
          height: MediaQuery.of(context).size.height / 14,
          // height: MediaQuery.of(context).size.height / 14,
          width: double.infinity,
          child: Container(
            //constraints: BoxConstraints(
            //  maxHeight: 100.0,
            //minHeight: 10,
            //maxWidth: 200.0,
            //minHeight: MediaQuery.of(context).size.height / 14,
            //minWidth: 100.0,
            //  ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(width: 50),
                Expanded(
                  child: Center(
                    child: Text(
                      text,
                      style: GoogleFonts.heptaSlab(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 21),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50.0,
                  child: Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                    size: 25.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainBigButton extends StatelessWidget {
  const MainBigButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.width = double.infinity,
  }) : super(key: key);

  final VoidCallback onPressed;
  final bool isLoading;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        elevation: 7.0,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF7B4EFF),
                  Color(0xFF41C2FF),
                ],
              )),
          //height: MediaQuery.of(context).size.height / 14,
          height: MediaQuery.of(context).size.height / 10,
          width: double.infinity,
          child: Container(
            //constraints: BoxConstraints(
            //  maxHeight: 100.0,
            //minHeight: 10,
            //maxWidth: 200.0,
            //minHeight: MediaQuery.of(context).size.height / 14,
            //minWidth: 100.0,
            //  ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: Center(
                    child: Text(
                      text,
                      style: GoogleFonts.heptaSlab(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 21),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50.0,
                  child: Image(
                    image: AssetImage('assets/images/rank.png'),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainBigButton2 extends StatelessWidget {
  const MainBigButton2({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.width = double.infinity,
  }) : super(key: key);

  final VoidCallback onPressed;
  final bool isLoading;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        elevation: 7.0,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF7B4EFF),
                  Color(0xFF41C2FF),
                ],
              )),
          //height: MediaQuery.of(context).size.height / 14,
          height: MediaQuery.of(context).size.height / 10,
          width: double.infinity,
          child: Container(
            //constraints: BoxConstraints(
            //  maxHeight: 100.0,
            //minHeight: 10,
            //maxWidth: 200.0,
            //minHeight: MediaQuery.of(context).size.height / 14,
            //minWidth: 100.0,
            //  ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: Center(
                    child: Text(
                      text,
                      style: GoogleFonts.heptaSlab(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 21),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50.0,
                  child: Image(
                    image: AssetImage('assets/images/opodemy.png'),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
