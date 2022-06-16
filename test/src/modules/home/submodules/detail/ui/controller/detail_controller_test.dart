import 'package:book_app/src/modules/home/submodules/detail/ui/controller/detail_controller.dart';
import 'package:book_app/src/modules/home/submodules/detail/ui/states/detail_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../../mocks/mock.dart';

void main() {
  late DetailController controller;
  late IBookRepositoryMock bookRepository;

  setUpAll(() {
    bookRepository = IBookRepositoryMock();
    controller = DetailController(bookRepository);
  });

  group('DetailController - getBooksById', () {
    test('Should get and change value DetailLoadedState', () async {
      when(() => bookRepository.getBookById(any()))
          .thenAnswer((_) async => bookModelMock);

      await controller.getBooksById('1');

      expect(controller.value, isA<DetailLoadedState>());
    });

    test('Should get and change value DetailErrorState', () async {
      when(() => bookRepository.getBookById(any()))
          .thenThrow((_) async => ExceptionMock());

      await controller.getBooksById('1');

      expect(controller.value, isA<DetailErrorState>());
    });
  });
}
