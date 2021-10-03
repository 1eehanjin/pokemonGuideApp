import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Components/Common/GlobalSearchBar.dart';
import 'package:pokemon_guides_app/Components/Common/TypeImage.dart';
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
                  return pokemonCard(Data.pokemonList![index]);
                },
              ),
              )

        ],
      ),
    );
  }
  Widget pokemonCard(PokemonModel pokemon){
    return MaterialButton(
      padding: EdgeInsets.all(0),
      child: Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 10),
          decoration: BoxDecoration(

            boxShadow: [
              Shadows.whiteBackgroundShadow
            ]
              ,
              borderRadius: BorderRadius.circular(15),


              color: AppColors.backgroundColorWhite
          ),
          width: 180, height: 140,
          child: Stack(
            children: [
              Positioned(child: Text(pokemon.id, style: getBoldKrFont(AppColors.fontColorGrey, 14),), left: 20, top:16,),
              Positioned(
                  right: 10,bottom: 30,
                  child: Container(
                      height: 100, width: 100,
                      child: Hero(
                        tag: pokemon.name,
                          child: CachedNetworkImage(imageUrl: pokemon.imageUrl)
                      )
                  )
              ),
              Positioned(child: Text(pokemon.name, style: getBoldKrFont(AppColors.fontColorBlack, 16),), left: 20, bottom: 16,),
              Positioned(child: Row(
                  children: [
                    Container(
                      height: 20, width: 20,
                      child: TypeImage(pokemon.types![0])
                    ),
                    Container(
                        height: 20, width: 20,
                        child: pokemon.types!.length > 1 ?TypeImage(pokemon.types![1]) : Container()
                    )
                  ]
                ), left: 20, bottom: 50,
              ),
            ],
          )
      ),
      onPressed: (){
        Get.to(PokemonDetailView(), arguments: pokemon);
      },
    );
  }
  Widget TypeIcon(String typeName){
    return Container(
        height: 20, width: 20,
        child: Image.asset("assets/images/Electric.png")
    );
  }
}
