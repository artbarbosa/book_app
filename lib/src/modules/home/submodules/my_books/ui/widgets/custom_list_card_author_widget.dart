import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/book/model/author_model.dart';
import '../../../../../../core/shared/consts/app_colors_const.dart';
import '../../../../../../core/shared/consts/app_text_styles_const.dart';

class CustomCardAuthorWidget extends StatelessWidget {
  const CustomCardAuthorWidget({Key? key, required this.author})
      : super(key: key);

  final AuthorModel author;

  @override
  Widget build(BuildContext context) {
    final currentSize = MediaQuery.of(context).size;

    return SizedBox(
      width: currentSize.width * 0.9,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: AppColorsConst.divider,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(imageUrl: author.picture!),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(author.name, style: AppTextStylesConst.titleBookHome),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                        '${author.booksCount.toString()} ${author.booksCount == 1 ? 'livro' : 'livros'}',
                        style: AppTextStylesConst.subtitleBookHome),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
