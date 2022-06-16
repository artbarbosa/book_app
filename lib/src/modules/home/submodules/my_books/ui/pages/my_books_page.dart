import 'package:flutter/material.dart';

import '../../../../../../core/book/model/author_model.dart';
import '../../../../../../core/book/model/book_model.dart';
import '../components/library_list_component.dart';
import '../components/list_favorite_authors_component.dart';
import '../components/list_favorite_books_component.dart';

class MyBooksPage extends StatefulWidget {
  const MyBooksPage({
    Key? key,
    required this.listFavoriteBooks,
    required this.listFavoriteAuthors,
    required this.listAllBooks,
  }) : super(key: key);
  final List<BookModel> listFavoriteBooks;
  final List<AuthorModel> listFavoriteAuthors;
  final List<BookModel> listAllBooks;

  @override
  State<MyBooksPage> createState() => _MyBooksPageState();
}

class _MyBooksPageState extends State<MyBooksPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListFavoriteBooksComponent(
              listFavoriteBooks: widget.listFavoriteBooks),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
              ),
            ),
            child: Column(
              children: [
                ListFavoriteAuthorsComponent(
                  listFavoriteAuthors: widget.listFavoriteAuthors,
                ),
                LibraryListComponent(
                  listAllBooks: widget.listAllBooks,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
