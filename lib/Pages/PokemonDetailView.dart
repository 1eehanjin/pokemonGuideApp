import 'dart:ui';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Components/Common/TypeImage.dart';
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
    return DefaultTabController(
        length: 6,
        child: Scaffold(

          appBar: AppBar(title: Text(pokemon!.name, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h1))),
          body: ListView(
            children: [
              SizedBox(height: marginSizeBlock,),
              Hero(
                tag: pokemon!.name,
                child: Container(
                  width: Get.width, height: 250,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(

                        bottom: 0,
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
              Container(height: 2500,
                child: PokemonInfo(pokemon),
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
  bool numberState = false;
  
  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.only(left: 24, right: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: marginSizeM,),
                Text("Overall", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h1),),
                SizedBox(height: marginSizeM,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: marginSizeM),
                          Text("Type", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                          SizedBox(height: marginSizeM),
                          Text("Abilities", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                          SizedBox(height: marginSizeM),
                          Text("Species", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                          SizedBox(height: marginSizeM),
                          Text("Height", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                          SizedBox(height: marginSizeM),
                          Text("Weight", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                          SizedBox(height: marginSizeM),
                          Text("Gender", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                          SizedBox(height: marginSizeM),
                          Text("base EXP", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                          SizedBox(height: marginSizeM),
                          Text("egg groups", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                          SizedBox(height: marginSizeM),
                          Text("egg cycles", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                          SizedBox(height: marginSizeM),
                        ],
                      ),
                    ),

                    Flexible(
                      flex: 4,fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: marginSizeM),
                          Row(
                              children: [
                                Container(
                                    height: 20, width: 20,
                                    child: TypeImage(widget.pokemon!.types![0])
                                ),
                                Text(widget.pokemon!.types![0], style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                SizedBox(width: 20,),
                                Container(
                                    height: 20, width: 20,
                                    child: widget.pokemon!.types!.length > 1 ?TypeImage(widget.pokemon!.types![1]) : Container()
                                ),
                                widget.pokemon!.types!.length > 1 ?Text(widget.pokemon!.types![1], style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),): Container(),

                              ]
                          ),
                          SizedBox(height: marginSizeM),
                          Text(widget.pokemon!.abilities![0], style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                          SizedBox(height: marginSizeM),
                          Text(widget.pokemon!.category, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                          SizedBox(height: marginSizeM),
                          Text(widget.pokemon!.height, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                          SizedBox(height: marginSizeM),
                          Text(widget.pokemon!.weight, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                          SizedBox(height: marginSizeM),
                          Text(widget.pokemon!.genderFemalePercentage, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                          SizedBox(height: marginSizeM),
                          Text(widget.pokemon!.baseExp, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                          SizedBox(height: marginSizeM),
                          Text(widget.pokemon!.eggGroups, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                          SizedBox(height: marginSizeM),
                          Text(widget.pokemon!.cycles, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                          SizedBox(height: marginSizeM),

                        ],
                      ),
                    ),
                  ],
                ),

              ],
            )
            ),

            SizedBox(height: marginSizeM,),


            PokemonInfoCard(titleWidget:  pokemonInfoTitle("능력치"), contentsWidget: statusContents(),),
            SizedBox(height: marginSizeM,),
            PokemonInfoCard(titleWidget:  pokemonInfoTitle("방어 상성"), contentsWidget: typeContents(),),
            SizedBox(height: marginSizeM,),
            PokemonInfoCard(titleWidget:  pokemonInfoTitle("기술"), contentsWidget: skillContents(),),
            SizedBox(height: marginSizeM,),
            PokemonInfoCard(titleWidget:  pokemonInfoTitle("진화 및 모습"), contentsWidget: evolutionContents(),),
            SizedBox(height: marginSizeM,),
            PokemonInfoCard(titleWidget:  pokemonInfoTitle("도감별 설명"), contentsWidget: regionalContents(),),
            
            SizedBox(height: marginSizeM,),
            PokemonInfoCard(titleWidget:  pokemonInfoTitle("출현 장소"), contentsWidget: locationContents(),)

          ],
        ),
      );
  }
  Widget statusContents(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,fit: FlexFit.tight,
                child: Text("관동", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),

              Flexible(
                flex: 6,fit: FlexFit.tight,
                child: Text("#001", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),
            ],
          ),
          SizedBox(height: marginSizeXS,),
          Text(widget.pokemon!.xDescription, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
          SizedBox(height: marginSizeM,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,fit: FlexFit.tight,
                child: Text("전국", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),

              Flexible(
                flex: 6,fit: FlexFit.tight,
                child: Text("#001", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),
            ],
          ),
          SizedBox(height: marginSizeXS,),
          Text(widget.pokemon!.xDescription, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
          SizedBox(height: marginSizeM,),
        ],


      ),
    );
  }
  Widget typeContents(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
              child: Text("매우 강함", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),)),
          SizedBox(height: marginSizeXS,),
          Wrap(
            alignment: WrapAlignment.start,
            children: [
            Container(
              child: Text("Grass", style: getBoldKrFont(AppColors.fontColorWhite, FontSizes.paragraph),),
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5),
            ),
            )
          ],),
          SizedBox(height: marginSizeM,),

        ],


      ),
    );
  }
  Widget skillContents(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,fit: FlexFit.tight,
                child: Text("관동", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),

              Flexible(
                flex: 6,fit: FlexFit.tight,
                child: Text("#001", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),
            ],
          ),
          SizedBox(height: marginSizeXS,),
          Text(widget.pokemon!.xDescription, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
          SizedBox(height: marginSizeM,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,fit: FlexFit.tight,
                child: Text("전국", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),

              Flexible(
                flex: 6,fit: FlexFit.tight,
                child: Text("#001", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),
            ],
          ),
          SizedBox(height: marginSizeXS,),
          Text(widget.pokemon!.xDescription, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
          SizedBox(height: marginSizeM,),
        ],


      ),
    );
  }

  Widget evolutionContents(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,fit: FlexFit.tight,
                child: Text("관동", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),

              Flexible(
                flex: 6,fit: FlexFit.tight,
                child: Text("#001", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),
            ],
          ),
          SizedBox(height: marginSizeXS,),
          Text(widget.pokemon!.xDescription, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
          SizedBox(height: marginSizeM,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,fit: FlexFit.tight,
                child: Text("전국", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),

              Flexible(
                flex: 6,fit: FlexFit.tight,
                child: Text("#001", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),
            ],
          ),
          SizedBox(height: marginSizeXS,),
          Text(widget.pokemon!.xDescription, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
          SizedBox(height: marginSizeM,),
        ],


      ),
    );
  }
  Widget regionalContents(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,fit: FlexFit.tight,
                child: Text("관동", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),

              Flexible(
                flex: 6,fit: FlexFit.tight,
                child: Text("#001", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),
            ],
          ),
          SizedBox(height: marginSizeXS,),
          Text(widget.pokemon!.xDescription, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
          SizedBox(height: marginSizeM,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,fit: FlexFit.tight,
                child: Text("전국", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),

              Flexible(
                flex: 6,fit: FlexFit.tight,
                child: Text("#001", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),
            ],
          ),
          SizedBox(height: marginSizeXS,),
          Text(widget.pokemon!.xDescription, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
          SizedBox(height: marginSizeM,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,fit: FlexFit.tight,
                child: Text("관동", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),

              Flexible(
                flex: 6,fit: FlexFit.tight,
                child: Text("#001", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),
            ],
          ),
          SizedBox(height: marginSizeXS,),
          Text(widget.pokemon!.xDescription, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
          SizedBox(height: marginSizeM,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,fit: FlexFit.tight,
                child: Text("전국", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),

              Flexible(
                flex: 6,fit: FlexFit.tight,
                child: Text("#001", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),
            ],
          ),
          SizedBox(height: marginSizeXS,),
          Text(widget.pokemon!.xDescription, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
          SizedBox(height: marginSizeM,),
        ],


      ),
    );
  }
  Widget locationContents(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("1세대", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph)),
          SizedBox(height: marginSizeM,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,fit: FlexFit.tight,
                child: Text("Red", style: getBoldKrFont(Colors.red, FontSizes.paragraph),),
              ),

              Flexible(
                flex: 6,fit: FlexFit.tight,
                child: Text("2번도로, 30번도로, 31번도로, 너도밤나무숲, 자연공원아침, 자연공원 (곤충채집 대회), 고동마을, 너도밤나무숲, 분노의 호수, 26번도로, 27번도로, 34번도로, 35번도로, 36번도로, 37번도로, 38번도로, 39번도로 (박치기)", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),
            ],
          ),
          SizedBox(height: marginSizeM,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,fit: FlexFit.tight,
                child: Text("Green", style: getBoldKrFont(Colors.green, FontSizes.paragraph),),
              ),

              Flexible(
                flex: 6,fit: FlexFit.tight,
                child: Text("2번도로, 30번도로, 31번도로, 너도밤나무숲, 자연공원아침, 자연공원 (곤충채집 대회), 고동마을, 너도밤나무숲, 분노의 호수, 26번도로, 27번도로, 34번도로, 35번도로, 36번도로, 37번도로, 38번도로, 39번도로 (박치기)", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
              ),
            ],
          ),
          SizedBox(height: marginSizeM,),
          Text("2세대", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph)),
          SizedBox(height: marginSizeS,),
          Text("금", style: getBoldKrFont(Colors.amber, FontSizes.paragraph)),
          SizedBox(height: marginSizeXS,),
          Text("2번도로, 30번도로, 31번도로, 너도밤나무숲, 자연공원아침, 자연공원 (곤충채집 대회), 고동마을, 너도밤나무숲, 분노의 호수, 26번도로, 27번도로, 34번도로, 35번도로, 36번도로, 37번도로, 38번도로, 39번도로 (박치기)", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
          SizedBox(height: marginSizeM,),
          Text("은", style: getBoldKrFont(AppColors.fontColorGrey, FontSizes.paragraph)),
    SizedBox(height: marginSizeXS,),
          Text("2번도로, 30번도로, 31번도로, 너도밤나무숲, 자연공원아침, 자연공원 (곤충채집 대회), 고동마을, 너도밤나무숲, 분노의 호수, 26번도로, 27번도로, 34번도로, 35번도로, 36번도로, 37번도로, 38번도로, 39번도로 (박치기)", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),

          SizedBox(height: marginSizeM,),
        ],


      ),
    );
  }

  Widget pokemonInfoTitle(String title){
    return Container(
      child: Text(title, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h2),),
      width: double.infinity,height: 60,alignment: Alignment.centerLeft,
    );
  }
}

class PokemonInfoCard extends StatefulWidget {
  PokemonInfoCard({required this.titleWidget, required this.contentsWidget});
  
  final titleWidget;
  final contentsWidget;
  
  @override
  _PokemonInfoCardState createState() => _PokemonInfoCardState();
}

class _PokemonInfoCardState extends State<PokemonInfoCard> {
  bool isOpened = false;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isOpened = !isOpened;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [Shadows.whiteBackgroundShadow],
            color: AppColors.backgroundColorWhite
        ),padding: EdgeInsets.only(left: 24, right: 24),
        child: AnimatedCrossFade(firstChild: widget.titleWidget,
            secondChild: Column(
          children: [
            widget.titleWidget,
            widget.contentsWidget,
          ],
        ),
            crossFadeState: isOpened == false ? CrossFadeState.showFirst : CrossFadeState.showSecond, duration: Duration(milliseconds: 500)),
      ),
    );
  }
}




