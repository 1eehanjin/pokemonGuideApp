import 'dart:ui';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Components/Common/type_image.dart';
import 'package:pokemon_guides_app/JsonDecoders/move_model.dart';
import 'package:pokemon_guides_app/Theme/box_decoration.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/text_styles.dart';
import 'package:shadowed_image/shadowed_image.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'move_list_view.dart';


class MoveDetailView extends StatefulWidget {
  @override
  _MoveDetailViewState createState() => _MoveDetailViewState();
}

class _MoveDetailViewState extends State<MoveDetailView> {
  MoveModel? move;

  @override
  Widget build(BuildContext context) {
    move = Get.arguments;
    return Scaffold(

        body: MoveInfo(move)
    );


  }

}

class MoveInfo extends StatefulWidget {
  @override
  _MoveInfoState createState() => _MoveInfoState();

  MoveModel? move;
  MoveInfo(this.move){

  }
}

class _MoveInfoState extends State<MoveInfo> {
  bool numberState = false;

  @override
  Widget build(BuildContext context) {
    return
      CustomScrollView(

        slivers: <Widget>[
          SliverAppBar(

            elevation: 5,
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 400.0,
            shadowColor:AppColors.shadowColorWhiteBackground,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              title: Text(widget.move!.name, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h2)),


            ),
          ),
          SliverList(delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    children: [
                      SizedBox(height: MarginSizes.block,),
                      Container(
                        width: double.infinity,
                          decoration: BoxDecorations.lightCard,
                          padding: EdgeInsets.only(left: 24, right: 24),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: MarginSizes.m),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    flex: 3,fit: FlexFit.tight,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: MarginSizes.m),
                                        Text("Type", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                        SizedBox(height: MarginSizes.m),
                                        Text("Category", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                        SizedBox(height: MarginSizes.m),
                                        Text("Power", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                        SizedBox(height: MarginSizes.m),
                                        Text("Accuracy", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                        SizedBox(height: MarginSizes.m),
                                        Text("Pp", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                        SizedBox(height: MarginSizes.m),
                                        Text("Effect", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                        SizedBox(height: MarginSizes.m),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    flex: 4,fit: FlexFit.tight,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: MarginSizes.m),
                                        TypeTextBox(widget.move!.type ),
                                        SizedBox(height: MarginSizes.m),
                                        Text(widget.move!.category, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                        SizedBox(height: MarginSizes.m),
                                        Text(widget.move!.power.toString(), style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                        SizedBox(height: MarginSizes.m),
                                        Text(widget.move!.accuracy.toString(), style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                        SizedBox(height: MarginSizes.m),
                                        Text(widget.move!.pp.toString(), style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                        SizedBox(height: MarginSizes.m),
                                        Text(widget.move!.effect.toString(), style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                        SizedBox(height: MarginSizes.m),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ]
          )),

        ],
      );
  }

}




