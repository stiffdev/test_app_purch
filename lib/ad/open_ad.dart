import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../helpers/prefs.dart';

class AppOpenAdManager {
  AppOpenAd? _appOpenAd;
  bool _isShowingAd = false;
  static bool isLoaded = false;

  var prefs = PreferencesUser();

  /// Load an AppOpenAd.//test id ca-app-pub-7036608025474000/9478039468
  void loadAd() {
    if (prefs.premium == 0) {
      print("comorl cargo open ad");
      AppOpenAd.load(
        adUnitId: Platform.isAndroid
            ? "ca-app-pub-7036608025474000/9478039468"
            : "ca-app-pub-7036608025474000/5430327014",
        orientation: AppOpenAd.orientationPortrait,
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            _appOpenAd = ad;
            isLoaded = true;
          },
          onAdFailedToLoad: (error) {
            // Handle the error.
            print("error loading open $error");
          },
        ),
      );
    } else {
      print("comorl es premium");
    }
  }

  // Whether an ad is available to be shown.
  bool get isAdAvailable {
    return _appOpenAd != null;
  }

  void showAdIfAvailable() {
    print(
        "Called=====================================================================");
    if (_appOpenAd == null) {
      print('Tried to show ad before available.');
      loadAd();
      return;
    }
    if (_isShowingAd) {
      print('Tried to show ad while already showing an ad.');
      return;
    }
    // Set the fullScreenContentCallback and show the ad.
    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
        print('$ad onAdShowedFullScreenContent');
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        print('$ad onAdDismissedFullScreenContent');
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
        loadAd();
      },
    );
    _appOpenAd!.show();
  }
}
