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
                  Container(
                      margin: EdgeInsets.only(bottom:20, left: marginSizeSide, right: marginSizeSide),
                      decoration: BoxDecoration(
                          color: Colors.red[400],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 20,
                            offset: Offset(0, 10), // changes position of shadow
                          ),
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 20,
                              offset: Offset(0, 0), // changes position of shadow
                            ),
                          ]
                      ),
                      child: AspectRatio
                        (
                          aspectRatio: 1.6,
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 20,left: 20,
                                  child: Text("Trainer Card",
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white38, fontSize: fontSize36),)
                              ),

                              Positioned(
                                  top: 60,left: 30,
                                  child: Text("Name",
                                    style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white60, fontSize: fontSize28),)
                              ),
                              Positioned(
                                  top: 80,left: 30,
                                  child: Text("Hanjin LEE",
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: fontSize40),)
                              ),

                              Positioned(
                                  top: 120,left: 30,
                                  child: Text("Friend Code",
                                    style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white60, fontSize: fontSize28),)
                              ),
                              Positioned(
                                  top: 140,left: 30,
                                  child: Text("1234-5678-9101-1121",
                                    style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: fontSize28),)
                              ),

                              Positioned(
                                right: 16,top: -32,
                                child: Container(
                                  height: 200,width: 200,
                                  child:Image.asset("assets/pokeball.png",color: Colors.white,),

                                ),
                              ),

                              Positioned(
                                right: 30,top: 30,
                                child: Container(
                                    height: 150,width: 150,
                                    child:Image.asset("assets/pika.png")
                                ),
                              ),

                              Positioned(
                                  bottom: 20,left: 80,
                                  child: Text("Pokemon Collected: 254 / 524 ",
                                    style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white70, fontSize: fontSize28),)
                              ),

                            ],
                          )

                      )

                  ),

                  Padding(
                    padding: EdgeInsets.only(left: marginSizeSide, right: marginSizeSide),
                    child: Column(
                      children: [


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
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ]
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