import 'package:book_app/src/core/book/datasources/remote/author_remote_datasource.dart';
import 'package:book_app/src/core/book/failures/author_failures.dart';
import 'package:book_app/src/core/shared/failures/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late AuthorRemoteDataSource datasource;
  late IHttpClientServiceMock httpClientMock;

  setUpAll(() {
    httpClientMock = IHttpClientServiceMock();
    datasource = AuthorRemoteDataSource(client: httpClientMock);
  });

  group('AuthorRemoteDataSource -getfavoriteAuthors ', () {
    test('Should return Map', () async {
      when(() => httpClientMock.query(any()))
          .thenAnswer((_) async => queryResultMock);

      final result = await datasource.getfavoriteAuthors();

      expect(result, isA<Map<String, dynamic>>());
    });
    test('Should return AuthorRemoteDataSourceError', () async {
      when(() => httpClientMock.query(any())).thenThrow(ExceptionMock());

      expect(() async => await datasource.getfavoriteAuthors(),
          throwsA(isA<AuthorRemoteDataSourceError>()));
    });

    test('Should return GraphqlHttpClientError', () async {
      when(() => httpClientMock.query(any()))
          .thenThrow(GraphqlHttpClientError(errorMessage: ''));

      expect(() async => await datasource.getfavoriteAuthors(),
          throwsA(isA<GraphqlHttpClientError>()));
    });
  });
}
