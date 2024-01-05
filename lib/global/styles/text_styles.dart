import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_holywings/global/constants/colors.dart';

class KTextStyles {
  static TextStyle roboto(
      {Color? textColor, double? fontSize, FontWeight? fontWeight}) {
    return GoogleFonts.roboto(
      fontSize: fontSize ?? 18,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: textColor ?? KColors.kColorText,
    );
  }
}
