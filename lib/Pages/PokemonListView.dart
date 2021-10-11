import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Components/Common/GlobalSearchBar.dart';
import 'package:pokemon_guides_app/Components/Common/TypeImage.dart';
import 'package:pokemon_guides_app/Components/Common/pokemon_card.dart';
import 'package:pokemon_guides_app/Datas/Data.dart';
import 'package:pokemon_guides_app/JsonDecoders/JsonPokemonModel.dart';
import 'package:pokemon_guides_app/JsonDecoders/PokemonJsonDecoder.dart';
import 'package:pokemon_guides_app/Pages/PokemonDetailView.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/shadows.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/textStyles.dart';

class PokemonListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex",style: getBoldKrFont(AppColors.fontColorBlack, 20),),
      ),
      body: Column(
        children: [
          SizedBox(height:24),
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.only(left: marginSizeSide-5, right: marginSizeSide-5),
                shrinkWrap: true,
                itemCount: Data.pokemonList!.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(

                  crossAxisCount: 2,
                  childAspectRatio: 18/14,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(child: PokemonCard(pokemon: Data.pokemonList![index]),
                    onTap: (){
                      Get.to(PokemonDetailView(), arguments: Data.pokemonList![index], transition: Transition.fade);
                    },

                  );
                },
              ),
              )

        ],
      ),
    );
  }


}
