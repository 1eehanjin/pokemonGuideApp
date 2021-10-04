import 'dart:ui';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Datas/Data.dart';
import 'package:pokemon_guides_app/JsonDecoders/JsonPokemonModel.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/shadows.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/textStyles.dart';
import 'package:shadowed_image/shadowed_image.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';


class PokemonDetailView extends StatefulWidget {
  @override
  _PokemonDetailViewState createState() => _PokemonDetailViewState();
}

class _PokemonDetailViewState extends State<PokemonDetailView> {
  PokemonModel? pokemon;

  @override
  Widget build(BuildContext context) {
    pokemon = Get.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: DefaultTabController(
        length: 3,
        child: ListView(
          children: [
            Hero(
              tag: pokemon!.name,
              child: Container(
                width: Get.width, height: 300,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(

                      bottom: 50,
                      child: CachedNetworkImage(
                        imageUrl: pokemon!.imageUrl,
                        imageBuilder: (context, imageProvider) => Container(
                          width: 250, height: 250,
                          child: ShadowedImage(offset: Offset(5, 10),

                            image: Image(image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(alignment: Alignment.center,
                child: Text(pokemon!.name, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h1))
            ),
            SizedBox(height: marginSizeBlock,),
            Container(
              margin: EdgeInsets.only(left: 24, right: 24),
              decoration: BoxDecoration(
                  color: AppColors.backgroundColorWhite,
                  boxShadow: [Shadows.whiteBackgroundShadow],
                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))

              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(child: Text("정보", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),),
                  Tab(child: Text("능력치", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),)),
                  Tab(child: Text("서식", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),)),
                ],
              ),
            ),
            Container(height: 500,
              child: TabBarView(
                children: [
                  PokemonInfo(pokemon),
                  Icon(Icons.directions_transit, size: 350),
                  Icon(Icons.directions_car, size: 350),
                ],
              ),
            ),
          ],




          ),
        ),

    );
  }

}

class PokemonInfo extends StatefulWidget {
  @override
  _PokemonInfoState createState() => _PokemonInfoState();

  final PokemonModel? pokemon;
  PokemonInfo(this.pokemon){

  }
}

class _PokemonInfoState extends State<PokemonInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(left:0, right: 0),
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Row(
        children: [
          Flexible(
            flex: 3,fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: marginSizeBlock),
                Text("Species", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                SizedBox(height: marginSizeM),
                Text("Height", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                SizedBox(height: marginSizeM),
                Text("Weight", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                SizedBox(height: marginSizeM),
                Text("base EXP", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                SizedBox(height: marginSizeM),
                Text("egg groups", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                SizedBox(height: marginSizeM),
                Text("egg cycles", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),

              ],
            ),
          ),

          Flexible(
            flex: 4,fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: marginSizeBlock),
                Text(widget.pokemon!.category, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                SizedBox(height: marginSizeM),
                Text(widget.pokemon!.height, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                SizedBox(height: marginSizeM),
                Text(widget.pokemon!.weight, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                SizedBox(height: marginSizeM),
                Text(widget.pokemon!.baseExp, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                SizedBox(height: marginSizeM),
                Text(widget.pokemon!.eggGroups, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                SizedBox(height: marginSizeM),
                Text(widget.pokemon!.cycles, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                SizedBox(height: marginSizeM),
                Text(widget.pokemon!.evolvedFrom, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),

              ],
            ),
          ),
        ],
      )
    );
  }
}

