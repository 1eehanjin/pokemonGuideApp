import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Components/MyHomePage/global_search_bar.dart';
import 'package:pokemon_guides_app/Components/Common/type_image.dart';
import 'package:pokemon_guides_app/Components/Common/item_card.dart';
import 'package:pokemon_guides_app/Components/Common/pokemon_card.dart';
import 'package:pokemon_guides_app/Datas/data.dart';
import 'package:pokemon_guides_app/JsonDecoders/pokemon_model.dart';
import 'package:pokemon_guides_app/JsonDecoders/data_json_decoder.dart';
import 'package:pokemon_guides_app/Pages/pokemon_detail_view.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/shadows.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/text_styles.dart';

import 'item_detail_view.dart';

class ItemListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Items",style: getBoldKrFont(AppColors.fontColorBlack, 20),),
      ),
      body: Column(
        children: [
          SizedBox(height:24),
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.only(left: MarginSizes.side-5, right: MarginSizes.side-5),
                shrinkWrap: true,
                itemCount: Data.itemList!.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(

                  crossAxisCount: 3,
                  childAspectRatio: 3/4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(child: ItemCard(item: Data.itemList![index]),
                    onTap: (){
                      Get.to(ItemDetailView(), arguments: Data.itemList![index], transition: Transition.fade);
                    },

                  );
                },
              ),
              )

        ],
      ),
    );
  }


}
