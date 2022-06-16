import 'package:book_app/src/core/book/failures/book_failures.dart';
import 'package:book_app/src/core/book/model/book_model.dart';
import 'package:book_app/src/core/book/repositories/book_repository.dart';
import 'package:book_app/src/core/shared/failures/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mock.dart';

void main() {
  late BookRepository repository;
  late IBookRemoteDataSourceMock datasource;
  setUpAll(() {
    datasource = IBookRemoteDataSourceMock();
    repository = BookRepository(datasource: datasource);
  });
  group('BookRepository - getAllBooks', () {
    test('Should return List BookModel', () async {
      when(() => datasource.getAllBooks())
          .thenAnswer((_) async => mapGetAllBooks);

      final result = await repository.getAllBooks();

      expect(result, isA<List<BookModel>>());
      expect(result.length, 2);
      expect(result.first.author!.name, 'Robert Cecil Martin');
      expect(result.first.description, null);
    });

    test('Should throws BookRepositoryError', () async {
      when(() => datasource.getAllBooks()).thenThrow(ExceptionMock());

      expect(() async => await repository.getAllBooks(),
          throwsA(isA<BookRepositoryError>()));
    });
    test('Should throws GraphqlHttpClientError', () async {
      when(() => datasource.getAllBooks())
          .thenThrow(GraphqlHttpClientError(errorMessage: ''));

      expect(() async => await repository.getAllBooks(),
          throwsA(isA<GraphqlHttpClientError>()));
    });
    test('Should throws BookRemoteDataSourceError', () async {
      when(() => datasource.getAllBooks())
          .thenThrow(BookRemoteDataSourceError(errorMessage: ''));

      expect(() async => await repository.getAllBooks(),
          throwsA(isA<BookRemoteDataSourceError>()));
    });
  });

  group('BookRepository - getFavoriteBooks', () {
    test('Should return List BookModel', () async {
      when(() => datasource.getFavoriteBooks())
          .thenAnswer((_) async => mapGetFavoriteBooks);

      final result = await repository.getFavoriteBooks();

      expect(result, isA<List<BookModel>>());
      expect(result.length, 2);
      expect(result.first.author!.name, 'Robert Cecil Martin');
      expect(result.first.description, null);
    });

    test('Should throws BookRepositoryError', () async {
      when(() => datasource.getFavoriteBooks()).thenThrow(ExceptionMock());

      expect(() async => await repository.getFavoriteBooks(),
          throwsA(isA<BookRepositoryError>()));
    });
    test('Should throws GraphqlHttpClientError', () async {
      when(() => datasource.getFavoriteBooks())
          .thenThrow(GraphqlHttpClientError(errorMessage: ''));

      expect(() async => await repository.getFavoriteBooks(),
          throwsA(isA<GraphqlHttpClientError>()));
    });
    test('Should throws BookRemoteDataSourceError', () async {
      when(() => datasource.getFavoriteBooks())
          .thenThrow(BookRemoteDataSourceError(errorMessage: ''));

      expect(() async => await repository.getFavoriteBooks(),
          throwsA(isA<BookRemoteDataSourceError>()));
    });
  });

  group('BookRepository - getBookById', () {
    test('Should return List BookModel', () async {
      when(() => datasource.getBookById(any()))
          .thenAnswer((_) async => mapGetBookById);

      final result = await repository.getBookById('');

      expect(result, isA<BookModel>());
      expect(result.author!.name, 'Robert Cecil Martin');
      expect(result.description?.isNotEmpty, true);
    });

    test('Should throws BookRepositoryError', () async {
      when(() => datasource.getBookById(any())).thenThrow(ExceptionMock());

      expect(() async => await repository.getBookById(''),
          throwsA(isA<BookRepositoryError>()));
    });
    test('Should throws GraphqlHttpClientError', () async {
      when(() => datasource.getBookById(any()))
          .thenThrow(GraphqlHttpClientError(errorMessage: ''));

      expect(() async => await repository.getBookById(''),
          throwsA(isA<GraphqlHttpClientError>()));
    });
    test('Should throws BookRemoteDataSourceError', () async {
      when(() => datasource.getBookById(any()))
          .thenThrow(BookRemoteDataSourceError(errorMessage: ''));

      expect(() async => await repository.getBookById(''),
          throwsA(isA<BookRemoteDataSourceError>()));
    });
  });
}
