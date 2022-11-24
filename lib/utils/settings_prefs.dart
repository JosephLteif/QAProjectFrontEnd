import 'package:flutter/material.dart';
import 'package:qa/utils/storage_manager.dart';

import 'material_color.dart';

class SettingsNotifier extends ChangeNotifier {
  bool isDarkMode = false;
  final darkTheme = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF343434),
        iconColor: Colors.grey,
        labelStyle: TextStyle(
          color: Colors.grey,
        )),
    cardColor: Color(0xFF343434),
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF1E1E1E),
    backgroundColor: const Color(0xFF212121),
    dividerColor: Colors.black12,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,
      textTheme:
          ButtonTextTheme.primary, //  <-- this auto selects the right color
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            fixedSize: const Size.fromWidth(100))),
  );

  final lightTheme = ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
          counterStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black)),
          suffixIconColor: Colors.black,
          filled: true,
          fillColor: Colors.transparent,
          iconColor: Colors.black,
          labelStyle: TextStyle(
            color: Colors.black,
          )),
      cardColor: Colors.grey,
      primaryColorLight: Colors.white,
      primarySwatch: generateMaterialColor(Colors.white),
      primaryColor: const Color.fromRGBO(95, 0, 196, 40),
      brightness: Brightness.light,
      backgroundColor: const Color.fromARGB(235, 210, 208, 208),
      dividerColor: Colors.white54,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.deepPurple,
        textTheme:
            ButtonTextTheme.primary, //  <-- this auto selects the right color
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              fixedSize: const Size.fromWidth(100))));
  ThemeData _themeData = ThemeData();
  ThemeData getTheme() => _themeData;
  SettingsNotifier() {
    StorageManager.readData('themeMode').then((value) {
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
        isDarkMode = false;
        StorageManager.saveData('themeMode', 'light');
      } else {
        print('setting dark theme');
        isDarkMode = true;
        _themeData = darkTheme;
        StorageManager.saveData('themeMode', 'dark');
      }
      notifyListeners();
    });
  }

  getThemeMode() {
    return isDarkMode;
  }

  ToggleTheme() {
    if (!isDarkMode) {
      _themeData = darkTheme;
      isDarkMode = true;
    } else {
      _themeData = lightTheme;
      isDarkMode = false;
    }
    notifyListeners();
  }
}
