import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import '../helpers/prefs.dart';

class MainRepository {
  final prefs = PreferencesUser();

  Future checkPolicyEachPlatform() async {
    try {
      final response = await http.Client()
          .get(Uri.parse(
              'https://leyestest.com/politica-de-privacidad-app-test-de-leyes/'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        //Getting the html document from the response
        try {
          if (response.body.toString().contains('Contacting 1')) {
            print('ENCONTRADOOOOOO TRUE');
            _incrementCounter('pol1', 1);
          } else {
            print('No encontrado :(');
            _incrementCounter('pol1', 0);
          }
          if (response.body.toString().contains('Contacting 1')) {
            print('ENCONTRADOOOOOO 2 TRUE');
            _incrementCounter('pol2', 1);
          } else {
            print('No encontrado 2 :(');

            _incrementCounter('pol2', 0);
          }

          // checkinfopol();
        } catch (e) {
          print('catch excp err');
          return ['', '', 'ERROR!'];
        }
      } else {
        // checkinfopol();
        print('errrrrror');
        return ['', '', 'ERROR: ${response.statusCode}.'];
      }
    } catch (e) {
      print('catch excp err');
      return ['', '', 'ERROR!'];
    }
  }

  _incrementCounter(String field, int value) {
    //SharedPreferences prefs = await SharedPreferences.getInstance();

    if (field == 'pol1') {
      prefs.pol1 = value;
    } else if (field == 'pol2') {
      prefs.pol2 = value;
    }
  }

  void premenu() {
    prefs.visitMenu = 0;
  }

  void prefsMenuCheck() async {
    print('checking dialog ....... ${prefs.visitMenu}');
    var visitMen = prefs.visitMenu;

    prefs.visitMenu = visitMen + 1;

    if (prefs.visitMenu > 1 /*&& _checkPol() && canRate()*/) {
      // showDialogo();
    }
  }

  bool checkRev() {
    print('checking dialog ....... ${prefs.visitMenu}');
    var visitMen = prefs.visitMenu;

    prefs.visitMenu = visitMen + 1;

    print('ratesession ${prefs.rateSession} y reated prev ${prefs.ratedPrev}');

    if (prefs.visitMenu > 1 && _checkPol() && canRate()) {
      return true;
    } else {
      return false;
    }
  }

  bool _checkPol() {
    print('macho ${prefs.pol1}');
    if (prefs.pol1 == 1) {
      return false;
    } else {
      return true;
    }
  }

  bool _checkPol2() {
    if (prefs.pol2 == 1) {
      return false;
    } else {
      return true;
    }
  }

  bool canRate() {
    if (prefs.rateSession == 0 && prefs.ratedPrev == 0) {
      return true;
    } else {
      return false;
    }
  }

  void setRate() {
    print('rated change');
    prefs.rateSession = 1;
    prefs.ratedPrev = 1;
  }

  void setReviu(int rating) {
    if (rating <= 3) {
    } else {
      if (Platform.isAndroid) {
        /*LaunchReview.launch(
            androidAppId: "com.map.genshin.db.tierlist.characters",
            iOSAppId: "1591413435");*/
      } else {
        /* print('');
        final InAppReview _inAppReview = InAppReview.instance;
        _inAppReview.requestReview();*/
      }
    }
    setRate();
  }
/*
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }*/

  String checkNumber() {
    // prefs.rateSession = 0;
    //prefs.ratedPrev = 0;

    final _currentDate = DateTime.now();
    DateTime dt = DateTime.parse('2021-11-11 03:04:05');

    if (_currentDate.isBefore(dt)) {
      prefs.pol1 = 1;
      prefs.pol2 = 1;
    } else {
      prefs.pol1 = 0;
      prefs.pol2 = 0;
    }

    prefs.ad = 0;
    prefs.visitMenu = 0;
    return _currentDate.toString();
  }
}
