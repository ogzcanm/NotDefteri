import 'package:flutter/material.dart';

//light mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    inversePrimary: Colors.grey.shade300,
  ),
);

//dark mode
ThemeData pinkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: const Color.fromARGB(255, 240, 119, 202),
    primary: const Color.fromARGB(255, 241, 142, 210),
    secondary: Colors.grey.shade700,
    inversePrimary: Colors.grey.shade300,
  ),
);
