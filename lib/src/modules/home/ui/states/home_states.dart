import '../../../../core/user/models/user_model.dart';

abstract class HomePageState {}

class HomeLoadingState implements HomePageState {}

class HomeLoadedState implements HomePageState {
  final UserModel user;
  HomeLoadedState({
    required this.user,
  });
}

class HomeErrorState implements HomePageState {
  final String errorMessage;

  HomeErrorState({required this.errorMessage});
}
