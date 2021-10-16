import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:pokemon_guides_app/JsonDecoders/pokemon_model.dart';
import 'package:pokemon_guides_app/Pages/pokemon_detail_view.dart';
import 'package:pokemon_guides_app/Theme/box_decoration.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/shadows.dart';
import 'package:pokemon_guides_app/Theme/text_styles.dart';

import 'type_image.dart';

class PokemonCard extends StatelessWidget {
  PokemonCard({Key? key, required this.pokemon}) : super(key: key);
  PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(PokemonDetailView(), arguments: pokemon, transition: Transition.fade);
      },
      child: Container(
          decoration: BoxDecorations.lightCard,
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
    );
  }

}
