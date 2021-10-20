import 'package:flutter/material.dart';
import 'package:pokemon_guides_app/Theme/text_styles.dart';

import 'color.dart';

class AppBarThemes {

  static AppBarTheme appBarThemeLight = AppBarTheme(
    centerTitle: false,
    backgroundColor: AppColors.backgroundColorLight,
    elevation: 10,

    shadowColor: AppColors.shadowAppbarColor,
    iconTheme: IconThemeData(color: AppColors.fontColorBlack),
    textTheme: TextTheme(
      headline6: getBoldKrFont(AppColors.fontColorBlack, 20),
    )
  );


}



