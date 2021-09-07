import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Pages/PokemonListView.dart';
import 'package:pokemon_guides_app/Theme/textStyles.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'Components/Common/GlobalSearchBar.dart';


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
      backgroundColor: Color(0xFFF8F8FA),
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: <Widget>[
            Stack(
              children: [
                // WaveWidget(
                //   waveAmplitude: 20,
                //   config: CustomConfig(
                //     colors: [
                //       Colors.lightBlue,
                //       Colors.white54,
                //       Colors.white30,
                //       Color(0xDDF8F8FA)
                //     ],
                //     durations: [35000, 19440, 10800, 6000],
                //     heightPercentages: [0.12, 0.15, 0.17, 0.2],
                //     blur: MaskFilter.blur(BlurStyle.solid, 10),
                //
                //   ),
                //
                //
                //   size: Size(
                //       double.infinity,
                //       1000
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right:24),
                  child: Column(
                    children: [
                      SizedBox(height: 60),
                      MainText(context),
                      SizedBox(height: 60),
                      GlobalSearchBar(),

                      SizedBox(height: 32),
                      Container(
                        width: double.infinity,
                        child: new StaggeredGridView.countBuilder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 4,
                          itemCount: 8,
                          itemBuilder: (BuildContext context, int index) => new Container(
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
                              )),
                          staggeredTileBuilder: (int index) =>
                          new StaggeredTile.count(2, index.isEven ? 2 : 1),
                          mainAxisSpacing: 16.0,
                          crossAxisSpacing: 16.0,
                        )
                      ),
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




  Widget TitleText(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,

      alignment: Alignment.centerLeft,
      child: Text(
        "Pokemon Life", style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold,color:Colors.blue
      ),
      ),
    );
  }

  Widget MainText(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,

      alignment: Alignment.centerLeft,
      child: Text(
        "이한진님,\n안녕하세요.", style: TextStyle(
        fontFamily: "NotoSansCJKkr",
          fontSize: 36, fontWeight: FontWeight.w700,color:Color(0xFF191919)
      ),
      ),
    );
  }

  Widget _pageCard(String imagePath, String name){
        return MaterialButton(
          padding: EdgeInsets.all(0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              // boxShadow: [
              //   BoxShadow(
              //     color: Color(0x447090B0),
              //     offset: Offset(0, 16),
              //     blurRadius: 16
              //   )
              // ]
            ),
            //width: 200,height: 200,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: 4,
                  child: Container(
                    height: 100,width: 100,
                      //child: Image.asset("assets/pika.png")
                  ),
                ),
                 Positioned(
                   bottom:10,
                    child: Text("가나", style: boldNotoSansCJKkr,))
              ],
            )
          ),
          onPressed: (){
            Get.to(PokemonListView());
          },
    );
  }

  List<Color> colorList = [Color(0xFF9DC8C8),Color(0xFF58C9B9), Color(0xFF519D9E), Color(0xFFD1B6E1),
    Color(0xFF67D5B5),Color(0xFFEE7785), Color(0xFFC89EC4), Color(0xFF84B1ED),];

}