import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../helpers/prefs.dart';
import '../../../service/main_repository.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final MainRepository repository;
  MainCubit(this.repository) : super(MainInitial());

  final prefs = PreferencesUser();

  void showDialogo() {
    emit(MainInitial());
    emit(MainDial());
  }

  void initBloc() {
    emit(MainInitial());
  }

  void showDialogoLimit() {
    emit(MainInitial());
    emit(MainDialLimit());
  }

  void dismissDialogo() {
    emit(MainInitial());
    emit(MainDismiss());
  }

  Future<void> checkinfopol() async {
    emit(MainInfoLoading());
    await repository.checkPolicyEachPlatform();
    print("infoloa");
    emit(MainInfoLoaded());
  }

  void premenu() {
    prefs.visitMenu = 0;
  }

  void prefsMenuCheck() async {
    print('checking dialog ....... ${prefs.visitMenu}');
    var visitMen = prefs.visitMenu;

    prefs.visitMenu = visitMen + 1;

    if (prefs.visitMenu > 1 /*&& _checkPol() && canRate()*/) {
      showDialogo();
    }
  }

  bool prefsTestsCheck() {
    print('checking dialog ....... ${prefs.visitMenu}');
    var numTest = prefs.numTest;
    print("llevaaaaa $numTest");
    print(numTest);

    if (numTest > 5 /*&& _checkPol() && canRate()*/) {
      return true;
    } else {
      return false;
    }
  }

  bool checkRev() {
    print('checking dialog ....... ${prefs.visitMenu}');
    var visitMen = prefs.visitMenu;

    prefs.visitMenu = visitMen + 1;

    print('ratesession ${prefs.rateSession} y reated prev ${prefs.ratedPrev}');

    if (prefs.visitMenu > 1 && checkPol() && canRate()) {
      // print("treee");
      return true;
    } else {
      //print("faaaals");
      return false;
    }
  }

  bool checkPol() {
    print('macho ${prefs.pol1}');
    if (prefs.pol1 == 1) {
      return false;
    } else {
      return true;
    }
  }

  bool checkPol2() {
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

  void avoidRate() {
    print('rated change');
    prefs.rateSession = 0;
    prefs.ratedPrev = 0;
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
}
