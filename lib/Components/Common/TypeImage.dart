import 'package:flutter/material.dart';
import 'package:pokemon_guides_app/Theme/images.dart';

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
