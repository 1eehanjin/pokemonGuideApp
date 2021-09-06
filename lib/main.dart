import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Pages/PokemonListView.dart';
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
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: <Widget>[
            Stack(
              children: [
                WaveWidget(
                  waveAmplitude: 20,
                  config: CustomConfig(
                    colors: [
                      Colors.lightBlue,
                      Colors.white54,
                      Colors.white30,
                      Colors.white
                    ],
                    durations: [35000, 19440, 10800, 6000],
                    heightPercentages: [0.07, 0.1, 0.12, 0.15],
                    blur: MaskFilter.blur(BlurStyle.solid, 10),

                  ),


                  size: Size(
                      double.infinity,
                      1500
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 10),

                    TitleText(context),

                    SizedBox(height: 40),
                    _mainCard(),
                    SizedBox(height: 70),
                    GlobalSearchBar(),

                    SizedBox(height: 50),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          runSpacing: 10,spacing: 10,
                          children: [
                            _pageCard("imagePath", "name"),
                            _pageCard("imagePath", "name"),
                            _pageCard("imagePath", "name"),
                            _pageCard("imagePath", "name"),
                            _pageCard("imagePath", "name"),
                            _pageCard("imagePath", "name"),
                            _pageCard("imagePath", "name")
                          ],
                        ),
                      ),
                    ),
                  ],
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
      margin: EdgeInsets.only(left: 30),
      alignment: Alignment.centerLeft,
      child: Text(
        "Pokemon Life", style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold,color:Colors.white
      ),
      ),
    );
  }

  Widget _pageCard(String imagePath, String name){
        return MaterialButton(
          padding: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x447090B0),
                  offset: Offset(0, 16),
                  blurRadius: 16
                )
              ]
            ),
            width: 140,height: 150,
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
                     child: Text("포", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Color(0xFF666666), fontFamily: "NotoSans"),))
              ],
            )
          ),
          onPressed: (){
            Get.to(PokemonListView());
          },
    );
  }

  Widget _mainCard(){
    return MaterialButton(

      color:Colors.white,
      padding: EdgeInsets.all(30),
      child: Container(
        width: 300,height: 40,
      ),
      onPressed: (){
      },
    );
  }
}