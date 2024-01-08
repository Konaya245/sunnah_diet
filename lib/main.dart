import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sunnah_diet/config/env.dart';
import 'config/firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'app.dart';
import 'views/error_page/error_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      runApp(const NoInternetConnectionApp());
    } else {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await FirebaseAppCheck.instance.activate(
        androidProvider: AndroidProvider.playIntegrity,
      );
      tz.initializeTimeZones();
      await Env.initialize();
      runApp(const App());
    }
  } catch (e) {
    runApp(const ErrorApp());
  }
}
