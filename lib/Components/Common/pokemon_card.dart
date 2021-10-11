import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:pokemon_guides_app/JsonDecoders/JsonPokemonModel.dart';
import 'package:pokemon_guides_app/Pages/PokemonDetailView.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/shadows.dart';
import 'package:pokemon_guides_app/Theme/textStyles.dart';

import 'TypeImage.dart';

class PokemonCard extends StatelessWidget {
  PokemonCard({Key? key, required this.pokemon}) : super(key: key);
  PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }

}
