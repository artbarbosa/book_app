import 'package:flutter/material.dart';

import '../../../../../../core/book/model/author_model.dart';
import '../../../../../../core/book/model/book_model.dart';
import '../../../../../../core/book/repositories/author_repository.dart';
import '../../../../../../core/book/repositories/book_repository.dart';
import '../states/my_books_page_states.dart';

class MyBooksController extends ValueNotifier<MyBooksPageState> {
  final IBookRepository _bookRepository;
  final IAuthorRepository _authorRepository;

  MyBooksController(
    this._bookRepository,
    this._authorRepository,
  ) : super(MyBooksLoadingState());

  List<BookModel> _listFavoriteBooks = [];
  List<BookModel> _listAllBooks = [];
  List<AuthorModel> _listFavoriteAuthors = [];

  Future<void> _getFavoriteBooks() async =>
      _listFavoriteBooks = await _bookRepository.getFavoriteBooks();

  Future<void> _getAllBooks() async =>
      _listAllBooks = await _bookRepository.getAllBooks();

  Future<void> _getFavoriteAuthorsBooks() async =>
      _listFavoriteAuthors = await _authorRepository.getFavoriteAuthorsBooks();

  Future<void> fetchMyBooks() async {
    value = MyBooksLoadingState();
    try {
      await _getFavoriteBooks();
      await _getFavoriteAuthorsBooks();
      await _getAllBooks();
      value = MyBooksLoadedState(
        listAllBooks: _listAllBooks,
        listFavoriteAuthors: _listFavoriteAuthors,
        listFavoriteBooks: _listFavoriteBooks,
      );
    } catch (e) {
      value = MyBooksErrorState(errorMessage: e.toString());
    }
  }
}
