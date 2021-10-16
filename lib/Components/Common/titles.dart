import 'package:flutter/material.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/edge_insets.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/text_styles.dart';

class Titles{
  static Widget h1(String text){
    return Padding(
    padding: AppEdgeInsets.sideEdgeInsets,
    child: Text(text, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h1),),
    );
  }

  static Widget h2(String text){
    return Padding(
      padding: AppEdgeInsets.sideEdgeInsets,
      child: Text(text, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h2),),
    );
  }
}
