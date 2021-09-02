import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pokemon_guides_app/Theme/darkNeumorphicThemeData.dart';
import 'package:pokemon_guides_app/Theme/lightNeumorphicThemeData.dart';
import 'package:pokemon_guides_app/Theme/neumorphicStyles.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'Components/Common/GlobalSearchBar.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: lightNeumorphicThemeData,
      darkTheme: darkNeumorphicThemeData,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: NeumorphicFloatingActionButton(
        child: Icon(Icons.add, size: 30),
        onPressed: () {
          _changeTheme(context);
        },
      ),
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
                      Color(0xFFE8EBF2)
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
                          runSpacing: 30,spacing: 30,
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

  void _changeTheme(BuildContext context){
    NeumorphicTheme.of(context).themeMode =
    NeumorphicTheme.isUsingDark(context)
        ? ThemeMode.light
        : ThemeMode.dark;
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
        return NeumorphicButton(
          padding: EdgeInsets.all(10),
          style: NeumorphicStyle(
            color: Colors.white,
            shape: NeumorphicShape.flat
          ),
          child: Container(
            width: 140,height: 150,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: 4,
                  child: Container(
                    height: 100,width: 140,
                      child: DropShadowImage(
                        scale: 0.8,
                          image: Image.asset("assets/pika.png"))
                  ),
                ),
                 Positioned(
                   bottom:4,
                     child: Text("포켓몬", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Color(0xFF666666), fontFamily: "NotoSans"),))
              ],
            )
          ),
          onPressed: (){
          },
    );
  }

  Widget _mainCard(){
    return NeumorphicButton(
      padding: EdgeInsets.all(30),
      style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          color: Colors.white,
          shadowLightColor: Colors.white70
      ),
      child: Container(
        width: 300,height: 40,

      ),
      margin: EdgeInsets.all(0),
      onPressed: (){

      },
    );
  }
}