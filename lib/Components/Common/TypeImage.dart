import 'package:flutter/material.dart';
import 'package:pokemon_guides_app/Datas/PokemonTypes.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/images.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/textStyles.dart';

class TypeImage extends StatelessWidget {
  TypeImage(this.typeName);
  final String typeName;

  @override
  Widget build(BuildContext context) {
    switch(typeName){
      case "Electric":return TypeImages.electric;
      case "Bug":return TypeImages.bug;
      case "Dark":return TypeImages.dark;
      case "Fairy":return TypeImages.fairy;
      case "Fighting":return TypeImages.fighting;
      case "Fire":return TypeImages.fire;
      case "Flying":return TypeImages.flying;
      case "Ghost":return TypeImages.ghost;
      case "Grass":return TypeImages.grass;
      case "Ground":return TypeImages.ground;
      case "Ice":return TypeImages.ice;
      case "Normal":return TypeImages.normal;
      case "Poison":return TypeImages.poison;
      case "Psychic":return TypeImages.psychic;
      case "Rock":return TypeImages.rock;
      case "Steel":return TypeImages.steel;
      case "Water":return TypeImages.water;
    }

    return Icon(Icons.adb);
  }
}


class TypeTextBox extends StatelessWidget {
  TypeTextBox(this.type);
  final PokemonTypes type;

  @override
  Widget build(BuildContext context) {

    return Container(

      child: Text(type.value, style: getBoldKrFont(AppColors.fontColorWhite, FontSizes.paragraph),),
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: typeColor(type),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }


  Color typeColor(PokemonTypes pokemonType) {
    switch(pokemonType){
      case PokemonTypes.grass:
        return TypeColors.lightGreen;

      case PokemonTypes.bug:
        return TypeColors.lightTeal;

      case PokemonTypes.fire:
        return TypeColors.lightRed;

      case PokemonTypes.water:
        return TypeColors.blue;

      case PokemonTypes.fighting:
        return TypeColors.red;

      case PokemonTypes.normal:
        return TypeColors.beige;

      case PokemonTypes.electric:
        return TypeColors.lightYellow;

      case PokemonTypes.psychic:
        return TypeColors.lightPink;

      case PokemonTypes.poison:
        return TypeColors.lightPurple;

      case PokemonTypes.ghost:
        return TypeColors.purple;

      case PokemonTypes.ground:
        return TypeColors.lightBrown;

      case PokemonTypes.rock:
        return TypeColors.darkBrown;

      case PokemonTypes.dark:
        return TypeColors.black;

      case PokemonTypes.dragon:
        return TypeColors.violet;

      case PokemonTypes.fairy:
        return TypeColors.pink;

      case PokemonTypes.flying:
        return TypeColors.lilac;

      case PokemonTypes.ice:
        return TypeColors.lightCyan;

      case PokemonTypes.steel:
        return TypeColors.grey;

      default:
        return TypeColors.teal;
    }

    return Colors.white;
  }
}
