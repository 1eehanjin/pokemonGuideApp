import 'dart:ui';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Components/Common/TypeImage.dart';
import 'package:pokemon_guides_app/Components/Common/pokemon_card.dart';
import 'package:pokemon_guides_app/Datas/Data.dart';
import 'package:pokemon_guides_app/JsonDecoders/JsonPokemonModel.dart';
import 'package:pokemon_guides_app/JsonDecoders/item_model.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/shadows.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/textStyles.dart';
import 'package:shadowed_image/shadowed_image.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'PokemonListView.dart';


class ItemDetailView extends StatefulWidget {
  @override
  _ItemDetailViewState createState() => _ItemDetailViewState();
}

class _ItemDetailViewState extends State<ItemDetailView> {
  ItemModel? item;

  @override
  Widget build(BuildContext context) {
    item = Get.arguments;
    return Scaffold(

      body: ItemInfo(item)
    );


  }

}

class ItemInfo extends StatefulWidget {
  @override
  _ItemInfoState createState() => _ItemInfoState();

  ItemModel? item;
  ItemInfo(this.item){

  }
}

class _ItemInfoState extends State<ItemInfo> {
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
              title: Text(widget.item!.name, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h2)),
                background: Center(
                child: Hero(
                  tag: widget.item!.name,
                  child: SizedBox(
                    child: CachedNetworkImage(
                      fit: BoxFit.contain,
                      height: 200, width: 200,
                      imageUrl: widget.item!.imageUrl,

                    ),
                  ),
                ),
              ),

            ),
          ),
          SliverList(delegate: SliverChildListDelegate(
            [
              Container(
                margin: EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  children: [
                    SizedBox(height: marginSizeBlock,),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [Shadows.whiteBackgroundShadow],
                            color: AppColors.backgroundColorWhite
                        ),
                        padding: EdgeInsets.only(left: 24, right: 24),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: marginSizeM),
                            Text("Category", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                            SizedBox(height: marginSizeXS),
                            Text(widget.item!.category, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                            SizedBox(height: marginSizeBlock),
                            Text("Effect", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                            SizedBox(height: marginSizeXS),
                            Text(widget.item!.effect, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                            SizedBox(height: marginSizeBlock),

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


  Widget itemInfoTitle(String title){
    return Container(
      child: Text(title, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h2),),
      width: double.infinity,height: 60,alignment: Alignment.centerLeft,
    );
  }
}




