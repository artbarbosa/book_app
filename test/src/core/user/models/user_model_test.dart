import 'package:book_app/src/core/user/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/mock.dart';

void main() {
  group('UserModel = fromMap', () {
    test('Should return a  UserModel', () {
      final result = UserModel.fromMap(userMapMock);

      expect(result, isA<UserModel>());
      expect(result.picture,
          'https://sscdn.co/gcs/studiosol/2022/mobile/avatar.jpg');
    });
  });
}
