import 'package:flutter/material.dart';

class Theme {
  static const primary = Color.fromRGBO(204, 0, 0, 1);
  static const secondary = Color.fromRGBO(59, 76, 202, 1);
  static const tertiar = Color.fromRGBO(255, 222, 0, 1);
  

  /*static const quinto = Color.fromRGBO(105, 48, 195, 5);*/

  static ThemeData themelight = ThemeData.light().copyWith(
    primaryColor: primary,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
  );
  static ThemeData themedark = ThemeData.dark().copyWith(
    primaryColor: secondary,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
  );
}


