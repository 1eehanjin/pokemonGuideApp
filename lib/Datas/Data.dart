import 'package:get/get.dart';
import 'package:pokemon_guides_app/JsonDecoders/JsonPokemonModel.dart';
import 'package:pokemon_guides_app/JsonDecoders/PokemonJsonDecoder.dart';
import 'package:pokemon_guides_app/JsonDecoders/item_model.dart';

class Data{
  static final DataSource dataSource = DataSource();
  static List<PokemonModel>? pokemonList;
  static List<ItemModel>? itemList;
  static Map<String, ItemModel> itemMap = {};
  static Map<String, PokemonModel> pokemonMap = {};
  static Future<void> initData() async {
    pokemonList = await dataSource.getPokemons();
    itemList = await dataSource.getItems();


    for (ItemModel item in itemList!){
      itemMap[item.name] = item;
    }

    for (PokemonModel pokemon in pokemonList!){
      pokemonMap[pokemon.name] = pokemon;
    }
  }
}