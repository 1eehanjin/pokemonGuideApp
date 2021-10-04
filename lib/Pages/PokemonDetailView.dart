import 'dart:ui';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      Container(margin: EdgeInsets.only(left: 24, right: 24),
        //margin: EdgeInsets.only(left: 24, right: 24),
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


            StaggerDemo(title:  TitleButton("능력치"), contents: PokedexNumber(),),
            SizedBox(height: marginSizeM,),
            StaggerDemo(title:  TitleButton("방어 상성"), contents: PokedexNumber(),),
            SizedBox(height: marginSizeM,),
            StaggerDemo(title:  TitleButton("기술"), contents: PokedexNumber(),),
            SizedBox(height: marginSizeM,),
            StaggerDemo(title:  TitleButton("진화 및 모습"), contents: PokedexNumber(),),
            SizedBox(height: marginSizeM,),
            StaggerDemo(title:  TitleButton("도감별 설명"), contents: PokedexNumber(),),
            SizedBox(height: marginSizeM,),
            StaggerDemo(title:  TitleButton("출현 장소"), contents: PokedexNumber(),)

          ],
        ),
      );
  }
  Widget TypeIcon(String typeName){
    return Container(
        height: 20, width: 20,
        child: Image.asset("assets/images/Electric.png")
    );
  }
  
  Widget PokedexNumber(){
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
  
  Widget TitleButton(String title){
    return Container(
      child: Text(title, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h2),),
      width: double.infinity,height: 60,alignment: Alignment.centerLeft,
    );
  }
}



class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key? key, required this.controller, required this.title, required this.contents})
      :
        height = Tween<double>(begin: 60.0, end: 400.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.0,
              0.5,
              curve: Curves.ease,
            ),
          ),
        ),
        opacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.5,
              1.0,
              curve: Curves.ease,
            ),
          ),
        ),
        // padding = EdgeInsetsTween(
        //   begin: const EdgeInsets.only(bottom: 16.0),
        //   end: const EdgeInsets.only(bottom: 75.0),
        // ).animate(
        //   CurvedAnimation(
        //     parent: controller,
        //     curve: const Interval(
        //       0.250,
        //       0.375,
        //       curve: Curves.ease,
        //     ),
        //   ),
        // ),

        super(key: key);

  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> height;
  final Widget title;
  final Widget contents;
  bool visibility =false;
  //final Animation<EdgeInsets> padding;

  // This function is called each time the controller "ticks" a new frame.
  // When it runs, all of the animation's values will have been
  // updated to reflect the controller's current value.
  Widget _buildAnimation(BuildContext context, Widget? child) {
    visibility = !visibility;
    return Container(

      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        height: height.value,clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColors.backgroundColorWhite,
          boxShadow: [Shadows.whiteBackgroundShadow],
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            title,
            Opacity(
                opacity: opacity.value,
                child: contents
                ),
          ],
        ),
        ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class StaggerDemo extends StatefulWidget {
  StaggerDemo({Key? key, required this.title, required this.contents}){

  }

  final Widget title;
  final Widget contents;
  @override
  _StaggerDemoState createState() => _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final timeDilation = 10.0;
  bool isOpened = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 450), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  Future<void> _reverseAnimation() async {
    try {
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }
  @override
  Widget build(BuildContext context) {
     // 1.0 is normal animation speed.
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        isOpened = !isOpened;
        isOpened ? _reverseAnimation(): _playAnimation() ;
      },
      child: Container(
        width: double.infinity,


        child: StaggerAnimation(controller: _controller.view, title: widget.title,contents: widget.contents, ),
      ),
    );
  }
}