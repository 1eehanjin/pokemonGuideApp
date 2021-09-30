import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/JsonDecoders/JsonPokemonModel.dart';

class PokemonDetailView extends StatefulWidget {
  @override
  _PokemonDetailViewState createState() => _PokemonDetailViewState();
}

class _PokemonDetailViewState extends State<PokemonDetailView> {
  PokemonModel? pokemon;

  @override
  Widget build(BuildContext context) {
    pokemon = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(pokemon!.name, style: TextStyle(color: Colors.black),), ),
    );
  }
}
