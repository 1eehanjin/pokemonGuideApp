import 'dart:ui';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Components/Common/type_image.dart';
import 'package:pokemon_guides_app/Components/Common/pokemon_card.dart';
import 'package:pokemon_guides_app/Components/Common/stats_bar_chart.dart';
import 'package:pokemon_guides_app/Datas/data.dart';
import 'package:pokemon_guides_app/Datas/pokemon_type.dart';
import 'package:pokemon_guides_app/JsonDecoders/pokemon_model.dart';
import 'package:pokemon_guides_app/Theme/box_decoration.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/edge_insets.dart';
import 'package:pokemon_guides_app/Theme/shadows.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/text_styles.dart';
import 'package:shadowed_image/shadowed_image.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'pokemon_list_view.dart';


class PokemonDetailView extends StatefulWidget {
  @override
  _PokemonDetailViewState createState() => _PokemonDetailViewState();
}

class _PokemonDetailViewState extends State<PokemonDetailView> {
  PokemonModel? pokemon;

  @override
  void initState() {
    super.initState();
    pokemon = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundColorLight,
      body: CustomScrollView(
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
                title: Text(pokemon!.name, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h2)),
                background: Container(
                  color: AppColors.backgroundColorLight,
                  child: Hero(
                    tag: pokemon!.name,
                    child: Container(
                      margin: EdgeInsets.all(70),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: pokemon!.imageUrl,
                        imageBuilder: (context, imageProvider) => Container(

                          child: ShadowedImage(offset: Offset(5, 5),

                            image: Image(image: imageProvider,),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate(
                    [
                      Container(
                        margin: EdgeInsets.only(left: 24, right: 24),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecorations.lightCard,
                                padding: EdgeInsets.only(left: 24, right: 24),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: MarginSizes.m,),
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
                                              Text("Abilities", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                              SizedBox(height: MarginSizes.m),
                                              Text("Species", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                              SizedBox(height: MarginSizes.m),
                                              Text("Height", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                              SizedBox(height: MarginSizes.m),
                                              Text("Weight", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                              SizedBox(height: MarginSizes.m),
                                              Text("Gender", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                              SizedBox(height: MarginSizes.m),
                                              Text("base EXP", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                              SizedBox(height: MarginSizes.m),
                                              Text("egg groups", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                              SizedBox(height: MarginSizes.m),
                                              Text("egg cycles", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
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
                                              Row(
                                                  children: [
                                                    TypeTextBox(pokemon!.types![0] ),
                                                    SizedBox(width: MarginSizes.xs,),
                                                    pokemon!.types!.length > 1 ?TypeTextBox(pokemon!.types![1]) : Container()
                                                  ]
                                              ),
                                              SizedBox(height: MarginSizes.m),
                                              RichText(
                                                text: TextSpan(
                                                    text: pokemon!.abilities![0],
                                                    style:getBoldKrFont(Colors.blue, FontSizes.paragraph),
                                                    recognizer: TapGestureRecognizer()
                                                      ..onTap = (){
                                                        // TODO: sliding sheet 로 변경
                                                        Get.bottomSheet(
                                                            DraggableScrollableSheet(
                                                                initialChildSize: 0.6,
                                                                minChildSize: 0.4, maxChildSize: 1,

                                                                builder: (_, controller) {
                                                                  return Container(
                                                                    decoration: BoxDecorations.lightCard,
                                                                    child: SingleChildScrollView(

                                                                      controller: controller,
                                                                      child: Container(


                                                                        width: double.infinity,

                                                                        child: Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            SizedBox(height: MarginSizes.block,),
                                                                            Padding(
                                                                              padding: EdgeInsets.only(left: MarginSizes.side, right: MarginSizes.side, top: MarginSizes.m),
                                                                              child: Text(pokemon!.abilities![0], style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h1),),
                                                                            ),
                                                                            SizedBox(height: MarginSizes.m,),
                                                                            Padding(
                                                                              padding: EdgeInsets.only(left: MarginSizes.side, right: MarginSizes.side),
                                                                              child: Text("HP가 1/3 이하일 때 풀 타입 기술의 위력이 1.5배가 된다.", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                                                            ),
                                                                            SizedBox(height: MarginSizes.block,),
                                                                            Padding(
                                                                              padding: EdgeInsets.only(left: MarginSizes.side, right: MarginSizes.side),
                                                                              child: Text("이 특성을 가진 포켓몬", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h3),),
                                                                            ),
                                                                            SizedBox(height: MarginSizes.m,),
                                                                            GridView.builder(


                                                                              padding: EdgeInsets.only(left: MarginSizes.side-5, right: MarginSizes.side-5),
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
                                                                                        pokemon = Data.pokemonList![index];
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
                                                            isScrollControlled: false,
                                                            isDismissible: true,
                                                            enableDrag: true



                                                        );

                                                      }),
                                              ),

                                              SizedBox(height: MarginSizes.m),
                                              Text(pokemon!.category, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                              SizedBox(height: MarginSizes.m),
                                              Text(pokemon!.height, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                              SizedBox(height: MarginSizes.m),
                                              Text(pokemon!.weight, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                              SizedBox(height: MarginSizes.m),
                                              Text(pokemon!.genderFemalePercentage, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                              SizedBox(height: MarginSizes.m),
                                              Text(pokemon!.baseExp, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                              SizedBox(height: MarginSizes.m),
                                              Text(pokemon!.eggGroups, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                              SizedBox(height: MarginSizes.m),
                                              Text(pokemon!.cycles, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                                              SizedBox(height: MarginSizes.m),

                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                )
                            ),
                            SizedBox(height: MarginSizes.m,),
                            PokemonInfoCard(title:  "능력치", contentsWidget: statusContents(),),
                            SizedBox(height: MarginSizes.m,),
                            PokemonInfoCard(title: "방어 상성", contentsWidget: typeContents(),),
                            SizedBox(height: MarginSizes.m,),
                            PokemonInfoCard(title: "기술", contentsWidget: moveContents(),),
                            SizedBox(height: MarginSizes.m,),
                            PokemonInfoCard(title: "진화 및 모습", contentsWidget: formContents(),),
                            SizedBox(height: MarginSizes.m,),
                            PokemonInfoCard(title: "도감별 설명", contentsWidget: regionalContents(),),
                            SizedBox(height: MarginSizes.m,),
                            PokemonInfoCard(title: "출현 장소", contentsWidget: locationContents(),),
                            SizedBox(height: MarginSizes.block,),
                          ],
                        ),
                      ),
                    ]
                )
            )
          ]
      ),
    );


  }


  Widget statusContents(){


    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MarginSizes.m,),
          PokemonBaseStats(pokemon)
        ],


      ),
    );
  }

  Widget typeContents(){

    List<PokemonTypes> pokemonTypes = [];
    Map<PokemonTypes, double> pokemonEffectiveness= {};
    List<PokemonTypes> veryWeakTypes = [];
    List<PokemonTypes> weakTypes = [];
    List<PokemonTypes> normalTypes = [];
    List<PokemonTypes> veryResistantTypes = [];
    List<PokemonTypes> resistantTypes = [];
    List<PokemonTypes> ineffectiveTypes = [];

    for (PokemonTypes pokemonType in pokemon!.types!) {
      pokemonTypes.add(pokemonType);
    }

    PokemonTypes.values.forEach((element) {
      double effectiveness = 1;
      for (PokemonTypes pokemonType in pokemonTypes){
        effectiveness = effectiveness * (pokemonType.effectiveness?[element] ?? 1.0);
      }
      pokemonEffectiveness[element] = effectiveness;
      if(effectiveness == 4)
        veryWeakTypes.add(element);
      if(effectiveness == 2)
        weakTypes.add(element);
      if(effectiveness == 1)
        normalTypes.add(element);
      if(effectiveness == 0.5)
        resistantTypes.add(element);
      if(effectiveness == 0.25)
        veryResistantTypes.add(element);
      if(effectiveness == 0.0)
        ineffectiveTypes.add(element);
    });

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          typeContent("매우 약함", "×4",  veryWeakTypes),
          typeContent("약함", "×2", weakTypes),
          typeContent("보통", "×1", normalTypes),
          typeContent("강함", "×0.5", resistantTypes),
          typeContent("매우 강함", "×0.25", veryResistantTypes),
          typeContent("효과 없음", "×0",ineffectiveTypes)
        ],


      ),
    );
  }

  Widget typeContent(String title,String effectiveness, List<PokemonTypes> types){
    if(types.isEmpty){
      return Container();
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: double.infinity,
              child: Row(
                children: [
                  Flexible(
                    flex: 2,fit: FlexFit.tight,
                    child: Text(title, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                  ),

                  Flexible(
                    flex: 6,fit: FlexFit.tight,
                    child: Text(effectiveness, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                  ),
                ],
              )),
          SizedBox(height: MarginSizes.xs,),
          Wrap(
            alignment: WrapAlignment.start,spacing: MarginSizes.xs,runSpacing: MarginSizes.xs,
            children: [
              for (PokemonTypes pokemonType in types)
                TypeTextBox(pokemonType)
            ],),
          SizedBox(height: 24,),

        ],


      ),
    );
  }

  Widget moveContents(){
    String? _chosenValue = '1세대: 레드/블루/그린';

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MarginSizes.m,),

          GestureDetector(
            child: Container(
              width: double.infinity,

              height: 60,alignment: Alignment.center,
              decoration: BoxDecoration(
                //color: AppColors.backgroundColorLightGrey,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.blue
                  )
              ),
              child: Text("1세대: 레드/블루/그린", style: getBoldKrFont(Colors.blue, FontSizes.h4) ),
            ),

          ),
          SizedBox(height: MarginSizes.l,),
          Text("레벨업으로 배우는 기술", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph)),
          SizedBox(height: MarginSizes.m,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(child: Text("Lv. 4", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph)),  fit: FlexFit.tight,flex: 2, ),
              Flexible(
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
              )
            ],
          ),

          SizedBox(height: MarginSizes.m,),
          Text("기술/비전머신으로 배우는 기술", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph)),
          SizedBox(height: MarginSizes.m,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(child: Text("TM01", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph)),  fit: FlexFit.tight,flex: 2, ),
              Flexible(
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
              )
            ],
          ),
          SizedBox(height: MarginSizes.m,),
        ],


      ),
    );
  }

  Widget formContents(){
    return Column(
      children: [
        SizedBox(width: MarginSizes.m,),
        evolutionContents()
      ],
    );
  }

  Widget evolutionContents(){

    List<String>? evolutionPokemonList = pokemon!.evolutions;
    if(evolutionPokemonList!.length == 0){
      return Container();
    }

    return ListView.builder(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
      itemCount: evolutionPokemonList.length,
      itemBuilder: (context, index){
        PokemonModel? pokemon = Data.pokemonMap[evolutionPokemonList[index]];
        return Container(
          margin: EdgeInsets.only(bottom: MarginSizes.m),
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(

                imageUrl: pokemon!.imageUrl,
                width: 100, height: 100,
              ),
              SizedBox(width: MarginSizes.m,),
              Expanded(

                child: Container(
                  height: 100,
                  //color: AppColors.backgroundColorLightGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(pokemon.name, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),flex: 2,),
                          Expanded(child: Text(pokemon.id, style: getRegularKrFont(AppColors.fontColorGrey, FontSizes.paragraph),), flex: 1),
                        ],
                      ),
                      Text("16레벨에 진화", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
                    ],
                  ),
                ),
              ),




            ],
          ),
        );
      },

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
          SizedBox(height: MarginSizes.xs,),
          Text(pokemon!.xDescription, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
          SizedBox(height: MarginSizes.m,),
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
          SizedBox(height: MarginSizes.xs,),
          Text(pokemon!.xDescription, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
          SizedBox(height: MarginSizes.m,),
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
          SizedBox(height: MarginSizes.xs,),
          Text(pokemon!.xDescription, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
          SizedBox(height: MarginSizes.m,),
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
          SizedBox(height: MarginSizes.xs,),
          Text(pokemon!.xDescription, style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
          SizedBox(height: MarginSizes.m,),
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
          SizedBox(height: MarginSizes.m,),
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
          SizedBox(height: MarginSizes.m,),
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
          SizedBox(height: MarginSizes.m,),
          Text("2세대", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph)),
          SizedBox(height: MarginSizes.s,),
          Text("금", style: getBoldKrFont(Colors.amber, FontSizes.paragraph)),
          SizedBox(height: MarginSizes.xs,),
          Text("2번도로, 30번도로, 31번도로, 너도밤나무숲, 자연공원아침, 자연공원 (곤충채집 대회), 고동마을, 너도밤나무숲, 분노의 호수, 26번도로, 27번도로, 34번도로, 35번도로, 36번도로, 37번도로, 38번도로, 39번도로 (박치기)", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),
          SizedBox(height: MarginSizes.m,),
          Text("은", style: getBoldKrFont(AppColors.fontColorGrey, FontSizes.paragraph)),
          SizedBox(height: MarginSizes.xs,),
          Text("2번도로, 30번도로, 31번도로, 너도밤나무숲, 자연공원아침, 자연공원 (곤충채집 대회), 고동마을, 너도밤나무숲, 분노의 호수, 26번도로, 27번도로, 34번도로, 35번도로, 36번도로, 37번도로, 38번도로, 39번도로 (박치기)", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph),),

          SizedBox(height: MarginSizes.m,),
        ],


      ),
    );
  }


}


class PokemonInfoCard extends StatefulWidget {
  PokemonInfoCard({required this.title, required this.contentsWidget});
  final String title;
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
        decoration: BoxDecorations.lightCard,
        padding: AppEdgeInsets.sideEdgeInsets,
        child: AnimatedCrossFade(firstChild: closedPokemonInfoTitle(widget.title),
            secondChild: Column(
              children: [
                openedPokemonInfoTitle(widget.title),
                widget.contentsWidget,
              ],
            ),
            crossFadeState: isOpened == false ? CrossFadeState.showFirst : CrossFadeState.showSecond, duration: Duration(milliseconds: 500)),
      ),
    );
  }

  Widget closedPokemonInfoTitle(String title){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h2),),
          Container(child:Icon(Icons.expand_more, color: AppColors.fontColorBlack,))
        ],
      ),
      width: double.infinity,height: 60,alignment: Alignment.centerLeft,
    );
  }

  Widget openedPokemonInfoTitle(String title){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h2),),
        ],
      ),
      width: double.infinity,height: 60,alignment: Alignment.centerLeft,
    );
  }
}




