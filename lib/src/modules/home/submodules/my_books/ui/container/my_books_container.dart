import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../core/shared/ui/controllers/custom_bottom_navigation_bar_controller.dart';
import '../controllers/my_books_controller.dart';
import '../pages/my_books_error_page.dart';
import '../pages/my_books_loading.dart';
import '../pages/my_books_page.dart';
import '../states/my_books_page_states.dart';

class MyBooksContainer extends StatefulWidget {
  const MyBooksContainer({Key? key}) : super(key: key);

  @override
  State<MyBooksContainer> createState() => _MyBooksContainerState();
}

class _MyBooksContainerState extends State<MyBooksContainer> {
  final controllerBottomNavigation =
      GetIt.I.get<CustomBottomNavigationBarController>();

  final controller = GetIt.I.get<MyBooksController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        controller.fetchMyBooks();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, _) {
        if (value is MyBooksLoadedState) {
          return MyBooksPage(
            listAllBooks: value.listAllBooks,
            listFavoriteAuthors: value.listFavoriteAuthors,
            listFavoriteBooks: value.listFavoriteBooks,
          );
        }
        if (value is MyBooksErrorState) {
          return MyBooksErrorPage(
            errorMenssage: value.errorMessage,
            refresh: () => controller.fetchMyBooks(),
          );
        }

        return const MyBooksLodingPage();
      },
    );
  }
}
