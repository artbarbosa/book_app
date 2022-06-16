import '../../shared/failures/failures.dart';

class AuthorRemoteDataSourceError extends Failure {
  AuthorRemoteDataSourceError({
    StackTrace? stackTrace,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: errorMessage,
        );
}

class AuthorRepositoryError extends Failure {
  AuthorRepositoryError({
    StackTrace? stackTrace,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: errorMessage,
        );
}
