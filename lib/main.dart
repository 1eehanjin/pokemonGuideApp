import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pokemon_guides_app/Theme/LightNeumorphicThemeData.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFDDDDDD),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: DarkNeumorphicThemeData,
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
        onPressed: () {},
      ),
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: ListView(
        children: <Widget>[
        Column(
        mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        //Title(color: color, child: child)
        TitleText(context),
        profileCard(context),
        SearchBar(context),
        NeumorphicButton(
          onPressed: () {
            print("onClick");
          },
          style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.circle(),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Icon(
            Icons.favorite_border,
            color: _iconsColor(context),
          ),
        ),
        NeumorphicButton(
            margin: EdgeInsets.only(top: 12),
            onPressed: () {
              NeumorphicTheme.of(context).themeMode =
              NeumorphicTheme.isUsingDark(context)
                  ? ThemeMode.light
                  : ThemeMode.dark;
            },
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape:
              NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
            ),
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Toggle Theme",
              style: TextStyle(color: _textColor(context)),
            )),
        NeumorphicButton(
            margin: EdgeInsets.only(top: 12),
            onPressed: () {

            },
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape:
              NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
              //border: NeumorphicBorder()
            ),
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Go to full sample",
              style: TextStyle(color: _textColor(context)),
            )),
         ],
         )
        ]


      ),
    );
  }

  Color _iconsColor(BuildContext context) {
    final theme = NeumorphicTheme.of(context);
    if (theme.isUsingDark) {
      return theme.current.accentColor;
    } else {
      return null;
    }
  }

  Color _textColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Widget TitleText(BuildContext context){
    return Text(
      "Pokemon Life", style: TextStyle(
      fontSize: 30
    ),
    );
  }

  Widget SearchBar(BuildContext context){
    return Neumorphic(
      child: Container(
        width: MediaQuery.of(context).size.width*0.9,
        alignment: Alignment.center,
        child: Container(
          //width: MediaQuery.of(context).size.width*0.8,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              labelText: 'Global Search...'
            ),
          ),
        ),
      )
    );
  }

  Widget profileCard(BuildContext context) {
    return Neumorphic(
        style: NeumorphicStyle(
          border: NeumorphicBorder(color: Colors.white,width: 0.3),
          depth: 10,
          shape: NeumorphicShape.flat,
          ),
      child: Container(
        width: 100, height: 100,
      )
    );
  }
}