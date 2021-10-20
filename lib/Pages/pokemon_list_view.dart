import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Components/MyHomePage/global_search_bar.dart';
import 'package:pokemon_guides_app/Components/Common/type_image.dart';
import 'package:pokemon_guides_app/Components/Common/pokemon_card.dart';
import 'package:pokemon_guides_app/Datas/data.dart';
import 'package:pokemon_guides_app/JsonDecoders/pokemon_model.dart';
import 'package:pokemon_guides_app/JsonDecoders/data_json_decoder.dart';
import 'package:pokemon_guides_app/Pages/pokemon_detail_view.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/edge_insets.dart';
import 'package:pokemon_guides_app/Theme/shadows.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/text_styles.dart';

class PokemonListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarColorLight,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
        title: Text("Pokedex"),
        bottom: PreferredSize(

          preferredSize: Size.fromHeight(70),
          child: Container(

              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.filter_alt, color: AppColors.fontColorBlack,),
                  SizedBox(width: MarginSizes.xs,),
                  Text("Search", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.h4),),
                ],
              ),
              height: 50,margin: EdgeInsets.only(left: MarginSizes.side, right: MarginSizes.side, bottom: MarginSizes.s),
              decoration: BoxDecoration(
                  boxShadow: [
                    Shadows.whiteBackgroundShadow
                  ]
                  ,
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.backgroundColorWhite
              )
          ),

        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                padding: AppEdgeInsets.listEdgeInsets,
                shrinkWrap: true,
                itemCount: Data.pokemonList!.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: MarginSizes.m,mainAxisSpacing: MarginSizes.m,
                  crossAxisCount: 2, //TODO: 적응형으로 화면 너비에 따라 갯수 늘리기
                  childAspectRatio: 18/14,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return PokemonCard(pokemon: Data.pokemonList![index]);
                },
              ),
          )
        ],
      ),
    );
  }


}
