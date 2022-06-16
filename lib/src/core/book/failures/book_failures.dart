import '../../shared/failures/failures.dart';

class BookRemoteDataSourceError extends Failure {
  BookRemoteDataSourceError({
    StackTrace? stackTrace,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: errorMessage,
        );
}

class BookRepositoryError extends Failure {
  BookRepositoryError({
    StackTrace? stackTrace,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: errorMessage,
        );
}
