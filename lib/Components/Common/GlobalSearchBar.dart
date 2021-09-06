
import 'package:flutter/material.dart';

class GlobalSearchBar extends StatefulWidget {
  const GlobalSearchBar({Key? key}) : super(key: key);

  @override
  _GlobalSearchBarState createState() => _GlobalSearchBarState();
}

class _GlobalSearchBarState extends State<GlobalSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        color: Colors.white70,
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          //width: MediaQuery.of(context).size.width*0.8,
          child: TextField(
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                icon: Icon(Icons.search,),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                labelText: 'Global Search...'
            ),
          ),
        ),
      )
    );
  }
}
