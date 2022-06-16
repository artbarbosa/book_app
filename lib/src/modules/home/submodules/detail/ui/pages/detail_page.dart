import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/book/model/book_model.dart';
import '../../../../../../core/shared/consts/app_colors_const.dart';
import '../../../../../../core/shared/consts/app_text_styles_const.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.book}) : super(key: key);

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    final currentSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: currentSize.width,
                height: 1730,
              ),
            ),
            SizedBox(
                width: currentSize.width,
                child: CachedNetworkImage(
                  imageUrl: book.cover,
                  fit: BoxFit.fitWidth,
                )),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: currentSize.height * 0.3,
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.black87,
                      Colors.black54,
                      Colors.black.withAlpha(0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: currentSize.height * 0.45,
              width: currentSize.width,
              child: Container(
                width: currentSize.width,
                decoration: const BoxDecoration(
                  color: AppColorsConst.onPrimary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: currentSize.width * 0.7,
                                child: Text.rich(
                                  softWrap: true,
                                  TextSpan(
                                    text: book.name,
                                    style: AppTextStylesConst.titleDetail,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 20),
                                child: Text(
                                  book.author!.name,
                                  style: AppTextStylesConst.subtitleDetail,
                                ),
                              ),
                            ],
                          ),
                          book.isFavorite!
                              ? const Icon(
                                  Icons.favorite,
                                  color: AppColorsConst.primary,
                                )
                              : const Icon(
                                  Icons.favorite_outline,
                                  size: 32,
                                )
                        ],
                      ),
                      Text(
                        book.description!,
                        softWrap: true,
                        style: AppTextStylesConst.descriptionBookDetail,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
