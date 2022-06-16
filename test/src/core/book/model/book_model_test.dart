import 'package:book_app/src/core/book/model/book_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/mock.dart';

void main() {
  group('BookModel - fromMap', () {
    test('Should return a BookModel', () {
      final result = BookModel.fromMap(bookMapMock);

      expect(result, isA<BookModel>());
      expect(result.name,
          "Clean Code: A Handbook of Agile Software Craftsmanship");
    });
  });
}
