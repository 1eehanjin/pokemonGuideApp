import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pokemon_guides_app/Datas/Data.dart';

import 'JsonPokemonModel.dart';
import 'item_model.dart';


class DataSource {

  DataSource();


  Future<List<PokemonModel>> getPokemons() async {
    final String jsonString = await rootBundle.loadString('assets/datas/pokemons.json');
    print(jsonString);
    final jsonResponse = json.decode(jsonString);
    final data = (jsonResponse as List)
        .map((item) => PokemonModel.fromJson(item))
        .toList();
    return data;
  }

  Future<List<ItemModel>> getItems() async {
    final String jsonString = await rootBundle.loadString('assets/datas/items.json');
    print(jsonString);
    final jsonResponse = json.decode(jsonString);
    final itemData = (jsonResponse as List)
        .map((item) => ItemModel.fromJson(item))
        .toList();
    return itemData;
  }


}