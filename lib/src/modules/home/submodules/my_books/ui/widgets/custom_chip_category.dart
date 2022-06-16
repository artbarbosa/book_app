import 'package:flutter/material.dart';

import '../../../../../../core/shared/consts/app_colors_const.dart';
import '../../../../../../core/shared/consts/app_text_styles_const.dart';

class CustomChipCategoryWidget extends StatelessWidget {
  const CustomChipCategoryWidget(
      {Key? key, required this.isSelected, required this.label})
      : super(key: key);
  final bool isSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..scale(1.2),
      child: Chip(
        shape: StadiumBorder(
          side: isSelected
              ? BorderSide.none
              : const BorderSide(color: AppColorsConst.divider),
        ),
        backgroundColor:
            isSelected ? AppColorsConst.primary : AppColorsConst.onPrimary,
        label: Text(
          label,
          style: isSelected
              ? AppTextStylesConst.categoryBookHomeSelected
              : AppTextStylesConst.categoryBookHome,
        ),
      ),
    );
  }
}
