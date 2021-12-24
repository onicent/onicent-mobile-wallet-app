import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/storage_manager.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(

    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xff141621),
      ),
      backgroundColor: Color(0xff141621),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
      ),
      elevation: 0.0,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Color(0xff090d18),
    backgroundColor: Color(0xff1b212d),
    buttonColor: Color(0xFF1273fe),
    dividerColor: Color(0xff222a39),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Color(0xff2a374b),
      filled: true
    ),


  );

  final lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF303E9F),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
      ),
      elevation: 0.0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xFF303E9F),
      ),
    ),

    scaffoldBackgroundColor: Color(0xFFededee),
    backgroundColor: Color(0xFFFFFFFF),
    buttonColor: Color(0xFF1273FE),
    dividerColor: Color(0xFFF6F6FD),

    inputDecorationTheme: const InputDecorationTheme(
        fillColor: Color(0xFFC3C6C9),
        filled: true
    ),

  );

  ThemeData? _themeData;
  ThemeData? getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
    return 0;
  }

  setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
    return 1;
  }
}
