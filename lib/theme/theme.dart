import "package:flutter/material.dart";

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme.light(
      background: Colors.white10, primary: Colors.white10),
  brightness: Brightness.light,
);

ThemeData DarkMode = ThemeData(
  colorScheme:
      const ColorScheme.light(background: Colors.black, primary: Colors.black),
  brightness: Brightness.dark,
);
