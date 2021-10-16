import 'package:flutter/material.dart';

TextStyle getRegularKrFont(Color fontColor, double fontSize){
  return TextStyle(
    fontFamily: "NotoSansCJKkr",
    letterSpacing: getLetterSpacingKrFont(fontSize),
    color: fontColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w300,
  );
}

TextStyle getBoldKrFont(Color fontColor, double fontSize){
  return TextStyle(
    fontFamily: "NotoSansCJKkr",
    letterSpacing: getLetterSpacingKrFont(fontSize),
    color: fontColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
  );
}

double getLetterSpacingKrFont(double fontSize){
  return 0.025 * fontSize;
}

