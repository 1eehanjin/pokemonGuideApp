import 'package:flutter/cupertino.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/shadows.dart';

class BoxDecorations{
  static BoxDecoration lightCard = BoxDecoration(
      boxShadow: [
        Shadows.whiteBackgroundShadow
      ]
      ,
      borderRadius: BorderRadius.circular(15),
      color: AppColors.backgroundColorWhite
  );
}