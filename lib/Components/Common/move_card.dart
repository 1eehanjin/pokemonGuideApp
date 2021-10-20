import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Components/Common/type_image.dart';
import 'package:pokemon_guides_app/Datas/pokemon_type.dart';
import 'package:pokemon_guides_app/JsonDecoders/move_model.dart';
import 'package:pokemon_guides_app/Pages/move_detail_view.dart';
import 'package:pokemon_guides_app/Theme/box_decoration.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/text_styles.dart';

class MoveCard extends StatelessWidget {
  MoveCard({required MoveModel this.move}){
  }

  final MoveModel move;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,flex: 6,
      child: Stack(
        children: [
          Container(
            width: double.infinity,margin: EdgeInsets.only(left: 2, top: 2),
            child: Text(move.name, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h4)),
            height: 50,alignment: Alignment.center,
            decoration: BoxDecoration(
              //color: AppColors.backgroundColorLightGrey,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Colors.grey
                )
            ),
          ),
          Positioned(child: TypeTextBox(move.type), top: 0,left: 0,),
        ],
      ),
    );
  }
}


class MoveListCard extends StatelessWidget {
  MoveListCard({required MoveModel this.move}){
  }

  final MoveModel move;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: MarginSizes.m),
      child: GestureDetector(
        onTap: (){
          Get.to(MoveDetailView(), arguments: move, transition: Transition.fade);
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,margin: EdgeInsets.only(left: 2, top: 2),
              child: Text(move.name, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h4)),
              height: 60,alignment: Alignment.center,
              decoration: BoxDecorations.lightCard
            ),
            Positioned(child: TypeTextBox(move.type), top: 0,left: 0,),
          ],
        ),
      ),
    );
  }
}