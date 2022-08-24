import 'dart:async';
import 'dart:developer';
import 'package:auto_whats/autowhats.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helper/shared_preferences.dart';

late SharedPreferences sp;
var isUserLogin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initSp();
  final FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;
  runZonedGuarded<Future<void>>(() async {
    await crashlytics.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = crashlytics.recordFlutterError;
    await AppPreference.initMySharedPreferences();
    runApp(AutoWhats());
  }, (error, stack) => crashlytics.recordError(error, stack));
  // runApp(Direct());
}

initSp() async {
  sp = await SharedPreferences.getInstance();
  isUserLogin = await sp.getBool('login');
  log('mainSPValue-----${sp.getBool('login')}');
}