import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:sports_booking/app/helpers/google_auth_helper.dart';
import 'package:sports_booking/core/data/src/api_failure.dart';
import 'package:sports_booking/modules/authentication/model/auth_request_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// This repository contains the contract for login and logout function
abstract interface class IAuthRepository {
  TaskEither<Failure, Unit> login(AuthRequestModel authRequestModel);

  TaskEither<Failure, Unit> signup(AuthRequestModel authRequestModel);

  TaskEither<Failure, Unit> googleSignIn();

  Future<bool> logout();
}

class AuthRepository implements IAuthRepository {
  const AuthRepository();

  static final SupabaseClient supabaseClient = Supabase.instance.client;

  @override
  TaskEither<Failure, Unit> login(AuthRequestModel authRequestModel) =>
      makeLoginRequest(authRequestModel);

  TaskEither<Failure, Unit> makeLoginRequest(AuthRequestModel authRequestModel) =>
      TaskEither.tryCatch(() async {
        await supabaseClient.auth.signInWithPassword(
          email: authRequestModel.email,
          password: authRequestModel.password,
        );

        return unit;
      }, (error, stackTrace) => APIFailure(error, stackTrace));

  @override
  TaskEither<Failure, Unit> signup(AuthRequestModel authRequestModel) =>
      makeSignUpRequest(authRequestModel);

  TaskEither<Failure, Unit> makeSignUpRequest(AuthRequestModel authRequestModel) =>
      TaskEither.tryCatch(() async {
        await supabaseClient.auth.signUp(
          email: authRequestModel.email,
          password: authRequestModel.password,
        );

        return unit;
      }, (error, stackTrace) => APIFailure(error, stackTrace));

  @override
  TaskEither<Failure, Unit> googleSignIn() => makeGoogleSignInRequest();

  TaskEither<Failure, Unit> makeGoogleSignInRequest() => TaskEither.tryCatch(
    () async {
      await GoogleAuthInHelper.signInWithGoogle();
      return unit;
    },
    (error, stackTrace) {
      return APIFailure(error, stackTrace);
    },
  );

  @override
  Future<bool> logout() async {
    try {
      await supabaseClient.auth.signOut();

      return true;
    } catch (error) {
      log(error.toString());
      return false;
    }
  }
}
