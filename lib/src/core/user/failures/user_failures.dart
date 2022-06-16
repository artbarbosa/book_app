import '../../shared/failures/failures.dart';

class UserRemoteDataSourceError extends Failure {
  UserRemoteDataSourceError({
    StackTrace? stackTrace,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: errorMessage,
        );
}

class UserRepositoryError extends Failure {
  UserRepositoryError({
    StackTrace? stackTrace,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: errorMessage,
        );
}
