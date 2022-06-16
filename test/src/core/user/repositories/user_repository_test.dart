import 'package:book_app/src/core/shared/failures/failures.dart';
import 'package:book_app/src/core/user/datasources/remote/user_datasource.dart';
import 'package:book_app/src/core/user/failures/user_failures.dart';
import 'package:book_app/src/core/user/models/user_model.dart';
import 'package:book_app/src/core/user/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mock.dart';

class IUserRemoteDataSourceMock extends Mock implements IUserRemoteDataSource {}

void main() {
  late UserRepository repository;
  late IUserRemoteDataSourceMock datasource;
  setUpAll(() {
    datasource = IUserRemoteDataSourceMock();
    repository = UserRepository(datasource: datasource);
  });

  group('AuthorRepository - getUser', () {
    test('Should return List UserModel', () async {
      when(() => datasource.getUser())
          .thenAnswer((_) async => mapGetUserPicture);

      final result = await repository.getUser();

      expect(result, isA<UserModel>());
      expect(result.picture.isNotEmpty, true);
    });

    test('Should throws UserRepositoryError', () async {
      when(() => datasource.getUser()).thenThrow(ExceptionMock());

      expect(() async => await repository.getUser(),
          throwsA(isA<UserRepositoryError>()));
    });
    test('Should throws GraphqlHttpClientError', () async {
      when(() => datasource.getUser())
          .thenThrow(GraphqlHttpClientError(errorMessage: ''));

      expect(() async => await repository.getUser(),
          throwsA(isA<GraphqlHttpClientError>()));
    });
    test('Should throws UserRemoteDataSourceError', () async {
      when(() => datasource.getUser())
          .thenThrow(UserRemoteDataSourceError(errorMessage: ''));

      expect(() async => await repository.getUser(),
          throwsA(isA<UserRemoteDataSourceError>()));
    });
  });
}
