import 'package:get/get.dart';
import 'package:pokemon_guides_app/JsonDecoders/JsonPokemonModel.dart';
import 'package:pokemon_guides_app/JsonDecoders/PokemonJsonDecoder.dart';

class Data{
  static final DataSource dataSource = DataSource();
  static List<PokemonModel>? pokemonList;

  static Future<void> initData() async {
    pokemonList = await dataSource.getPokemons();
  }
}