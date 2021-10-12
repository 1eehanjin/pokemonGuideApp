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
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/shadows.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/textStyles.dart';
import 'package:shadowed_image/shadowed_image.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'PokemonListView.dart';


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
      body: PokemonInfo(pokemon),
    );


  }

}

class PokemonInfo extends StatefulWidget {
  @override
  _PokemonInfoState createState() => _PokemonInfoState();

  PokemonModel? pokemon;
  PokemonInfo(this.pokemon){

  }
}

class _PokemonInfoState extends State<PokemonInfo> {
  bool numberState = false;
  
  @override
  Widget build(BuildContext context) {
    return
      CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 5,
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 400.0,
            shadowColor:AppColors.shadowColorWhiteBackground,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              title: Text(widget.pokemon!.name, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h2)),
              background: Container(
                child: Hero(
                  tag: widget.pokemon!.name,
                  child: Container(margin: EdgeInsets.all(70),

                    child: CachedNetworkImage(
                      fit: BoxFit.contain,

                      imageUrl: widget.pokemon!.imageUrl,

                    ),
                  ),
                ),
              ),

            ),
          ),
          SliverList(delegate: SliverChildListDelegate(
            [Container(
              margin: EdgeInsets.only(left: 24, right: 24),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [


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
                                    RichText(
                                      text: TextSpan(
                                          text: widget.pokemon!.abilities![0],
                                          style:getBoldKrFont(Colors.blue, FontSizes.paragraph),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = (){
                                              Get.bottomSheet(

                                                DraggableScrollableSheet(
                                                    initialChildSize: 0.4,
                                                    minChildSize: 0.4, maxChildSize: 0.9,

                                                    builder: (_, controller) {
                                                      return Container(
                                                        decoration: BoxDecoration(
                                                            color: AppColors.backgroundColorWhite,
                                                            borderRadius: BorderRadius.only(

                                                                topRight: Radius.circular(15), topLeft: Radius.circular(15)
                                                            )),
                                                        child: SingleChildScrollView(

                                                          controller: controller,
                                                          child: Container(


                                                            width: double.infinity,

                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                SizedBox(height: marginSizeBlock,),
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: marginSizeSide, right: marginSizeSide, top: marginSizeM),
                                                                  child: Text(widget.pokemon!.abilities![0], style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h1),),
                                                                ),
                                                                SizedBox(height: marginSizeM,),
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: marginSizeSide, right: marginSizeSide),
                                                                  child: Text("HP가 1/3 이하일 때 풀 타입 기술의 위력이 1.5배가 된다.", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                                                ),
                                                                SizedBox(height: marginSizeBlock,),
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: marginSizeSide, right: marginSizeSide),
                                                                  child: Text("이 특성을 가진 포켓몬", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h3),),
                                                                ),
                                                                SizedBox(height: marginSizeM,),
                                                                GridView.builder(


                                                                  padding: EdgeInsets.only(left: marginSizeSide-5, right: marginSizeSide-5),
                                                                  physics: NeverScrollableScrollPhysics(),
                                                                  shrinkWrap: true,
                                                                  itemCount: 10,
                                                                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount: 2,
                                                                    childAspectRatio: 18/14,
                                                                  ),
                                                                  itemBuilder: (BuildContext context, int index) {
                                                                    return GestureDetector(

                                                                        onTap: (){
                                                                          Get.back();
                                                                          setState(() {
                                                                            widget.pokemon = Data.pokemonList![index];
                                                                          });},
                                                                        child: PokemonCard(pokemon: Data.pokemonList![index])
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                isScrollControlled: true,



                                              );

                                            }),
                                    ),

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
                  PokemonInfoCard(titleWidget:  pokemonInfoTitle("기술"), contentsWidget: moveContents(),),
                  SizedBox(height: marginSizeM,),
                  PokemonInfoCard(titleWidget:  pokemonInfoTitle("진화 및 모습"), contentsWidget: evolutionContents(),),
                  SizedBox(height: marginSizeM,),
                  PokemonInfoCard(titleWidget:  pokemonInfoTitle("도감별 설명"), contentsWidget: regionalContents(),),

                  SizedBox(height: marginSizeM,),
                  PokemonInfoCard(titleWidget:  pokemonInfoTitle("출현 장소"), contentsWidget: locationContents(),),
                  SizedBox(height: marginSizeBlock,),
                ],
              ),
            ),]
          ))
          ]
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
          SizedBox(height: marginSizeS,),
          Wrap(
            alignment: WrapAlignment.start,spacing: marginSizeXS,runSpacing: marginSizeXS,
            children: [
              TypeTextBox("Electric"),TypeTextBox("Bug"),TypeTextBox("Ground"),TypeTextBox("Dark"),TypeTextBox("Fairy"),TypeTextBox("Fire"),
          ],),
          SizedBox(height: marginSizeM,),

        ],


      ),
    );
  }
  Widget moveContents(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(spacing: marginSizeS,
            children: [
            ChoiceChip(label: Text("1세대"), selected: true,),ChoiceChip(label: Text("2세대"), selected: false),ChoiceChip(label: Text("3세대"), selected: false),ChoiceChip(label: Text("4세대"), selected: false),ChoiceChip(label: Text("1세대"), selected: false),ChoiceChip(label: Text("1세대"), selected: false),ChoiceChip(label: Text("1세대"), selected: false),ChoiceChip(label: Text("1세대"), selected: false),
          ],),
        SizedBox(height: marginSizeM,),
          Text("1세대 : 레드, 블루, 그린", style: getBoldKrFont(AppColors.fontColorGrey, FontSizes.h4)),
          SizedBox(height: marginSizeM,),
        Text("레벨업으로 배우는 기술", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph)),
          SizedBox(height: marginSizeS,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(child: Text("4", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph)),  fit: FlexFit.tight,flex: 2, ),
              Flexible(child: Container(
                alignment: Alignment.centerLeft,
                  child: Chip(label: Text("몸통박치기",  style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph)))), flex: 4,fit: FlexFit.tight, ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(child: Text("4", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph)),  fit: FlexFit.tight,flex: 2, ),
              Flexible(child: Container(
                  alignment: Alignment.centerLeft,
                  child: Chip(label: Text("몸통박치기",  style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph)))), flex: 4,fit: FlexFit.tight, ),
            ],
          ),
          SizedBox(height: marginSizeM,),
          Text("기술/비전머신으로 배우는 기술", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph)),
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
          evolutionPokemonCard(widget.pokemon!.name),
          SizedBox(height: marginSizeXS,),

        ],


      ),
    );
  }

  Widget evolutionPokemonCard(String pokemonName){

    PokemonModel? pokemon = Data.pokemonMap[pokemonName];
    print(pokemon);
    if(pokemon == null){
      return Container();
    }
    return Container(
      height: 200,
      child: Row(
        children: [
          Flexible(
            flex: 2,fit: FlexFit.tight,
            child: Text(pokemon.name, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
          ),

          Flexible(
            flex: 2,fit: FlexFit.tight,
            child: Text(pokemon.id, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
          ),

          Flexible(
              flex: 2,fit: FlexFit.tight,
              child:
              CachedNetworkImage(
                imageUrl: pokemon.imageUrl,
              )

          )
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




