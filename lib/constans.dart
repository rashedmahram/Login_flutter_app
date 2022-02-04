import 'package:flutter/material.dart';

Color whiteColor=const Color(0xfff1f3f8);
Color yellowColor=const Color(0xffffc93c);

ThemeData get theme=>ThemeData(
  inputDecorationTheme:InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: yellowColor),
        ),
  ),
);