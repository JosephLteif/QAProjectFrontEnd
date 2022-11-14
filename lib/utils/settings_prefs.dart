import 'package:flutter/material.dart';
import 'package:qa/utils/storage_manager.dart';

import 'material_color.dart';

class SettingsNotifier extends ChangeNotifier{
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    dividerColor: Colors.black12,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,     
      textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white, 
        fixedSize: const Size.fromWidth(100)
      )
    ),
  );

  final lightTheme = ThemeData(
    primaryColorLight: Colors.white,
    primarySwatch: generateMaterialColor(Colors.white),
    primaryColor: const Color.fromRGBO(95, 0, 196, 40),
    brightness: Brightness.light,
    backgroundColor: const Color.fromARGB(235, 210, 208, 208),
    dividerColor: Colors.white54,
     buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,     
      textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color
    ),
    textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      fixedSize: const Size.fromWidth(100)

    ))
  );
  ThemeData _themeData = ThemeData();
  ThemeData getTheme() => _themeData;
SettingsNotifier() {
    StorageManager.readData('themeMode').then((value) {
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = darkTheme;
        StorageManager.saveData('themeMode', 'light');
      } else {
        print('setting dark theme');
        _themeData = darkTheme ;
      }
      notifyListeners();
    });
   
  }
}