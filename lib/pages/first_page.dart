import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_de_leyes/service/test_service.dart';

import '../ad/open_ad.dart';
import '../helpers/const.dart';
import '../service/main_repository.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  AppOpenAdManager appOpenAdManager = AppOpenAdManager();

  @override
  void initState() {
    super.initState();

    //Load AppOpen Ad

    //Show AppOpen Ad After 8 Seconds

    //Here we will wait for 8 seconds to load our ad
    //After 8 second it will go to HomePage

    Future.delayed(Duration(milliseconds: 4000), () {
      print("holiiiii");
      appOpenAdManager.showAdIfAvailable();
      if (TestService().checkFirstDay() == true) {
        Navigator.pushReplacementNamed(context, '/onboarding');
      } else {
        Navigator.pushReplacementNamed(context, '/menu2');
      }
    });
    /* Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );*/
  }

  @override
  Widget build(BuildContext context) {
    appOpenAdManager.loadAd();
    MainRepository().checkPolicyEachPlatform();
    TestService().getDateForPremium();
    return Material(
      color: primaryColor,
      child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LEYESTEST",
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontSize: 30),
                textAlign: TextAlign.center,
              ),
              Image(
                image: AssetImage("assets/images/opodemy.png"),
                width: MediaQuery.of(context).size.width / 1.8,
              ),
              Text(
                "OPODEMY",
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
