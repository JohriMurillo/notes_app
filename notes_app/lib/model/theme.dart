import 'package:flutter/material.dart';
const fontFamily = 'Poppins';

final themeDark = ThemeData(
  brightness: Brightness.dark,
  primaryColorDark: const Color(0xffC0392B),
  primaryColor: const Color(0xffC0392B),
  highlightColor: const Color(0xffC0392B),
  canvasColor: Colors.white,
  cardColor: const Color.fromARGB(255, 21, 70, 70),
  fontFamily: fontFamily,
  splashColor: const Color.fromARGB(0, 153, 66, 66),
  scaffoldBackgroundColor: const Color.fromARGB(255, 13, 14, 14),
  appBarTheme: const AppBarTheme(
     color: Color.fromARGB(255, 13, 14, 14),
    elevation: 10.0,
    ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(
    secondary: const Color(0xffC0392B),
    brightness: Brightness.dark,
    ),  
  );