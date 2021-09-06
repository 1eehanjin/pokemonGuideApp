import 'package:flutter/material.dart';
import 'package:pokemon_guides_app/Components/Common/GlobalSearchBar.dart';

class PokemonListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height:24),
          GlobalSearchBar(),
          Expanded(
              child: ListView(
                children: [
                  ListTile(title: Text('1'))
                ],
              )
          )
        ],
      ),
    );
  }
}
