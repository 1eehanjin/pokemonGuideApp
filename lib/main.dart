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

        backgroundColor: backgroundColorWhite,
        centerTitle: false,
        title: AppTitleText(context),

      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(left: marginSizeSide, right: marginSizeSide),
          child: ListView(
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(height: marginSizeBlock),

                    TitleText(context),

                    SizedBox(height: marginSizeBlock),

                    GlobalSearchBar(),

                    SizedBox(height: marginSizeBlock),

                    StaggeredGridView.countBuilder(

                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 4,
                      itemCount: 8,

                      itemBuilder: (BuildContext context, int index) =>

                      GridElement(index),
                      staggeredTileBuilder: (int index) =>
                      new StaggeredTile.count(2, index.isEven ? 2 : 1),
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                    )
                  ],
                ),
              ]
          ),
        ),
      ),
    );
  }

  Widget GridElement(int index){
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorList[index]
        ),

        child: SizedBox(height:400,
          child: new Center(
            child: Text("가나다라", style:TextStyle(
                fontSize: 20,
                color:Colors.white, fontFamily: "NotoSansCJKkr", fontWeight: FontWeight.w700
            )
            ),
          ),
        )
    );
  }

  List<Color> colorList = [Color(0xFF9DC8C8),Color(0xFF58C9B9), Color(0xFF519D9E), Color(0xFFD1B6E1),
    Color(0xFF67D5B5),Color(0xFFEE7785), Color(0xFFC89EC4), Color(0xFF84B1ED),];

}