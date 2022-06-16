import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors_const.dart';

class AppTextStylesConst {
  static final titleHome = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColorsConst.headingTitle,
  );
  static final secondaryHome = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColorsConst.primary,
  );

  static final headingAppBar = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColorsConst.headingTitle,
  );

  static final titleBookHome = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColorsConst.headingTitle,
  );

  static final subtitleBookHome = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColorsConst.secondary,
  );

  static final categoryBookHome = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColorsConst.subtitle,
  );
  static final categoryBookHomeSelected = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColorsConst.onPrimary,
  );

  static final descriptionBookDetail = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColorsConst.headingTitle,
  );

  static final titleDetail = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColorsConst.headingTitle,
  );

  static final subtitleDetail = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColorsConst.subtitle,
  );
}
