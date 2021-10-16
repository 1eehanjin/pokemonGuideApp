
import 'package:flutter/material.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/edge_insets.dart';
import 'package:pokemon_guides_app/Theme/shadows.dart';

class GlobalSearchBar extends StatefulWidget {
  const GlobalSearchBar({Key? key}) : super(key: key);

  @override
  _GlobalSearchBarState createState() => _GlobalSearchBarState();
}

class _GlobalSearchBarState extends State<GlobalSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppEdgeInsets.sideEdgeInsets,
      decoration: BoxDecoration(
        color: AppColors.backgroundColorWhite,
        borderRadius: BorderRadius.circular(10),
          boxShadow: [
            Shadows.whiteBackgroundShadow
          ]
      ),
      
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: TextField(
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              icon: Icon(Icons.search,),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              labelText: 'Global Search...'
          ),
        ),
      ),
    );
  }
}
