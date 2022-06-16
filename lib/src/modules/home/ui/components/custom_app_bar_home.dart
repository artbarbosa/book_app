import 'package:flutter/material.dart';

import '../../../../core/shared/consts/app_colors_const.dart';
import '../../../../core/shared/consts/app_text_styles_const.dart';
import '../../../../core/user/models/user_model.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({
    Key? key,
    required this.innerBoxIsScrolled,
    required this.user,
  }) : super(key: key);

  final bool innerBoxIsScrolled;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColorsConst.onPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(32),
        ),
      ),
      title: Image.asset('assets/images/logo.png'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.picture),
          ),
        )
      ],
      pinned: true,
      floating: true,
      forceElevated: innerBoxIsScrolled,
      bottom: TabBar(
        indicatorColor: AppColorsConst.primary,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 5.0,
            color: AppColorsConst.primary,
          ),
          insets: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              'Meus Livros',
              style: AppTextStylesConst.headingAppBar,
            ),
          ),
          Tab(
            child: Text(
              'Emprestados',
              style: AppTextStylesConst.headingAppBar,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ],
      ),
    );
  }
}
