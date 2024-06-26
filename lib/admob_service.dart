import 'package:alcool_gasolina/RouteGenerator.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class AdMobService {
  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>[
      "gasolina",
      "etanol",
      "combustivel",
    ],
    childDirected: false,
    testDevices: <String>[],
  );
  BannerAd bannerAd;
  InterstitialAd interstitialAd;

  BannerAd createBannerAd() {
    return BannerAd(
      // adUnitId: BannerAd.testAdUnitId,
      adUnitId: 'ca-app-pub-1556568734938950/5553365030',
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        //print("BannerAd event is $event");
      },
    );
  }

  InterstitialAd createInterstitialAd(BuildContext context) {
    return InterstitialAd(
      // adUnitId: InterstitialAd.testAdUnitId,
      adUnitId: 'ca-app-pub-1556568734938950/8993808798',
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.opened ||
            event == MobileAdEvent.failedToLoad) {
          Navigator.pushReplacementNamed(context, RouteGeneretor.ROTA_HOME);
        }
      },
    );
  }

  void mostrarBanner() {
    bannerAd = createBannerAd()
      ..load()
      ..show();
  }

  void mostrarInterstitial(BuildContext context) {
    interstitialAd = createInterstitialAd(context)
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
  }
}
