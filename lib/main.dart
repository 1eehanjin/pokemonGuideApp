import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pokemon_guides_app/Theme/darkNeumorphicThemeData.dart';
import 'package:pokemon_guides_app/Theme/lightNeumorphicThemeData.dart';
import 'package:pokemon_guides_app/Theme/neumorphicStyles.dart';

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
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 100),

            TitleText(context),

            SizedBox(height: 100),

            GlobalSearchBar(),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                runSpacing: 20,spacing: 20,
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
            )
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
      alignment: Alignment.center,
      child: Text(
        "Pokemon Guide", style: TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold,color:Colors.teal
      ),
      ),
    );
  }

  Widget _pageCard(String imagePath, String name){
    return NeumorphicButton(
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat
      ),
      child: Container(
        width: 120, height: 80,
      ),
      onPressed: (){

      },
    );
  }

}