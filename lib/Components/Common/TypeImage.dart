import 'package:flutter/material.dart';
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
  TypeTextBox(this.typeName);
  final String typeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(typeName, style: getBoldKrFont(AppColors.fontColorWhite, FontSizes.paragraph),),
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: typeColor(typeName),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }


  Color typeColor(String typeName) {
    switch(typeName){
      case "Electric":return Colors.yellow;
      case "Bug":return Colors.lightGreen;
      case "Dark":return Colors.black;
      case "Fairy":return Colors.purpleAccent;
      case "Fighting":return Colors.deepOrange;
      case "Fire":return Colors.red;
      case "Flying":return Colors.lightBlueAccent;
      case "Ghost":return Colors.deepPurple;
      case "Grass":return Colors.green;
      case "Ground":return Colors.brown;
      case "Ice":return Colors.cyanAccent;
      case "Normal":return Colors.grey;
      case "Poison":return Colors.purple;
      case "Psychic":return Colors.pinkAccent;
      case "Rock":return Colors.orange;
      case "Steel":return Colors.blueGrey;
      case "Water":return Colors.blue;
    }

    return Colors.white;
  }
}
