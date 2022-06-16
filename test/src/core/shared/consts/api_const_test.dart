import 'package:book_app/src/core/shared/consts/api_const.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const String queryDocumentBookById =
      """
    query BookById {
      book(id: 1){
        cover
        isFavorite
        name
        description
        author{
          name
        }
      }
    }""";

  group('ApiConst - queryDocumentBookById', () {
    test('Should Return URL Api String', () async {
      var result = ApiConst.queryDocumentBookById('1');

      expect(result, queryDocumentBookById);
    });
  });
}
