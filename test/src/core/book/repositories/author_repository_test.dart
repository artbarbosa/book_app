import 'package:book_app/src/core/book/failures/author_failures.dart';
import 'package:book_app/src/core/book/model/author_model.dart';
import 'package:book_app/src/core/book/repositories/author_repository.dart';
import 'package:book_app/src/core/shared/failures/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mock.dart';

void main() {
  late AuthorRepository repository;
  late IAuthorRemoteDataSourceMock datasource;
  setUpAll(() {
    datasource = IAuthorRemoteDataSourceMock();
    repository = AuthorRepository(datasource: datasource);
  });

  group('AuthorRepository - getFavoriteAuthorsBooks', () {
    test('Should return List AuthorModel', () async {
      when(() => datasource.getfavoriteAuthors())
          .thenAnswer((_) async => mapGetFavoriteAuthors);

      final result = await repository.getFavoriteAuthorsBooks();

      expect(result, isA<List<AuthorModel>>());
    });

    test('Should throws AuthorRepositoryError', () async {
      when(() => datasource.getfavoriteAuthors()).thenThrow(ExceptionMock());

      expect(() async => await repository.getFavoriteAuthorsBooks(),
          throwsA(isA<AuthorRepositoryError>()));
    });
    test('Should throws GraphqlHttpClientError', () async {
      when(() => datasource.getfavoriteAuthors())
          .thenThrow(GraphqlHttpClientError(errorMessage: ''));

      expect(() async => await repository.getFavoriteAuthorsBooks(),
          throwsA(isA<GraphqlHttpClientError>()));
    });
    test('Should throws AuthorRemoteDataSourceError', () async {
      when(() => datasource.getfavoriteAuthors())
          .thenThrow(AuthorRemoteDataSourceError(errorMessage: ''));

      expect(() async => await repository.getFavoriteAuthorsBooks(),
          throwsA(isA<AuthorRemoteDataSourceError>()));
    });
  });
}
