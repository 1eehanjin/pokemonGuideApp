import 'package:flutter/material.dart';

import 'app_bar_themes.dart';
import 'color.dart';

class ThemeDatas {
  static ThemeData lightThemeData = ThemeData(
      appBarTheme: AppBarThemes.appBarThemeLight,
      scaffoldBackgroundColor: AppColors.backgroundColorLight,
      primaryColor: AppColors.brandColor
  );

}