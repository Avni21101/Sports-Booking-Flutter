import 'dart:developer';

/// Here, we're creating an abstract class for Faliure, Because
/// We can swap any kind of implementation that we want while
/// passing the Sub Failure class or while testing
/// [APIFailure] -> Failure while Calling the API
/// [RequestMakingFaliure] -> Failure when creating the request
/// [ResponseValidationFailure] -> Failure when validating the response
/// [ModelConversionFailure] -> Failure when converting the model to Dart Object
sealed class Failure {
  Failure();
  String get message;
}

/// This failure represents that there's some issue
/// in either calling an API or while there's something
/// happened on the backend side
class APIFailure extends Failure {
  APIFailure([this.error, this.stackTrace]) {
    log(stackTrace.toString());
    log(error.toString());
  }

  final Object? error;
  final StackTrace? stackTrace;

  @override
  String get message {
    String? errorMessage;

    return errorMessage ?? 'An error occurred';
  }
}
