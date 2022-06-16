import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/book/model/book_model.dart';
import '../../../../../../core/shared/consts/app_text_styles_const.dart';
import '../../../detail/router/detail_arguments.dart';

class CustomCardBookListHorizontalComponent extends StatelessWidget {
  final BookModel book;
  const CustomCardBookListHorizontalComponent({Key? key, required this.book})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed('/detail', arguments: DetailArguments(id: book.id)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: currentSize.width * 0.5,
                child: AspectRatio(
                  aspectRatio: 136 / 198,
                  child: ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl: book.cover,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 2, top: 10),
              child: SizedBox(
                width: currentSize.width * 0.5,
                child: Text.rich(
                  softWrap: false,
                  TextSpan(
                    text: book.name,
                    style: AppTextStylesConst.titleBookHome,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
            Text(
              book.author!.name,
              style: AppTextStylesConst.subtitleBookHome,
            ),
          ],
        ),
      ),
    );
  }
}
