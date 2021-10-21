import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Components/Common/titles.dart';
import 'package:pokemon_guides_app/Theme/box_decoration.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/edge_insets.dart';
import 'package:pokemon_guides_app/Theme/images.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/text_styles.dart';

class FilteringView extends StatefulWidget {
  @override
  _FilteringViewState createState() => _FilteringViewState();
}

class Controller extends GetxController{
  bool holdItems = true;
  bool pokeballs = true;
  bool battleItems = true;
  bool berries = true;
  bool medicines = true;
  bool generalItems = true;

  void checkHoldItems(){
    holdItems = !holdItems;
  }
  void checkPokeballs(){
    pokeballs = !pokeballs;
  }
  void checkBattleItems(){
    battleItems = !battleItems;
    update();
  }
  void checkBerries(){
    berries = !berries;
  }
  void checkMedicines(){
    medicines = !medicines;
  }
  void checkGeneralItems(){
    generalItems = !generalItems;
  }
}

class _FilteringViewState extends State<FilteringView> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(elevation: 0,),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: MarginSizes.block,),
                Titles.h2("카테고리"),

                Padding(
                  padding: AppEdgeInsets.sideEdgeInsets,
                  child: Column(
                    children: [
                      SizedBox(height: MarginSizes.s,),
                      Row(
                        children: [
                          filterButton("All", AppImages.itemsButton),

                        ],
                      ),
                      SizedBox(height: MarginSizes.s,),
                      Row(
                        children: [
                          filterButton("Hold Items", AppImages.itemsButton),
                          SizedBox(width: MarginSizes.s,),
                          filterButton("Pokeballs", AppImages.itemsButton)
                        ],
                      ),
                      SizedBox(height: MarginSizes.s,),
                      Row(
                        children: [
                          filterButton("Battle Items", AppImages.itemsButton),
                          SizedBox(width: MarginSizes.s,),
                          filterButton("Berries", AppImages.itemsButton)
                        ],
                      ),
                      SizedBox(height: MarginSizes.s,),
                      Row(
                        children: [
                          filterButton("Medicines", AppImages.itemsButton),
                          SizedBox(width: MarginSizes.s,),
                          filterButton("General Items", AppImages.itemsButton)
                        ],
                      )
                    ],
                  ),
                )
              ]

            ),
          ),
          Container(
            color: AppColors.brandColor,alignment: Alignment.center,
            height: 80,width: double.infinity, padding: EdgeInsets.only(bottom: MarginSizes.m),
            child: Text(
              "필터 적용",style: getBoldKrFont(AppColors.fontColorWhite, FontSizes.h3),
            ),
          )
        ],
      ),
    );
  }

  Widget filterButton(String title, Widget image){
    return GetBuilder<Controller>(
      builder: (_) {
        return GestureDetector(
          onTap: (){
            Get.find<Controller>().checkBattleItems();
          },
          child: Container(
            height: 60,width: (Get.width - MarginSizes.side * 2 - MarginSizes.s) / 2,
            decoration: _.battleItems ? BoxDecorations.ghostButton : BoxDecorations.outlineButton,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: MarginSizes.m,),
                Container(
                    width: 30, height: 30,
                    child: image
                ),
                SizedBox(width: MarginSizes.m,),
                Text(title)
              ],
            ),
          ),
        );
      },
    );


  }
}

