import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sunnah_diet/config/env.dart';
import 'config/firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'app.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
