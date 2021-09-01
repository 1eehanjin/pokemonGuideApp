import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Color iconsColor(BuildContext context) {
  final theme = NeumorphicTheme.of(context);
  if (theme.isUsingDark) {
    return theme.current.accentColor;
  } else {
    return null;
  }
}

Color textColor(BuildContext context) {
  if (NeumorphicTheme.isUsingDark(context)) {
    return Colors.white;
  } else {
    return Colors.black;
  }
}