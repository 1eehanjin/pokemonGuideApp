import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:pokemon_guides_app/JsonDecoders/pokemon_model.dart';
import 'package:pokemon_guides_app/JsonDecoders/item_model.dart';
import 'package:pokemon_guides_app/Pages/pokemon_detail_view.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/shadows.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/text_styles.dart';

import 'type_image.dart';

class ItemCard extends StatelessWidget {
  ItemCard({Key? key, required this.item}) : super(key: key);
  ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 5, right: 5, top: 10),
        decoration: BoxDecoration(

            boxShadow: [
              Shadows.whiteBackgroundShadow
            ]
            ,
            borderRadius: BorderRadius.circular(15),


            color: AppColors.backgroundColorWhite
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,mainAxisSize: MainAxisSize.max,
          children: [
            AspectRatio(
                aspectRatio: 1.3,
                child: Hero(
                    tag: item.name,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CachedNetworkImage(imageUrl: item.imageUrl, fit:BoxFit.cover),
                    )
                )
            ),
            Expanded(

                child: Container(
                  padding: EdgeInsets.only(left: MarginSizes.s, right: MarginSizes.s, bottom: MarginSizes.m),
                    alignment: Alignment.center,
                    child: Text(item.name, style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.paragraph),textAlign: TextAlign.center,))),
          ],
        )
    );
  }

}
