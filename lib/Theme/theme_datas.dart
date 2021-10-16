import 'package:flutter/material.dart';

import 'app_bar_themes.dart';
import 'color.dart';

class ThemeDatas {
  static final ThemeData lightThemeData = ThemeData(
      appBarTheme: AppBarThemes.appBarThemeLight,
      backgroundColor: AppColors.backgroundColorLight,
      primaryColor: AppColors.brandColor
  );

}