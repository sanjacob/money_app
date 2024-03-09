import 'package:flutter/material.dart';

class MainColorScheme {
  static Color primary = const Color(0xffc0028b);
  static Color secondary = const Color(0xfff9e6f3);
  static Color tertiary = const Color(0xfff7f7f7);

  static Color black = const Color(0xff18191a);
  static Color darkGrey  = const Color(0xff242526);
  static Color grey = const Color(0xff3a3b3c);
  static Color lightGrey = const Color(0xffb0b3b8);
  static Color white = const Color(0xffe4e6eb);

  static ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      secondary: secondary,
      tertiary: tertiary
  );
}