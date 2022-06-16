import 'package:flutter/material.dart';

import '../../../../core/user/models/user_model.dart';
import '../../../../core/user/repositories/user_repository.dart';
import '../states/home_states.dart';

class HomeController extends ValueNotifier<HomePageState> {
  final IUserRepository _userRepository;

  HomeController(
    this._userRepository,
  ) : super(HomeLoadingState());

  late UserModel _userModel;

  Future<void> getUser() async {
    value = HomeLoadingState();
    try {
      _userModel = await _userRepository.getUser();

      value = HomeLoadedState(user: _userModel);
    } catch (e) {
      value = HomeErrorState(errorMessage: e.toString());
    }
  }
}
