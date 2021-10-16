import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Components/MyAppBar/app_title.dart';
import 'package:pokemon_guides_app/Datas/data.dart';
import 'package:pokemon_guides_app/JsonDecoders/pokemon_model.dart';
import 'package:pokemon_guides_app/JsonDecoders/data_json_decoder.dart';
import 'package:pokemon_guides_app/Pages/pokemon_list_view.dart';
import 'package:pokemon_guides_app/Pages/item_list_view.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/images.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/text_styles.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'Components/MyHomePage/GlobalSearchBar.dart';
import 'Components/Common/trainer_card.dart';
import 'Theme/shadows.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Data.initData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: false,
          backgroundColor: AppColors.backgroundColorLight,
            foregroundColor: AppColors.fontColorBlack,
          elevation: 0,
            iconTheme: IconThemeData(color: AppColors.fontColorBlack),

      ),
        backgroundColor: AppColors.backgroundColorLight,
        primaryColor: AppColors.brandColor
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorLight,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColorLight,
        title: AppTitleText(context),
        elevation: 0,
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: marginSizeSide, right: marginSizeSide),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: marginSizeBlock),
                        GlobalSearchBar(),
                        SizedBox(height: marginSizeBlock),
                        Text("가이드", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h1),),
                        SizedBox(height: marginSizeM,),
                        Container(
                          width: double.infinity,
                          child: Wrap(

                            alignment: WrapAlignment.spaceEvenly,
                            spacing: marginSizeM,
                            runSpacing: marginSizeM,
                            children: [
                              GuideElementButton("포켓몬", PokemonListView(), AppImages.pokemonsButton),
                              GuideElementButton("기술", PokemonListView(), Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: AppImages.movesButton,
                              )),
                              GuideElementButton("아이템", ItemListView(), AppImages.itemsButton),
                              GuideElementButton("속성", PokemonListView(), AppImages.pokemonsButton),
                              GuideElementButton("지도", PokemonListView(), AppImages.pokemonsButton),
                              GuideElementButton("내 정보", PokemonListView(), AppImages.pokemonsButton),
                            ],
                          ),
                        ),
                        SizedBox(height: marginSizeBlock),

                      ],
                    ),
                  ),

                ],
              ),
            ]
        ),
      ),
    );
  }

  Widget GuideElementButton(String title, Widget page, Widget image){
    return MaterialButton(
      onPressed: (){
        Get.to(page, transition: Transition.fadeIn);
      },
      child: Column(
        children: [

          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  Shadows.whiteBackgroundShadow
                ]
                ,
                borderRadius: BorderRadius.circular(15),
                color: AppColors.backgroundColorWhite
            ),
            width: 80,height: 80,
              padding: EdgeInsets.all(10),
              child: image,

          ),
          SizedBox(height: marginSizeXS,),
          Text(title, style: getRegularKrFont(AppColors.fontColorGrey, FontSizes.h2),)
        ],
      )
    );
  }



}