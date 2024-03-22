// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import "package:insta/theme/theme.dart";

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  ThemeProvider(this._themeData);
  ThemeData get theme => _themeData;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = DarkMode;
    } else {
      themeData = lightMode;
    }
  }
}
