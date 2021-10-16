import 'package:flutter/material.dart';
import 'package:pokemon_guides_app/Components/MyHomePage/guide_element_button.dart';
import 'package:pokemon_guides_app/Pages/item_list_view.dart';
import 'package:pokemon_guides_app/Pages/pokemon_list_view.dart';
import 'package:pokemon_guides_app/Theme/edge_insets.dart';
import 'package:pokemon_guides_app/Theme/images.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';

class GuideButtonsGrid extends StatelessWidget {
  const GuideButtonsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      padding: AppEdgeInsets.listEdgeInsets,
      mainAxisSpacing: MarginSizes.m,crossAxisSpacing: MarginSizes.block,childAspectRatio:2/3,
      crossAxisCount: 3,shrinkWrap: true, //TODO: 적응형으로 그리드뷰 원소 갯수 바꾸기
      children: [
        GuideElementButton(title: "포켓몬",page: PokemonListView(),image: AppImages.pokemonsButton),
        GuideElementButton(title: "기술", page: PokemonListView(), image: AppImages.movesButton,),
        GuideElementButton(title: "아이템", page: ItemListView(), image: AppImages.itemsButton,),
        //TODO: 속성, 지도, 내 정보 추가
      ],
    );
  }
}
