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

      body: DefaultTabController(
        length: 3,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(pinned: true,centerTitle: true,
              backgroundColor: AppColors.backgroundColorWhite,
              expandedHeight: 400.0,
              flexibleSpace: FlexibleSpaceBar(centerTitle: false,
                collapseMode: CollapseMode.pin,
                title: Text(pokemon!.name, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h2)),
                background: Hero(
                  tag: pokemon!.name,
                  child: Container(
                    width: Get.width, height: 350,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        // Positioned(child:
                        //     Container(
                        //       child: WaveWidget(
                        //         config: CustomConfig(
                        //           heightPercentages: [0.45, 0.46, 0.48, 0.51],
                        //           colors: [
                        //             Colors.transparent,
                        //             Colors.transparent,
                        //             Colors.white54,
                        //             Colors.white,
                        //           ],
                        //           durations: [35000, 19440, 10800, 6000],
                        //
                        //           blur: MaskFilter.blur(BlurStyle.solid, 10),
                        //
                        //         ),
                        //         backgroundColor: Colors.red,
                        //         size: Size(double.infinity, double.infinity),
                        //
                        //         waveAmplitude: 10,
                        //       ),
                        //     )
                        // ),
                        // Positioned(left: 10,bottom: 50,
                        //   child: Transform(transform: Matrix4.skewX(1.4)..setEntry(3, 2, 0.1)..rotateX(-0.5),alignment: FractionalOffset.center,
                        //     child: Container(width: 50, height: 50,
                        //       child: ImageFiltered(imageFilter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                        //
                        //         child: Opacity( child: CachedNetworkImage(
                        //           imageUrl: pokemon!.imageUrl,color: Colors.black,
                        //
                        //         ), opacity: 0.4),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: Get.width,height: 10,decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                              color: AppColors.backgroundColorWhite,boxShadow: [Shadows.whiteBackgroundShadow]
                          ),
                          )
                          ,),
                        // Positioned(
                        //   left: 0,bottom: 50,
                        //   child: Container(
                        //     width: 250, height: 250,
                        //     child: CachedNetworkImage(
                        //         imageUrl: pokemon!.imageUrl,
                        //
                        //     ),
                        //   ),
                        // ),

                        Positioned(

                          bottom: 100,
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

              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(child: Text("정보", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h4),),),
                    Tab(child: Text("능력치", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h4),)),
                    Tab(child: Text("서식", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h4),)),
                  ],
                ),
              ),
              pinned: true,
            ),
        SliverFillRemaining(
          child: Container(
              color: AppColors.backgroundColorWhite,
              child: TabBarView(

                children: [
                  PokemonInfo(pokemon),
                  Icon(Icons.directions_transit, size: 350),
                  Icon(Icons.directions_car, size: 350),
                ],
              ),
          ),
        )
          ]


          ),
        ),

    );
    // return Scaffold(
    //     body: DefaultTabController(
    //       length: 3,
    //       child: CustomScrollView(
    //           slivers: <Widget>[

    //             SliverList(
    //                 delegate: SliverChildBuilderDelegate(
    //                       (BuildContext context, int index) {
    //                     return Container(
    //                       height: 2000
    //                     );
    //                   },
    //                   childCount: 1,
    //                 )
    //             )
    //           ]
    //       ),
    //     )
    // );
  }

}
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);
  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: AppColors.backgroundColorWhite,
      margin: EdgeInsets.only(left: 0, right: 0),
       // ADD THE COLOR YOU WANT AS BACKGROUND.
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
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
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(15),
            color: AppColors.backgroundColorWhite,

        ),
      margin: EdgeInsets.only(left:0, right: 0),
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Row(
        children: [
          Flexible(
            flex: 3,fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: marginSizeM),
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
                SizedBox(height: marginSizeM),
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

