import 'package:flutter/material.dart';
import 'package:pokemon_guides_app/Components/Common/GlobalSearchBar.dart';
import 'package:pokemon_guides_app/JsonDecoders/PokemonJsonDecoder.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/textStyles.dart';

class PokemonListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex",style: getBoldKrFont(fontColorBlack, 20),),
      ),
      body: Column(
        children: [
          SizedBox(height:24),
          Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: marginSizeSide, right: marginSizeSide),
                    child: Wrap(runSpacing: marginSizeM,spacing: marginSizeM,
                      children: [
                        pokemonCard(),
                        pokemonCard(),
                        pokemonCard(),
                        pokemonCard(),
                        pokemonCard(),
                        pokemonCard(),
                        pokemonCard(),
                        pokemonCard(),
                        pokemonCard(),
                        pokemonCard(),
                        pokemonCard(),
                        pokemonCard(),
                        pokemonCard(),
                        pokemonCard(),
                        pokemonCard(),
                        pokemonCard()
                      ],
                    ),
                  ),
                ],
              )
          )
        ],
      ),
    );
  }

  Widget pokemonCard(){
    return Container(

        decoration: BoxDecoration(

          boxShadow: [
            BoxShadow(
              color: Color(0x180F2447),
              offset: Offset(20, 30),
              blurRadius: 70
            )
          ]
            ,
            borderRadius: BorderRadius.circular(15),


            color: backgroundColorWhite
        ),
        width: 180, height: 120,
        child: Stack(
          children: [
            Positioned(child: Text("025.", style: getBoldKrFont(fontColorGrey, 14),), left: 20, top:16,),
            Positioned(child: Text("피카츄", style: getBoldKrFont(fontColorBlack, 16),), left: 20, bottom: 16,),
            Positioned(child: Row(
                children: [
                  Container(
                    height: 20, width: 20,
                    child: Image.asset("assets/images/Electric.png")
                  ),
                  Container(
                      height: 20, width: 20,
                      child: Image.asset("assets/images/Bug.png")
                  )
                ]
              ), left: 20, bottom: 50,
            ),
            Positioned(
              right: 10,bottom: 10,
                child: Container(
                  height: 100, width: 100,
                    child: Image.asset("assets/images/pika.png")
                )

            )
          ],
        )
    );
  }
}
