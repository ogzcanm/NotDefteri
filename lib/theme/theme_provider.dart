import 'package:flutter/material.dart';
import 'package:not/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  //initially, theme is light mode
  ThemeData _themeData = lightMode;

  //setter method to access the thene from other parts of the code
  ThemeData get themeData => _themeData;

  //setter method to see if we are in dark mode or not
  bool get isDarkMode => _themeData == pinkMode;

  //setter method to set the new theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  //we will use this toggle in a switch later on..
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = pinkMode;
    } else {
      themeData = lightMode;
    }
  }
}
