import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Components/MyHomePage/GlobalSearchBar.dart';
import 'package:pokemon_guides_app/Components/Common/type_image.dart';
import 'package:pokemon_guides_app/Components/Common/pokemon_card.dart';
import 'package:pokemon_guides_app/Datas/data.dart';
import 'package:pokemon_guides_app/JsonDecoders/pokemon_model.dart';
import 'package:pokemon_guides_app/JsonDecoders/data_json_decoder.dart';
import 'package:pokemon_guides_app/Pages/pokemon_detail_view.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/shadows.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/text_styles.dart';

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
