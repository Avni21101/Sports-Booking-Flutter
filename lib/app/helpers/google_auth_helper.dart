import 'package:google_sign_in/google_sign_in.dart';
import 'package:sports_booking/app/config/secrets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GoogleAuthInHelper {
  /// [Supabase.instance.client] is designed as a singleton. That's why initializing multiple time does not matter.
  static final SupabaseClient _supabaseClient = Supabase.instance.client;

  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>['email', 'https://www.googleapis.com/auth/contacts.readonly'],
    clientId: SupabaseKeys.iosClientId,
    serverClientId: SupabaseKeys.webClientId,
  );

  static Future<void> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken != null && idToken != null) {
      await _supabaseClient.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
    }
  }
}
