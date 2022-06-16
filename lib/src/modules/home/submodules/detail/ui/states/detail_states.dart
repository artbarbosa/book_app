import '../../../../../../core/book/model/book_model.dart';

abstract class DetailPageState {}

class DetailLoadingState implements DetailPageState {}

class DetailLoadedState implements DetailPageState {
  final BookModel book;

  DetailLoadedState({
    required this.book,
  });
}

class DetailErrorState implements DetailPageState {
  final String errorMessage;

  DetailErrorState({required this.errorMessage});
}
