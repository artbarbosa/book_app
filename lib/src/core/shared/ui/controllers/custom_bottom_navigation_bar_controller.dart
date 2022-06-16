import 'package:flutter/cupertino.dart';

class CustomBottomNavigationBarController extends ValueNotifier<int> {
  CustomBottomNavigationBarController(super.value);

  final PageController _pageController = PageController();

  int get selectedIndex => value;

  PageController get pageController => _pageController;

  void changePage(int index) {
    _pageController.jumpToPage(index);
    value = index;
  }
}
