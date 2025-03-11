import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sports_booking/core/data/services/hive_services.dart';
import 'app/injection.dart';
import 'firebase_options.dart' as firebase_option;

Future<void> bootStrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebase_option.DefaultFirebaseOptions.currentPlatform);
  getIt.registerSingleton<IHiveService>(const HiveService());
  await getIt<IHiveService>().init();
}
