import 'package:flutter/material.dart';
import 'package:pokemon_guides_app/Theme/color.dart';

Widget AppTitleText(BuildContext context){
  return Text(
      "Pokemon Life", style: TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold,color:AppColors.fontColorBlack
    )
  );
}