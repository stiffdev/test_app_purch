import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUser {
  static final PreferencesUser _instancia = PreferencesUser._internal();

  factory PreferencesUser() {
    return _instancia;
  }

  PreferencesUser._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  int get rateSession {
    return _prefs.getInt('rateSession') ?? 0;
  }

  set rateSession(int value) {
    _prefs
        .setInt('rateSession', value)
        .then((value) => print('cambia rateSesstion to $value'));
  }

  int get ratedPrev {
    //save if user rat previously ->0 - not rat
    return _prefs.getInt('ratedPrev') ?? 0;
  }

  set ratedPrev(int value) {
    _prefs
        .setInt('ratedPrev', value)
        .then((value) => print('cambia ratedPrev to $value'));
  }

  int get pol1 {
    return _prefs.getInt('pol1') ?? 1;
  }

  set pol1(int value) {
    _prefs.setInt('pol1', value).then((value) => print('cambia p1 to $value'));
  }

  int get pol2 {
    return _prefs.getInt('pol2') ?? 1;
  }

  set pol2(int value) {
    _prefs.setInt('pol2', value).then((value) => print('cambia p2 to $value'));
  }

  int get visitMenu {
    return _prefs.getInt('visitMenu') ?? 0;
  }

  set visitMenu(int value) {
    _prefs
        .setInt('visitMenu', value)
        .then((value) => print('cambia visitMenu to $value'));
  }

  int get ad {
    return _prefs.getInt('ad') ?? 0;
  }

  set ad(int value) {
    _prefs.setInt('ad', value).then((value) => print('cambia menu a $value'));
  }

  int get firstDayOpen {
    return _prefs.getInt('firstDayOpen') ?? 0;
  }

  set firstDayOpen(int value) {
    _prefs
        .setInt('firstDayOpen', value)
        .then((value) => print('cambia firstDayOpen a $value'));
  }

  int get premium {
    return _prefs.getInt('premium') ?? 0;
  }

  set premium(int value) {
    _prefs
        .setInt('premium', value)
        .then((value) => print('cambia premium a $value'));
  }

  int get lastDay {
    return _prefs.getInt('lastDay') ?? 0;
  }

  set lastDay(int value) {
    _prefs
        .setInt('lastDay', value)
        .then((value) => print('cambia lastDay a $value'));
  }

  int get numTest {
    return _prefs.getInt('numTest') ?? 0;
  }

  set numTest(int value) {
    _prefs
        .setInt('numTest', value)
        .then((value) => print('cambia numTest a $value'));
  }

  int get numAciertos {
    return _prefs.getInt('numAciertos') ?? 0;
  }

  set numAciertos(int value) {
    _prefs
        .setInt('numAciertos', value)
        .then((value) => print('cambia numAciertos a $value'));
  }
}
