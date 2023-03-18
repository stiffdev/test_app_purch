import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../helpers/prefs.dart';

class AdsHandler extends ChangeNotifier {
  late InterstitialAd interstitialAd;
  bool isInterstitialAdReady = false;
  var prefs = PreferencesUser();
  //bool isBannerAdReady = false;

  /* static String get interstitialAdUnitId {
    return 'ca-app-pub-7036608025474000/1660109257'; //test
    //return 'ca-app-pub-7036608025474000/1660109257'; //test

    //ca-app-pub-
  }*/

  static String get interstitialAdUnitId {
    return Platform.isAndroid
        ? 'ca-app-pub-7036608025474000/1660109257'
        : 'ca-app-pub-7036608025474000/7031452799';
  }

  void loadInter() {
    print('cargo el interstitial 1 ');

    if (prefs.pol2 == 0 && prefs.premium == 0) {
      InterstitialAd.load(
        adUnitId: interstitialAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            interstitialAd = ad;

            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                //navigate to next page or do something

                print('dismissss ');
                //onDismiss;
                isInterstitialAdReady = false;
                loadInter();
                //_loadInterstitialAd();
                //Navigator.pushNamed(context, '/second');
              },
            );

            isInterstitialAdReady = true;
            print('interstitial 1 loaded');
          },
          onAdFailedToLoad: (err) {
            print('Failed to load an interstitial ad: ${err.message}');
            isInterstitialAdReady = false;
          },
        ),
      );
    }
  }

  void loadGeneralInterstitialAd() {
    var adnum = prefs.ad;
    if (prefs.premium == 0) {
      if (adnum >= 4) {
        print('cargo el interstitial ');
        InterstitialAd.load(
          adUnitId: interstitialAdUnitId,
          request: AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (ad) {
              interstitialAd = ad;

              ad.fullScreenContentCallback = FullScreenContentCallback(
                onAdDismissedFullScreenContent: (ad) {
                  //navigate to next page or do something

                  print('dismissss');

                  prefs.ad = 0;
                  isInterstitialAdReady = false;
                  //_loadInterstitialAd();
                  //Navigator.pushNamed(context, '/second');
                },
              );

              isInterstitialAdReady = true;
              print('interstitial 1 loaded');
            },
            onAdFailedToLoad: (err) {
              print('Failed to load an interstitial ad: ${err.message}');
              isInterstitialAdReady = false;
            },
          ),
        );
      } else {
        prefs.ad = adnum + 1;
      }
    }
  }
/*
  BannerAd setBannerAd() {
    return BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isBannerAdReady = true;
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');

          ad.dispose();
        },
      ),
    );
  }

  Future<AdWidget> getBanner() async {
    var banner = setBannerAd();
    banner.load();
    return AdWidget(ad: banner);
  } */
}
