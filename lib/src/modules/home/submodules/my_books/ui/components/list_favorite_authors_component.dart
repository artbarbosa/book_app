import 'package:flutter/material.dart';

import '../../../../../../core/book/model/author_model.dart';
import '../../../../../../core/shared/consts/app_text_styles_const.dart';
import '../widgets/custom_list_card_author_widget.dart';

class ListFavoriteAuthorsComponent extends StatelessWidget {
  const ListFavoriteAuthorsComponent({
    Key? key,
    required this.listFavoriteAuthors,
  }) : super(key: key);
  final List<AuthorModel> listFavoriteAuthors;
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
                'Autores Favoritos',
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
          height: currentSize.height * 0.15,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: listFavoriteAuthors.length,
            itemBuilder: (context, index) {
              return CustomCardAuthorWidget(
                author: listFavoriteAuthors[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
