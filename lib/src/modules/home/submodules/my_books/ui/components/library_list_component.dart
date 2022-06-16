import 'package:flutter/material.dart';

import '../../../../../../core/book/model/book_model.dart';
import '../../../../../../core/shared/consts/app_text_styles_const.dart';
import '../widgets/custom_card_book_list_vertical_widget.dart';
import 'list_categorys_component.dart';

class LibraryListComponent extends StatelessWidget {
  const LibraryListComponent({Key? key, required this.listAllBooks})
      : super(key: key);
  final List<BookModel> listAllBooks;
  @override
  Widget build(BuildContext context) {
    final currentSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 30, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Blioteca',
                style: AppTextStylesConst.titleHome,
              ),
            ],
          ),
        ),
        SizedBox(
          width: currentSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListCategoryComponent(),
              SizedBox(
                width: currentSize.width,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: listAllBooks.length,
                  itemBuilder: (context, index) {
                    return CustomCardBookListVerticalWidget(
                      book: listAllBooks[index],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
