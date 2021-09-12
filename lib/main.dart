import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Components/MyAppBar/AppTitleText.dart';
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


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: backgroundColorWhite,
      appBar: AppBar(
        iconTheme: IconThemeData(color: fontColorBlack),
        backgroundColor: backgroundColorWhite,
        centerTitle: false,
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
                        Text("가이드", style: getBoldKrFont(fontColorBlack, fontSize48),),
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
                        Text("포켓몬 뉴스", style: getBoldKrFont(fontColorBlack, fontSize48),),
                        SizedBox(height: marginSizeM),
                        Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                color: lineColorGrey,
                              ),
                              Expanded(
                                  child: Container(

                                    height: 80,
                                    color: backgroundColorLight,
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
                                color: lineColorGrey,
                              ),
                              Expanded(
                                child: Container(

                                  height: 80,
                                  color: backgroundColorLight,
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
                                color: lineColorGrey,
                              ),
                              Expanded(
                                child: Container(

                                  height: 80,
                                  color: backgroundColorLight,
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
                    color: backgroundColorLight,
                    padding: EdgeInsets.only(left: marginSizeSide,right: marginSizeSide,top: marginSizeColorBlock),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("커뮤니티", style: getBoldKrFont(fontColorBlack, fontSize48),),
                        SizedBox(height: marginSizeM,),
                        Container(
                          decoration: BoxDecoration(
                            color: backgroundColorWhite, borderRadius: BorderRadius.circular(10)
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
        print("1");
      },
      child: Column(
        children: [

          Container(
            width: 60,height: 60,
              child: Image.asset("assets/pika.png"),
            alignment: Alignment.center,
          ),
          SizedBox(height: marginSizeXS,),
          Text(title, style: getRegularKrFont(fontColorGrey, fontSize36),)
        ],
      )
    );
  }



}