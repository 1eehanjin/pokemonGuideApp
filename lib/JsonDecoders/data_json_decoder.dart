import 'dart:convert';
import 'package:flutter/services.dart';
import 'move_model.dart';
import 'pokemon_model.dart';
import 'item_model.dart';


class DataSource {

  DataSource();


  Future<List<PokemonModel>> getPokemons() async {
    final String jsonString = await rootBundle.loadString('assets/datas/pokemons.json');

    final jsonResponse = json.decode(jsonString);
    final data = (jsonResponse as List)
        .map((item) => PokemonModel.fromJson(item))
        .toList();
    return data;
  }

  Future<List<ItemModel>> getItems() async {
    final String jsonString = await rootBundle.loadString('assets/datas/items.json');
    final jsonResponse = json.decode(jsonString);
    final itemData = (jsonResponse as List)
        .map((item) => ItemModel.fromJson(item))
        .toList();
    return itemData;
  }


  Future<List<MoveModel>> getMoves() async {
    final String jsonString = await rootBundle.loadString('assets/datas/moves.json');
    final jsonResponse = json.decode(jsonString);
    final moveData = (jsonResponse as List)
        .map((item) => MoveModel.fromJson(item))
        .toList();
    return moveData;
  }
}