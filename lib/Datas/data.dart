import 'package:get/get.dart';
import 'package:pokemon_guides_app/JsonDecoders/move_model.dart';
import 'package:pokemon_guides_app/JsonDecoders/pokemon_model.dart';
import 'package:pokemon_guides_app/JsonDecoders/data_json_decoder.dart';
import 'package:pokemon_guides_app/JsonDecoders/item_model.dart';

class Data{
  static final DataSource dataSource = DataSource();
  static List<PokemonModel>? pokemonList;
  static List<ItemModel>? itemList;
  static List<MoveModel>? moveList;
  static Map<String, ItemModel> itemMap = {};
  static Map<String, PokemonModel> pokemonMap = {};
  static Map<String ,MoveModel> moveMap = {};
  static Future<void> initData() async {
    pokemonList = await dataSource.getPokemons();
    itemList = await dataSource.getItems();
    moveList = await dataSource.getMoves();


    for (ItemModel item in itemList!){
      itemMap[item.name] = item;
    }

    for (PokemonModel pokemon in pokemonList!){
      pokemonMap[pokemon.name] = pokemon;
    }

    for (MoveModel move in moveList!){
      moveMap[move.name] = move;
    }
  }
}