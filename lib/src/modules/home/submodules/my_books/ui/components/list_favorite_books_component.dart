import 'package:flutter/material.dart';

import '../../../../../../core/book/model/book_model.dart';
import '../../../../../../core/shared/consts/app_text_styles_const.dart';
import '../widgets/custom_card_book_list_horizontal_widget.dart';

class ListFavoriteBooksComponent extends StatelessWidget {
  const ListFavoriteBooksComponent({Key? key, required this.listFavoriteBooks})
      : super(key: key);

  final List<BookModel> listFavoriteBooks;

  @override
  Widget build(BuildContext context) {
    final currentSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(right: 20, left: 20, top: 32, bottom: 21),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Meus Favoritos',
                style: AppTextStylesConst.titleHome,
              ),
              Text(
                'ver todos',
                style: AppTextStylesConst.secondaryHome,
              ),
            ],
          ),
        ),
        SizedBox(
          height: currentSize.height * 0.50,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: listFavoriteBooks.length,
            itemBuilder: (_, idx) => CustomCardBookListHorizontalComponent(
              book: listFavoriteBooks[idx],
            ),
          ),
        ),
      ],
    );
  }
}
