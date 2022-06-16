import '../../../../../../core/book/model/author_model.dart';
import '../../../../../../core/book/model/book_model.dart';

abstract class MyBooksPageState {}

class MyBooksLoadingState implements MyBooksPageState {}

class MyBooksLoadedState implements MyBooksPageState {
  final List<BookModel> listFavoriteBooks;
  final List<AuthorModel> listFavoriteAuthors;
  final List<BookModel> listAllBooks;

  MyBooksLoadedState({
    required this.listFavoriteBooks,
    required this.listFavoriteAuthors,
    required this.listAllBooks,
  });
}

class MyBooksErrorState implements MyBooksPageState {
  final String errorMessage;

  MyBooksErrorState({required this.errorMessage});
}
