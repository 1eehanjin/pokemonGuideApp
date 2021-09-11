import 'package:flutter/material.dart';

Widget TitleText(BuildContext context){
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