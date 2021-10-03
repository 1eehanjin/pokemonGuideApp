import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Components/MyAppBar/AppTitleText.dart';
import 'package:pokemon_guides_app/Datas/Data.dart';
import 'package:pokemon_guides_app/JsonDecoders/JsonPokemonModel.dart';
import 'package:pokemon_guides_app/JsonDecoders/PokemonJsonDecoder.dart';
import 'package:pokemon_guides_app/Pages/PokemonListView.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/textStyles.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'Components/Common/GlobalSearchBar.dart';
import 'Components/Common/TrainerCard.dart';
import 'Components/MyHomePage/TitleText.dart';
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
      drawer: Drawer(),
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
                  SizedBox(height: marginSizeBlock),
                  SizedBox(height: marginSizeBlock),
                  TrainerCard(),

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
                              GuideElementButton("포켓몬"),
                              GuideElementButton("기술"),
                              GuideElementButton("아이템"),
                              GuideElementButton("속성"),
                              GuideElementButton("지도"),
                              GuideElementButton("내 정보"),
                            ],
                          ),
                        ),
                        SizedBox(height: marginSizeBlock),
                        Text("포켓몬 뉴스", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h1),),
                        SizedBox(height: marginSizeM),
                        Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                color: AppColors.backgroundColorGrey,
                              ),
                              Expanded(
                                  child: Container(

                                    height: 80,
                                    color: AppColors.backgroundColorLight,
                                  ),)
                            ],
                          ),
                        ),
                        SizedBox(height: marginSizeM),
                        Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                color: AppColors.backgroundColorGrey,
                              ),
                              Expanded(
                                child: Container(

                                  height: 80,
                                  color: AppColors.backgroundColorLight,
                                ),)
                            ],
                          ),
                        ),
                        SizedBox(height: marginSizeM),
                        Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                color: AppColors.backgroundColorGrey,
                              ),
                              Expanded(
                                child: Container(

                                  height: 80,
                                  color: AppColors.backgroundColorLight,
                                ),)
                            ],
                          ),
                        ),
                        SizedBox(height: marginSizeColorBlock),

                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: AppColors.backgroundColorLight,
                    padding: EdgeInsets.only(left: marginSizeSide,right: marginSizeSide,top: marginSizeColorBlock),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("커뮤니티", style: getBoldKrFont(AppColors.fontColorBlack, FontSizes.h1),),
                        SizedBox(height: marginSizeM,),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColorWhite, borderRadius: BorderRadius.circular(10)
                          ),
                          height: 300,
                        ),
                        SizedBox(height: marginSizeColorBlock,)
                      ],

                    )
                  )


                ],
              ),
            ]
        ),
      ),
    );
  }

  Widget GuideElementButton(String title){
    return MaterialButton(
      onPressed: (){
        Get.to(PokemonListView());
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
              child: Image.asset("assets/images/pika.png"),
            alignment: Alignment.center,
          ),
          SizedBox(height: marginSizeXS,),
          Text(title, style: getRegularKrFont(AppColors.fontColorGrey, FontSizes.h2),)
        ],
      )
    );
  }



}