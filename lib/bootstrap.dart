import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sports_booking/app/config/secrets.dart';
import 'package:sports_booking/app/injection.dart';
import 'app/helpers/google_auth_helper.dart';
import 'firebase_options.dart' as firebase_option;
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> bootStrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebase_option.DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(url: SupabaseKeys.projectUrl, anonKey: SupabaseKeys.anonPublicAPIKey);
  getIt.registerSingleton(GoogleAuthInHelper());
}
