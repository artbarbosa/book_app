import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../router/detail_arguments.dart';
import '../controller/detail_controller.dart';
import '../pages/detail_error.dart';
import '../pages/detail_page.dart';
import '../states/detail_states.dart';

class DetailContainer extends StatefulWidget {
  const DetailContainer({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  final DetailArguments arguments;

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  final controller = GetIt.I.get<DetailController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        controller.getBooksById(widget.arguments.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (BuildContext context, dynamic value, Widget? child) {
        if (value is DetailLoadedState) {
          return DetailPage(
            book: value.book,
          );
        }
        if (value is DetailErrorState) {
          return DetailErrorPage(
            errorMenssage: value.errorMessage,
            refresh: () => controller.getBooksById(widget.arguments.id),
          );
        }
        return Container();
      },
    );
  }
}
