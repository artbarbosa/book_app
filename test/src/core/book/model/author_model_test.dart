import 'package:book_app/src/core/book/model/author_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/mock.dart';

void main() {
  group('AuthorModel - fromMap', () {
    test('Sshould return a AuthorModel', () {
      final result = AuthorModel.fromMap(authorMapMock);

      expect(result, isA<AuthorModel>());
      expect(result.booksCount, 4);
    });
  });
}
