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

  static BoxDecoration solidButton = BoxDecoration(
      boxShadow: [
        Shadows.whiteBackgroundShadow
      ]
      ,
      borderRadius: BorderRadius.circular(15),
      color: AppColors.brandColor
  );

  static BoxDecoration ghostButton = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColors.backgroundColorLight,
      border: Border.all(color: AppColors.brandColor),
  );

  static BoxDecoration outlineButton = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: AppColors.backgroundColorLight,
    border: Border.all(color: AppColors.backgroundColorGrey),
  );
}