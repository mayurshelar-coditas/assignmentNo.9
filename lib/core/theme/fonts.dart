import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts {
  static TextStyle heebo(double fontSize, FontWeight fontWeight) {
    return GoogleFonts.heebo(
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle heeboWithColor(
    double fontSize,
    FontWeight fontWeight,
    Color color,
  ) {
    return GoogleFonts.heebo(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
