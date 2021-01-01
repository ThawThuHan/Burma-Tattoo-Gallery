import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';

class AdManager {
  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7891514870902041~4613911125";
    } else if (Platform.isIOS) {
      return "ca-app-pub-7891514870902041~6714596324";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7891514870902041/3632001943";
    } else if (Platform.isIOS) {
      return "ca-app-pub-7891514870902041/5401514651";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7891514870902041/5264771526";
    } else if (Platform.isIOS) {
      return "ca-app-pub-7891514870902041/9192392336";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7891514870902041/7227594031";
    } else if (Platform.isIOS) {
      return "ca-app-pub-7891514870902041/3044806449";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static InterstitialAd get myInterstitial {
    return InterstitialAd(
      adUnitId: AdManager.interstitialAdUnitId,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );
  }
}
