import 'package:flutter/material.dart';

import '../../../../../../core/book/repositories/book_repository.dart';
import '../states/detail_states.dart';

class DetailController extends ValueNotifier<DetailPageState> {
  final IBookRepository bookRepository;

  DetailController(
    this.bookRepository,
  ) : super(DetailLoadingState());

  Future<void> getBooksById(String id) async {
    value = DetailLoadingState();
    try {
      final book = await bookRepository.getBookById(id);
      value = DetailLoadedState(book: book);
    } catch (e) {
      value = DetailErrorState(errorMessage: e.toString());
    }
  }
}
