import 'dart:convert';
import 'package:pokemon_guides_app/Core/network.dart';

import 'JsonPokemonModel.dart';


class GithubDataSource {
  static const String url =
      'https://raw.githubusercontent.com/1eehanjin/1eehanjin.github.io/main/_posts/pokemons.json';

  GithubDataSource(this.networkManager);

  final NetworkManager networkManager;

  Future<List<GithubPokemonModel>> getPokemons() async {
    final response = await networkManager.request(RequestMethod.get, url);

    final data = (json.decode(response.data) as List)
        .map((item) => GithubPokemonModel.fromJson(item))
        .toList();

    return data;
  }
}