import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Components/Common/titles.dart';
import 'package:pokemon_guides_app/Components/MyHomePage/global_search_bar.dart';
import 'package:pokemon_guides_app/Components/Common/type_image.dart';
import 'package:pokemon_guides_app/Components/Common/item_card.dart';
import 'package:pokemon_guides_app/Components/Common/pokemon_card.dart';
import 'package:pokemon_guides_app/Datas/data.dart';
import 'package:pokemon_guides_app/JsonDecoders/pokemon_model.dart';
import 'package:pokemon_guides_app/JsonDecoders/data_json_decoder.dart';
import 'package:pokemon_guides_app/Pages/filtering_view.dart';
import 'package:pokemon_guides_app/Pages/pokemon_detail_view.dart';
import 'package:pokemon_guides_app/Theme/box_decoration.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/edge_insets.dart';
import 'package:pokemon_guides_app/Theme/shadows.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/text_styles.dart';

import 'item_detail_view.dart';

class ItemListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarColorLight,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
        title: Text("Items"),
        bottom: PreferredSize(

          preferredSize: Size.fromHeight(70),
          child: GestureDetector(
            child: Container(

              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, color: AppColors.fontColorBlack,),
                  SizedBox(width: MarginSizes.xs,),
                  Text("Search", style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.h4),),
                ],
              ),
              height: 50,margin: EdgeInsets.only(left: MarginSizes.side, right: MarginSizes.side, bottom: MarginSizes.s),
              decoration: BoxDecoration(
                  boxShadow: [
                    Shadows.whiteBackgroundShadow
                  ]
                  ,
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.backgroundColorWhite
              )
            ),
          ),

        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(decoration: BoxDecorations.solidButton,
        child: Row(mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: (){
                Get.to(FilteringView());
              },
              child: Container(width: 150, height: 60,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.filter_alt, color: AppColors.fontColorWhite,),
                    SizedBox(width: MarginSizes.xs,),
                    Text("필터",style: getBoldKrFont(AppColors.fontColorWhite, FontSizes.h4),
                    )
                  ]
                   ),
              ),
            ),
            Container(height: 50, width: 1, color: AppColors.backgroundColorWhite,),
            GestureDetector(
              onTap: (){
                Get.bottomSheet(
                  Container(
                    decoration: BoxDecorations.lightCard,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MarginSizes.m,
                        ),
                        Titles.h2(
                          "정렬"
                        ),
                        SizedBox(
                          height: MarginSizes.m,
                        ),
                        Divider(),

                        Container(
                          height: 60,
                          alignment: Alignment.centerLeft,
                          margin: AppEdgeInsets.sideEdgeInsets,
                          child: Text("번호순",style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph), ),
                        ),
                        Divider(),
                        Container(
                          height: 60,
                          alignment: Alignment.centerLeft,
                          margin: AppEdgeInsets.sideEdgeInsets,
                          child: Text("이름순",style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph), ),
                        ),
                        Divider(),
                        Container(
                          height: 60,
                          alignment: Alignment.centerLeft,
                          margin: AppEdgeInsets.sideEdgeInsets,
                          child: Text("능력치순",style: getRegularKrFont(AppColors.fontColorBlack, FontSizes.paragraph), ),
                        ),
                        Divider(),
                      ],
                    )
                  )
                );
              },
              child: Container(width: 150, height: 60,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.sort, color: AppColors.fontColorWhite,),
                      SizedBox(width: MarginSizes.xs,),
                      Text("이름순",style: getBoldKrFont(AppColors.fontColorWhite, FontSizes.h4),
                      )
                    ]
                ),),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: AppEdgeInsets.listEdgeInsets,
              shrinkWrap: true,
              itemCount: Data.itemList!.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: MarginSizes.m,mainAxisSpacing: MarginSizes.m,
                crossAxisCount: 3, //TODO: 적응형으로 갯수 늘리기
                childAspectRatio: 3/4,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ItemCard(item: Data.itemList![index]);
              },
            ),
          )
        ],
      ),
    );
  }

  


}
