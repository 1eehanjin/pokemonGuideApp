import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Components/Common/titles.dart';
import 'package:pokemon_guides_app/Components/MyHomePage/guide_buttons_grid.dart';
import 'package:pokemon_guides_app/Datas/data.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';

import 'Components/MyHomePage/global_search_bar.dart';
import 'Theme/theme_datas.dart';


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
      theme: ThemeDatas.lightThemeData,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          SizedBox(height: MarginSizes.block * 4),

          Titles.h1("Pokemon Life"),
          SizedBox(height: MarginSizes.block ,),

          GlobalSearchBar(),
          SizedBox(height: MarginSizes.block),

          Titles.h2("가이드"),

          GuideButtonsGrid(),
          SizedBox(height: MarginSizes.block),
          //TODO: 커뮤니티 추가
        ],
      ),
    );
  }
}