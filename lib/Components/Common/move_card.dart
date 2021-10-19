import 'package:flutter/material.dart';
import 'package:pokemon_guides_app/Components/Common/type_image.dart';
import 'package:pokemon_guides_app/Datas/pokemon_type.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/text_styles.dart';

class MoveCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,flex: 6,
      child: Stack(
        children: [
          Container(
            width: double.infinity,margin: EdgeInsets.only(left: 2, top: 2),
            child: Text("10만볼트", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h4)),
            height: 50,alignment: Alignment.center,
            decoration: BoxDecoration(
              //color: AppColors.backgroundColorLightGrey,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Colors.grey
                )
            ),
          ),
          Positioned(child: TypeTextBox(PokemonTypes.electric), top: 0,left: 0,),
        ],
      ),
    );
  }
}
