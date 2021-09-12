import 'package:flutter/material.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/textStyles.dart';

Widget TitleText(BuildContext context){
  return Container(
    width: MediaQuery.of(context).size.width,

    alignment: Alignment.centerLeft,
    child: Text(
      "트레이너님,\n반갑습니다!", style: getBoldKrFont(fontColorBlack, fontSize56)
    ),
  );
}