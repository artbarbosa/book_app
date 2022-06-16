import 'package:book_app/src/core/shared/failures/failures.dart';
import 'package:book_app/src/core/user/datasources/remote/user_datasource.dart';
import 'package:book_app/src/core/user/failures/user_failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late UserRemoteDataSource datasource;
  late IHttpClientServiceMock httpClientMock;

  setUpAll(() {
    httpClientMock = IHttpClientServiceMock();
    datasource = UserRemoteDataSource(client: httpClientMock);
  });

  group('UserRemoteDataSource - getUser', () {
    test('Should return Map', () async {
      when(() => httpClientMock.query(any()))
          .thenAnswer((_) async => queryResultMock);

      final result = await datasource.getUser();

      expect(result, isA<Map<String, dynamic>>());
    });
    test('Should return UserRemoteDataSourceError', () async {
      when(() => httpClientMock.query(any())).thenThrow(ExceptionMock());

      expect(() async => await datasource.getUser(),
          throwsA(isA<UserRemoteDataSourceError>()));
    });

    test('Should return GraphqlHttpClientError', () async {
      when(() => httpClientMock.query(any()))
          .thenThrow(GraphqlHttpClientError(errorMessage: ''));

      expect(() async => await datasource.getUser(),
          throwsA(isA<GraphqlHttpClientError>()));
    });
  });
}
