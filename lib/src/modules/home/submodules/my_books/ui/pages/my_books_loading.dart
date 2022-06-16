import 'package:flutter/material.dart';

import '../../../../../../core/shared/consts/app_colors_const.dart';

class MyBooksLodingPage extends StatelessWidget {
  const MyBooksLodingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppColorsConst.primary,
        ),
      ),
    );
  }
}
