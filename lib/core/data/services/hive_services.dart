import 'package:fpdart/fpdart.dart';

abstract interface class IHiveService {
  /// This function is used for initializing the underlying database implementation for
  /// getting and setting the user data
  Future<Unit> init();
  //
  // /// This function is used for setting the access token that a user gets from
  // /// the API and store it in the local database.
  // TaskEither<Failure, Unit> setAccessToken(String accessToken);
  // TaskEither<Failure, Unit> setUserData(UserModel userModel);
  // Option<String> getAccessToken();
  // Task<Unit> clearData();
  // Either<Failure, List<UserModel>> getUserData();
}

final class HiveService implements IHiveService {
  const HiveService();
  @override
  Future<Unit> init() {
    throw UnimplementedError();
  }
}
